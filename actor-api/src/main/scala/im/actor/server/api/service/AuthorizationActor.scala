package im.actor.server.api.service

import akka.actor._
import akka.stream.actor.ActorPublisher
import im.actor.server.mtproto.codecs.protocol.MessageBoxCodec
import im.actor.server.mtproto.protocol._
import im.actor.server.mtproto.transport._
import im.actor.server.api.util.rand
import im.actor.server.persist
import scala.annotation.tailrec
import scala.concurrent.Future
import scala.util.{ Success, Failure }
import scalaz._

object AuthorizationActor {
  @SerialVersionUID(1L)
  case class FrontendPackage(p: MTPackage)

  @SerialVersionUID(1L)
  case class SessionPackage(p: MTPackage)

  def props() = Props(new AuthorizationActor)
}

class AuthorizationActor extends Actor with ActorLogging with ActorPublisher[MTTransport] {
  import akka.stream.actor.ActorPublisherMessage._
  import AuthorizationActor._
  import context.dispatcher

  private var authId: Long = 0L
  private var buf = Vector.empty[MTPackage]

  def receive = {
    case FrontendPackage(p) =>
      val replyTo = sender()
      MessageBoxCodec.decode(p.messageBytes) match {
        case \/-((_, mb)) => handleMessageBox(p.authId, p.sessionId, mb, replyTo)
        case -\/(e) => replyTo ! ProtoPackage(Drop(0, 0, e.message))
      }
    case SessionPackage(p) =>
      if (buf.isEmpty && totalDemand > 0)
        onNext(ProtoPackage(p))
      else {
        buf :+= p
        deliverBuf()
      }
    case Request(_) =>
      deliverBuf()
  }

  private def handleMessageBox(pAuthId: Long, pSessionId: Long, mb: MessageBox, replyTo: ActorRef) = {
    @inline
    def sendPackage(messageId: Long, message: ProtoMessage) = {
      val mbBytes = MessageBoxCodec.encodeValid(MessageBox(messageId, message))
      replyTo ! ProtoPackage(MTPackage(authId, pSessionId, mbBytes))
    }

    @inline
    def sendDrop(msg: String) = replyTo ! ProtoPackage(Drop(mb.messageId, 0, msg))

    if (pAuthId == 0L) {
      if (pSessionId == 0L) sendDrop("sessionId must be equal to zero")
      else if (!mb.body.isInstanceOf[RequestAuthId]) sendDrop("non RequestAuthId message")
      else {
        val f =
          if (authId == 0L) {
            authId = rand.nextLong()
            persist.AuthId.create(authId, None)
          } else Future.successful()

        f.onComplete {
          case Success(_) => sendPackage(mb.messageId, ResponseAuthId(authId))
          case Failure(e) => sendDrop(e.getMessage)
        }
      }
    } else {
      if (authId == 0L) authId = pAuthId
      if (authId == pAuthId) ??? // sessionRegion.tell(SessionProtocol.Envelope(p.authId, p.sessionId, mb)
      else sendDrop("authId cannot be changed more than once")
    }
  }

  @tailrec
  private def deliverBuf(): Unit =
    if (totalDemand > 0) {
      if (totalDemand <= Int.MaxValue) {
        val (use, keep) = buf.splitAt(totalDemand.toInt)
        buf = keep
        use.foreach { p => onNext(ProtoPackage(p)) }
      } else {
        val (use, keep) = buf.splitAt(Int.MaxValue)
        buf = keep
        use.foreach { p => onNext(ProtoPackage(p)) }
        deliverBuf()
      }
    }
}
