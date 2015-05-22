//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/viewmodel/FileVM.java
//


#include "J2ObjC_source.h"
#include "im/actor/model/entity/FileReference.h"
#include "im/actor/model/files/FileSystemReference.h"
#include "im/actor/model/modules/Files.h"
#include "im/actor/model/modules/Modules.h"
#include "im/actor/model/mvvm/AsyncVM.h"
#include "im/actor/model/viewmodel/FileCallback.h"
#include "im/actor/model/viewmodel/FileVM.h"
#include "im/actor/model/viewmodel/FileVMCallback.h"

@interface AMFileVM () {
 @public
  ImActorModelModulesModules *modules_;
  AMFileReference *location_;
  id<AMFileCallback> callback_;
  id<AMFileVMCallback> vmCallback_;
}

@end

J2OBJC_FIELD_SETTER(AMFileVM, modules_, ImActorModelModulesModules *)
J2OBJC_FIELD_SETTER(AMFileVM, location_, AMFileReference *)
J2OBJC_FIELD_SETTER(AMFileVM, callback_, id<AMFileCallback>)
J2OBJC_FIELD_SETTER(AMFileVM, vmCallback_, id<AMFileVMCallback>)

@interface AMFileVM_OnNotDownloaded : NSObject

- (instancetype)initWithAMFileVM:(AMFileVM *)outer$;

@end

J2OBJC_EMPTY_STATIC_INIT(AMFileVM_OnNotDownloaded)

__attribute__((unused)) static void AMFileVM_OnNotDownloaded_initWithAMFileVM_(AMFileVM_OnNotDownloaded *self, AMFileVM *outer$);

__attribute__((unused)) static AMFileVM_OnNotDownloaded *new_AMFileVM_OnNotDownloaded_initWithAMFileVM_(AMFileVM *outer$) NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(AMFileVM_OnNotDownloaded)

@interface AMFileVM_OnDownloading : NSObject {
 @public
  jfloat progress_;
}

- (instancetype)initWithAMFileVM:(AMFileVM *)outer$
                       withFloat:(jfloat)progress;

- (jfloat)getProgress;

@end

J2OBJC_EMPTY_STATIC_INIT(AMFileVM_OnDownloading)

__attribute__((unused)) static void AMFileVM_OnDownloading_initWithAMFileVM_withFloat_(AMFileVM_OnDownloading *self, AMFileVM *outer$, jfloat progress);

__attribute__((unused)) static AMFileVM_OnDownloading *new_AMFileVM_OnDownloading_initWithAMFileVM_withFloat_(AMFileVM *outer$, jfloat progress) NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(AMFileVM_OnDownloading)

@interface AMFileVM_OnDownloaded : NSObject {
 @public
  id<AMFileSystemReference> fileSystemReference_;
}

- (instancetype)initWithAMFileVM:(AMFileVM *)outer$
       withAMFileSystemReference:(id<AMFileSystemReference>)fileSystemReference;

- (id<AMFileSystemReference>)getFileSystemReference;

@end

J2OBJC_EMPTY_STATIC_INIT(AMFileVM_OnDownloaded)

J2OBJC_FIELD_SETTER(AMFileVM_OnDownloaded, fileSystemReference_, id<AMFileSystemReference>)

__attribute__((unused)) static void AMFileVM_OnDownloaded_initWithAMFileVM_withAMFileSystemReference_(AMFileVM_OnDownloaded *self, AMFileVM *outer$, id<AMFileSystemReference> fileSystemReference);

__attribute__((unused)) static AMFileVM_OnDownloaded *new_AMFileVM_OnDownloaded_initWithAMFileVM_withAMFileSystemReference_(AMFileVM *outer$, id<AMFileSystemReference> fileSystemReference) NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(AMFileVM_OnDownloaded)

@interface AMFileVM_$1 : NSObject < AMFileCallback > {
 @public
  AMFileVM *this$0_;
}

- (void)onNotDownloaded;

- (void)onDownloading:(jfloat)progress;

- (void)onDownloaded:(id<AMFileSystemReference>)reference;

