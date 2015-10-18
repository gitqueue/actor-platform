package im.actor.server.cli

import akka.actor._

object ActorCliService {
  def start(system: ActorSystem): ActorRef =
    system.actorOf(Props(new ActorCliService), "cli")
}

final private class ActorCliService extends Actor with ActorLogging {
  protected val bots = context.actorOf(BotsCliService.props, "bots")

  def receive = Actor.emptyBehavior
}