//
//  MJStudent.m
//  Runtime-Demo
//
//  Created by 王泽龙 on 2019/5/10.
//  Copyright © 2019 王泽龙. All rights reserved.
//

#import "MJStudent.h"

@implementation MJStudent
- (void)studentTest {
    NSLog(@"%s", __func__);
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"[self class] = %@", [self class]);
        NSLog(@"[self superclass] = %@", [self superclass]);
        NSLog(@"----------------");
        NSLog(@"[super class] = %@", [super class]);
        NSLog(@"[super superclass] = %@", [super superclass]);
    }
    return self;
}
@end