- (instancetype)initWithAMFileVM:(AMFileVM *)outer$;

@end

J2OBJC_EMPTY_STATIC_INIT(AMFileVM_$1)

J2OBJC_FIELD_SETTER(AMFileVM_$1, this$0_, AMFileVM *)

__attribute__((unused)) static void AMFileVM_$1_initWithAMFileVM_(AMFileVM_$1 *self, AMFileVM *outer$);

__attribute__((unused)) static AMFileVM_$1 *new_AMFileVM_$1_initWithAMFileVM_(AMFileVM *outer$) NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(AMFileVM_$1)

@implementation AMFileVM

- (instancetype)initWithAMFileReference:(AMFileReference *)location
                            withBoolean:(jboolean)isAutostart
         withImActorModelModulesModules:(ImActorModelModulesModules *)modules
                   withAMFileVMCallback:(id<AMFileVMCallback>)vmCallback {
  AMFileVM_initWithAMFileReference_withBoolean_withImActorModelModulesModules_withAMFileVMCallback_(self, location, isAutostart, modules, vmCallback);
  return self;
}

- (void)onObjectReceivedWithId:(id)obj {
  if ([obj isKindOfClass:[AMFileVM_OnNotDownloaded class]]) {
    [((id<AMFileVMCallback>) nil_chk(vmCallback_)) onNotDownloaded];
  }
  else if ([obj isKindOfClass:[AMFileVM_OnDownloading class]]) {
    [((id<AMFileVMCallback>) nil_chk(vmCallback_)) onDownloading:[((AMFileVM_OnDownloading *) nil_chk(((AMFileVM_OnDownloading *) check_class_cast(obj, [AMFileVM_OnDownloading class])))) getProgress]];
  }
  else if ([obj isKindOfClass:[AMFileVM_OnDownloaded class]]) {
    [((id<AMFileVMCallback>) nil_chk(vmCallback_)) onDownloaded:[((AMFileVM_OnDownloaded *) nil_chk(((AMFileVM_OnDownloaded *) check_class_cast(obj, [AMFileVM_OnDownloaded class])))) getFileSystemReference]];
  }
}

- (void)detach {
  [super detach];
  [((ImActorModelModulesFiles *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules_)) getFilesModule])) unbindFileWithLong:[((AMFileReference *) nil_chk(location_)) getFileId] withAMFileCallback:callback_ withBoolean:NO];
}

@end

void AMFileVM_initWithAMFileReference_withBoolean_withImActorModelModulesModules_withAMFileVMCallback_(AMFileVM *self, AMFileReference *location, jboolean isAutostart, ImActorModelModulesModules *modules, id<AMFileVMCallback> vmCallback) {
  (void) AMAsyncVM_init(self);
  self->modules_ = modules;
  self->location_ = location;
  self->vmCallback_ = vmCallback;
  self->callback_ = new_AMFileVM_$1_initWithAMFileVM_(self);
  [((ImActorModelModulesFiles *) nil_chk([((ImActorModelModulesModules *) nil_chk(modules)) getFilesModule])) bindFileWithAMFileReference:location withBoolean:isAutostart withAMFileCallback:self->callback_];
}

