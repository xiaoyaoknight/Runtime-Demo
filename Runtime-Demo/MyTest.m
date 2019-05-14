//
//  MyTest.m
//  Runtime-Demo
//
//  Created by 王泽龙 on 2019/5/13.
//  Copyright © 2019 王泽龙. All rights reserved.
//

#import "MyTest.h"
#import <objc/runtime.h>

@implementation MyTest

- (void)other {
    NSLog(@"%s", __func__);
}

+ (void)other {
    NSLog(@"%s", __func__);
}

/**
 动态解析
 */
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    // 动态的添加方法实现
    if (sel == @selector(test)) {
        // 获取其他方法 指向method_t的指针
        Method otherMethod = class_getInstanceMethod(self, @selector(other));
        
        // 动态添加test方法的实现
        class_addMethod(self, sel, method_getImplementation(otherMethod), method_getTypeEncoding(otherMethod));
        
        // 返回YES表示有动态添加方法
        return YES;
    }
    
    NSLog(@"%s", __func__);
    return [super resolveInstanceMethod:sel];
}

+ (BOOL)resolveClassMethod:(SEL)sel {
    
    // 动态的添加方法实现
    if (sel == @selector(test)) {
        // 获取其他方法 指向method_t的指针
        Method otherMethod = class_getClassMethod(object_getClass(self), @selector(other));
        
        // 动态添加test方法的实现
        class_addMethod(object_getClass(self), sel, method_getImplementation(otherMethod), method_getTypeEncoding(otherMethod));
        
        // 返回YES表示有动态添加方法
        return YES;
    }
    
    NSLog(@"%s", __func__);
    return [super resolveInstanceMethod:sel];
}
@end
