//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-proprietary/actor-apps/core-async/src/main/java/im/actor/model/mvvm/AppleListUpdate.java
//


#include "J2ObjC_source.h"
#include "im/actor/model/mvvm/AppleListUpdate.h"
#include "im/actor/model/mvvm/Move.h"
#include "java/lang/Integer.h"
#include "java/util/ArrayList.h"

@interface AMAppleListUpdate () {
 @public
  JavaUtilArrayList *removed_;
  JavaUtilArrayList *added_;
  JavaUtilArrayList *moved_;
  JavaUtilArrayList *updated_;
  jboolean isLoadMore__;
}

@end

J2OBJC_FIELD_SETTER(AMAppleListUpdate, removed_, JavaUtilArrayList *)
J2OBJC_FIELD_SETTER(AMAppleListUpdate, added_, JavaUtilArrayList *)
J2OBJC_FIELD_SETTER(AMAppleListUpdate, moved_, JavaUtilArrayList *)
J2OBJC_FIELD_SETTER(AMAppleListUpdate, updated_, JavaUtilArrayList *)

@implementation AMAppleListUpdate

- (instancetype)initWithRemoved:(JavaUtilArrayList *)removed
                      withAdded:(JavaUtilArrayList *)added
                      withMoved:(JavaUtilArrayList *)moved
                    withUpdated:(JavaUtilArrayList *)updated
                   withLoadMore:(jboolean)isLoadMore {
  AMAppleListUpdate_initWithRemoved_withAdded_withMoved_withUpdated_withLoadMore_(self, removed, added, moved, updated, isLoadMore);
  return self;
}

- (jint)removedCount {
  return [((JavaUtilArrayList *) nil_chk(removed_)) size];
}

- (jint)getRemoved:(jint)index {
  return [((JavaLangInteger *) nil_chk([((JavaUtilArrayList *) nil_chk(removed_)) getWithInt:index])) intValue];
}

- (jint)addedCount {
  return [((JavaUtilArrayList *) nil_chk(added_)) size];
}

- (jint)getAdded:(jint)index {
  return [((JavaLangInteger *) nil_chk([((JavaUtilArrayList *) nil_chk(added_)) getWithInt:index])) intValue];
}

- (jint)movedCount {
  return [((JavaUtilArrayList *) nil_chk(moved_)) size];
}

- (AMMove *)getMoved:(jint)index {
  return [((JavaUtilArrayList *) nil_chk(moved_)) getWithInt:index];
}

- (jint)updatedCount {
  return [((JavaUtilArrayList *) nil_chk(updated_)) size];
}

- (jint)getUpdated:(jint)index {
  return [((JavaLangInteger *) nil_chk([((JavaUtilArrayList *) nil_chk(updated_)) getWithInt:index])) intValue];
}

- (jint)size {
  return [((JavaUtilArrayList *) nil_chk(removed_)) size] + [((JavaUtilArrayList *) nil_chk(added_)) size] + [((JavaUtilArrayList *) nil_chk(moved_)) size] + [((JavaUtilArrayList *) nil_chk(updated_)) size];
}

- (jint)nonUpdateCount {
  return [((JavaUtilArrayList *) nil_chk(removed_)) size] + [((JavaUtilArrayList *) nil_chk(added_)) size] + [((JavaUtilArrayList *) nil_chk(moved_)) size];
}

- (jboolean)isLoadMore {
  return isLoadMore__;
}

@end

void AMAppleListUpdate_initWithRemoved_withAdded_withMoved_withUpdated_withLoadMore_(AMAppleListUpdate *self, JavaUtilArrayList *removed, JavaUtilArrayList *added, JavaUtilArrayList *moved, JavaUtilArrayList *updated, jboolean isLoadMore) {
  (void) NSObject_init(self);
  self->removed_ = removed;
  self->added_ = added;
  self->moved_ = moved;
  self->updated_ = updated;
  self->isLoadMore__ = isLoadMore;
}

AMAppleListUpdate *new_AMAppleListUpdate_initWithRemoved_withAdded_withMoved_withUpdated_withLoadMore_(JavaUtilArrayList *removed, JavaUtilArrayList *added, JavaUtilArrayList *moved, JavaUtilArrayList *updated, jboolean isLoadMore) {
  AMAppleListUpdate *self = [AMAppleListUpdate alloc];
  AMAppleListUpdate_initWithRemoved_withAdded_withMoved_withUpdated_withLoadMore_(self, removed, added, moved, updated, isLoadMore);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(AMAppleListUpdate)
