

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

#ifdef DEBUG
#define IS_DEBUG YES
#else
#define IS_DEBUG NO
#endif

@interface NSObject (CEHook)

/**
 使用runtime 替换类方法
 */
+ (void)cehook_classMethodSwizzling:(SEL)originalSelector to:(SEL)swizzledSelector;

/**
 使用runtime 替换实例方法
 */
- (void)cehook_instanceMethodSwizzling:(SEL)originalSelector to:(SEL)swizzledSelector;

@end
