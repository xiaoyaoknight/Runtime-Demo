//
//  Test9ViewController.m
//  Runtime-Demo
//
//  Created by 王泽龙 on 2019/7/3.
//  Copyright © 2019 王泽龙. All rights reserved.
//

#import "Test9ViewController.h"

@interface Test9ViewController ()

@end

@implementation Test9ViewController

- (void)viewDidLoad {
    
    self.title = @"消息发送";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_back"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    
    
    [self demo1];
    [self demo2];
}

- (void)demo1 {
    
    
    NSArray *testArray = @[@"a",@"b",@"c"];
    NSLog(@"数组取值-----------%@",[testArray objectAtIndex:4]);

}

- (void)demo2 {

    NSString *san = nil;
    NSMutableDictionary *mudic = [NSMutableDictionary dictionaryWithCapacity:10];
    [mudic setObject:san forKey:@"me"];
    [mudic setObject:@"sum" forKey:@"religion"];
    
    NSLog(@"可变字典为：%@-----",mudic);
    NSLog(@"可变字典的类名：%@",NSStringFromClass(mudic.class));

 
}


- (void)back {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