AMFileVM *new_AMFileVM_initWithAMFileReference_withBoolean_withImActorModelModulesModules_withAMFileVMCallback_(AMFileReference *location, jboolean isAutostart, ImActorModelModulesModules *modules, id<AMFileVMCallback> vmCallback) {
  AMFileVM *self = [AMFileVM alloc];
  AMFileVM_initWithAMFileReference_withBoolean_withImActorModelModulesModules_withAMFileVMCallback_(self, location, isAutostart, modules, vmCallback);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(AMFileVM)

@implementation AMFileVM_OnNotDownloaded

- (instancetype)initWithAMFileVM:(AMFileVM *)outer$ {
  AMFileVM_OnNotDownloaded_initWithAMFileVM_(self, outer$);
  return self;
}

@end

void AMFileVM_OnNotDownloaded_initWithAMFileVM_(AMFileVM_OnNotDownloaded *self, AMFileVM *outer$) {
  (void) NSObject_init(self);
}

AMFileVM_OnNotDownloaded *new_AMFileVM_OnNotDownloaded_initWithAMFileVM_(AMFileVM *outer$) {
  AMFileVM_OnNotDownloaded *self = [AMFileVM_OnNotDownloaded alloc];
  AMFileVM_OnNotDownloaded_initWithAMFileVM_(self, outer$);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(AMFileVM_OnNotDownloaded)

@implementation AMFileVM_OnDownloading

- (instancetype)initWithAMFileVM:(AMFileVM *)outer$
                       withFloat:(jfloat)progress {
  AMFileVM_OnDownloading_initWithAMFileVM_withFloat_(self, outer$, progress);
  return self;
}

- (jfloat)getProgress {
  return progress_;
}

@end

void AMFileVM_OnDownloading_initWithAMFileVM_withFloat_(AMFileVM_OnDownloading *self, AMFileVM *outer$, jfloat progress) {
  (void) NSObject_init(self);
  self->progress_ = progress;
}

AMFileVM_OnDownloading *new_AMFileVM_OnDownloading_initWithAMFileVM_withFloat_(AMFileVM *outer$, jfloat progress) {
  AMFileVM_OnDownloading *self = [AMFileVM_OnDownloading alloc];
  AMFileVM_OnDownloading_initWithAMFileVM_withFloat_(self, outer$, progress);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(AMFileVM_OnDownloading)

@implementation AMFileVM_OnDownloaded

- (instancetype)initWithAMFileVM:(AMFileVM *)outer$
       withAMFileSystemReference:(id<AMFileSystemReference>)fileSystemReference {
  AMFileVM_OnDownloaded_initWithAMFileVM_withAMFileSystemReference_(self, outer$, fileSystemReference);
  return self;
}

- (id<AMFileSystemReference>)getFileSystemReference {
  return fileSystemReference_;
}

@end

void AMFileVM_OnDownloaded_initWithAMFileVM_withAMFileSystemReference_(AMFileVM_OnDownloaded *self, AMFileVM *outer$, id<AMFileSystemReference> fileSystemReference) {
  (void) NSObject_init(self);
  self->fileSystemReference_ = fileSystemReference;
}

AMFileVM_OnDownloaded *new_AMFileVM_OnDownloaded_initWithAMFileVM_withAMFileSystemReference_(AMFileVM *outer$, id<AMFileSystemReference> fileSystemReference) {
  AMFileVM_OnDownloaded *self = [AMFileVM_OnDownloaded alloc];
  AMFileVM_OnDownloaded_initWithAMFileVM_withAMFileSystemReference_(self, outer$, fileSystemReference);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(AMFileVM_OnDownloaded)

@implementation AMFileVM_$1

- (void)onNotDownloaded {
  [this$0_ postWithId:new_AMFileVM_OnNotDownloaded_initWithAMFileVM_(this$0_)];
}

- (void)onDownloading:(jfloat)progress {
  [this$0_ postWithId:new_AMFileVM_OnDownloading_initWithAMFileVM_withFloat_(this$0_, progress)];
}

- (void)onDownloaded:(id<AMFileSystemReference>)reference {
  [this$0_ postWithId:new_AMFileVM_OnDownloaded_initWithAMFileVM_withAMFileSystemReference_(this$0_, reference)];
}

- (instancetype)initWithAMFileVM:(AMFileVM *)outer$ {
  AMFileVM_$1_initWithAMFileVM_(self, outer$);
  return self;
}

@end

void AMFileVM_$1_initWithAMFileVM_(AMFileVM_$1 *self, AMFileVM *outer$) {
  self->this$0_ = outer$;
  (void) NSObject_init(self);
}

AMFileVM_$1 *new_AMFileVM_$1_initWithAMFileVM_(AMFileVM *outer$) {
  AMFileVM_$1 *self = [AMFileVM_$1 alloc];
  AMFileVM_$1_initWithAMFileVM_(self, outer$);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(AMFileVM_$1)
