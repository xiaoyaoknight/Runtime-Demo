//
//  Test3ViewController.m
//  Runtime-Demo
//
//  Created by 王泽龙 on 2019/4/28.
//  Copyright © 2019 王泽龙. All rights reserved.
//

#import "Test3ViewController.h"
#import "HaShiqi.h"

@interface Test3ViewController ()

@end

@implementation Test3ViewController

- (void)viewDidLoad {
    
    self.title = @"消息发送";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_back"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    
    
    [self demo1];
}

- (void)demo1 {

    HaShiqi *hashiqi = [[HaShiqi alloc] init];
    [hashiqi eat];
}



- (void)back {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
