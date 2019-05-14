//
//  Test1ViewController.m
//  Runtime-Demo
//
//  Created by 王泽龙 on 2019/4/28.
//  Copyright © 2019 王泽龙. All rights reserved.
//

#import "Test1ViewController.h"
#import <objc/runtime.h>
#import "Person.h"

@interface Test1ViewController ()

@end

@implementation Test1ViewController

- (void)viewDidLoad {
    self.title = @"探寻过程";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_back"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];

    
//    [self demo1];
    [self demo2];
}

- (void)demo1 {
    NSLog(@"%zd", class_getInstanceSize([Person class]));
    // 2019-05-09 15:13:23.339437+0800 Runtime-Demo[39673:7030126] 16
    /*
     Person含有3个BOOL类型的属性，打印Person类对象占据内存空间为16，
     也就是(isa指针 = 8) + (BOOL tall = 1) + (BOOL rich = 1) + (BOOL handsome = 1) = 13。
     因为内存对齐原则所以Person类对象占据内存空间为16。
     */
}

- (void)demo2 {
    Person *person  = [[Person alloc] init];
    person.tall = YES;
    person.rich = NO;
    person.handsome = YES;
    NSLog(@"tall : %d, rich : %d, handsome : %d", person.tall,person.rich,person.handsome);

}

- (void)back {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
