//
//  Test7ViewController.m
//  Runtime-Demo
//
//  Created by 王泽龙 on 2019/5/7.
//  Copyright © 2019 王泽龙. All rights reserved.
//

#import "Test7ViewController.h"
#import "MyTest.h"

@interface Test7ViewController ()

@end

@implementation Test7ViewController

- (void)viewDidLoad {
    
    self.title = @"动态解析";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_back"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    
    [self demo];
}

- (void)demo {
 
    MyTest *test = [MyTest new];
    [MyTest test];// 类方法
    [test test];// 对象方法
}


- (void)back {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
