//
//  Book.m
//  Runtime-Demo
//
//  Created by 王泽龙 on 2019/5/13.
//  Copyright © 2019 王泽龙. All rights reserved.
//

#import "Book.h"
#import <objc/runtime.h>
#import "Car.h"

@implementation Book

/**
 消息转发，寻找能执行的类 可以自定义拦截操作
 */
- (id)forwardingTargetForSelector:(SEL)aSelector {
    // 返回能够处理消息的对象
    if (aSelector == @selector(driving)) {
        return [[Car alloc] init];
    }
    return [super forwardingTargetForSelector:aSelector];
}
@end
