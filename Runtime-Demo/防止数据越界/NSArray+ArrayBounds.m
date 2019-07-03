//
//  NSArray+ArrayBounds.m
//  Runtime-Demo
//
//  Created by 王泽龙 on 2019/7/3.
//  Copyright © 2019 王泽龙. All rights reserved.
//

#import "NSArray+ArrayBounds.h"
#import <objc/runtime.h>

@implementation NSArray (ArrayBounds)

+ (void)load {
    
    [super load];
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{  //方法交换只要一次就好
        Method oldObjectAtIndex = class_getInstanceMethod(objc_getClass("__NSArrayI"), @selector(objectAtIndex:));
        Method newObjectAtIndex = class_getInstanceMethod(objc_getClass("__NSArrayI"), @selector(change_objectAtIndex:));
        method_exchangeImplementations(oldObjectAtIndex, newObjectAtIndex);
    });
}

- (id)change_objectAtIndex:(NSUInteger)index{
    
    if (index > self.count - 1 || !self.count){
        return nil;
    }
    else{
        return [self change_objectAtIndex:index];
    }
}
@end


@interface NSMutableArray (ArrayBounds)
@end

@implementation NSMutableArray (ArrayBounds)

+ (void)load{
    [super load];
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{  //方法交换只要一次就好
        Method oldObjectAtIndex = class_getInstanceMethod(objc_getClass("__NSArrayM"), @selector(objectAtIndex:));
        Method newObjectAtIndex = class_getInstanceMethod(objc_getClass("__NSArrayM"), @selector(change_objectAtIndex:));
        method_exchangeImplementations(oldObjectAtIndex, newObjectAtIndex);
    });
}

- (id)change_objectAtIndex:(NSUInteger)index{
    
    if (index > self.count - 1 || !self.count){
        return nil;
    }
    else{
        return [self change_objectAtIndex:index];
    }
}

@end
