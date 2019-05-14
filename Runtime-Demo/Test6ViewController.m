//
//  Test6ViewController.m
//  Runtime-Demo
//
//  Created by 王泽龙 on 2019/5/7.
//  Copyright © 2019 王泽龙. All rights reserved.
//

#import "Test6ViewController.h"
#import <objc/runtime.h>

@interface Test6ViewController ()

@end

@implementation Test6ViewController

- (void)viewDidLoad {
    
    self.title = @"方法替换";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_back"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    
    [self demo];
    [self a];
}

- (void)demo {

    @synchronized (self) {
        Class class = [self class];
        Method originalMethod = class_getInstanceMethod(class, @selector(a));
        Method swizzledMethod = class_getInstanceMethod(class, @selector(b));
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

- (void)a {
    NSLog(@"a");
}

- (void)b {
    NSLog(@"b");
}

- (void)back {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
