
#import "NSObject+CEHook.h"

@implementation NSObject (CEHook)

- (void)cehook_instanceMethodSwizzling:(SEL)originSelector to:(SEL)swizzleSelector {
    Class class = [self class];
    
    Method originMethod = class_getInstanceMethod(class, originSelector);
    Method swizzleMethod = class_getInstanceMethod(class, swizzleSelector);
    
    if (!originMethod || !swizzleMethod) {
        return;
    }
    
    class_addMethod(class,
                    originSelector,
                    method_getImplementation(originMethod),
                    method_getTypeEncoding(originMethod));
    class_addMethod(class,
                    swizzleSelector,
                    method_getImplementation(swizzleMethod),
                    method_getTypeEncoding(swizzleMethod));
    
    ///< 添加完了之后要重新赋值，因为原来的两个method都是父类的。参考自见https://github.com/rentzsch/jrswizzle/blob/semver-1.x/JRSwizzle.m
    /// addMethod 返回 true 时，需要重新取 Method
    Method originMethod2 = class_getInstanceMethod(class, originSelector);
    Method swizzleMethod2 = class_getInstanceMethod(class, swizzleSelector);
    
    // NSLog(@"instanceMethodSwizzling: %p, %p, %p, %p", originMethod, originMethod2, swizzleMethod, swizzleMethod2);
    method_exchangeImplementations(originMethod2, swizzleMethod2);
}

+ (void)cehook_classMethodSwizzling:(SEL)originSelector to:(SEL)swizzleSelector {
    Class class = [self class];
    Class realClass = object_getClass(class);
    Method originMethod = class_getClassMethod(realClass, originSelector);
    Method swizzleMethod = class_getClassMethod(realClass, swizzleSelector);
    Method originMethod2 = class_getClassMethod(class, originSelector);
    Method swizzleMethod2 = class_getClassMethod(class, swizzleSelector);
    
    // NSLog(@"classMethodSwizzling: %p, %p, %p, %p", originMethod, originMethod2, swizzleMethod, swizzleMethod2);
    
    if (!originMethod || !swizzleMethod) {
        return;
    }
    
    class_addMethod(realClass,
                    originSelector,
                    method_getImplementation(originMethod),
                    method_getTypeEncoding(originMethod));
    class_addMethod(realClass,
                    swizzleSelector,
                    method_getImplementation(swizzleMethod),
                    method_getTypeEncoding(swizzleMethod));
    
    originMethod2 = class_getClassMethod(class, originSelector);
    swizzleMethod2 = class_getClassMethod(class, swizzleSelector);
    // NSLog(@"classMethodSwizzling: %p, %p, %p, %p", originMethod, originMethod2, swizzleMethod, swizzleMethod2);
    method_exchangeImplementations(originMethod2, swizzleMethod2);
}


@end
