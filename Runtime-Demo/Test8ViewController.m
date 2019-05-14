//
//  Test8ViewController.m
//  Runtime-Demo
//
//  Created by 王泽龙 on 2019/5/14.
//  Copyright © 2019 王泽龙. All rights reserved.
//

#import "Test8ViewController.h"
#import "MJStudent.h"
#import "MJPerson.h"
#import <objc/runtime.h>

@interface Test8ViewController ()

@end

@implementation Test8ViewController


- (void)viewDidLoad {
    
    self.title = @"super的本质";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_back"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    
    [self demo];
    [self demo1];
}

- (void)demo {
    MJStudent *stu = [[MJStudent alloc] init];
    NSLog(@"%@", stu);
    
    /*
     2019-05-14 11:43:54.475166+0800 Runtime-Demo[71193:10448829] [self class] = MJStudent
     2019-05-14 11:43:54.475346+0800 Runtime-Demo[71193:10448829] [self superclass] = MJPerson
     2019-05-14 11:43:54.475428+0800 Runtime-Demo[71193:10448829] ----------------
     2019-05-14 11:43:54.475505+0800 Runtime-Demo[71193:10448829] [super class] = MJStudent
     2019-05-14 11:43:54.475587+0800 Runtime-Demo[71193:10448829] [super superclass] = MJPerson
     
     */
}

/**
 isMemberOfClass 判断左边是否刚好等于右边类型。
 isKindOfClass 判断左边或者左边类型的父类是否刚好等于右边类型。
 注意：类方法内部是获取其元类对象进行比较
 */
- (void)demo1 {
    NSLog(@"%d", [[NSObject class] isKindOfClass:[NSObject class]]);
    NSLog(@"%d", [[NSObject class] isMemberOfClass:[NSObject class]]);
    NSLog(@"%d", [[MJPerson class] isKindOfClass:[MJPerson class]]);
    NSLog(@"%d", [[MJPerson class] isMemberOfClass:[MJPerson class]]);
    
    /*
     2019-05-14 11:54:17.293674+0800 Runtime-Demo[71700:10457151] 1
     2019-05-14 11:54:17.293736+0800 Runtime-Demo[71700:10457151] 0
     2019-05-14 11:54:17.293819+0800 Runtime-Demo[71700:10457151] 0
     2019-05-14 11:54:17.293892+0800 Runtime-Demo[71700:10457151] 0
     */
    
    NSLog(@"--------------------------");
    
    NSLog(@"%d",[MJPerson isKindOfClass: [MJPerson class]]);
    NSLog(@"%d",[MJPerson isKindOfClass: object_getClass([MJPerson class])]);// 传递是元类对象
    NSLog(@"%d",[MJPerson isKindOfClass: [NSObject class]]);
    
    /*
     2019-05-14 12:03:43.181411+0800 Runtime-Demo[72153:10464276] 0
     2019-05-14 12:03:43.181567+0800 Runtime-Demo[72153:10464276] 1
     2019-05-14 12:03:43.181724+0800 Runtime-Demo[72153:10464276] 1
     */
}


- (void)back {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
