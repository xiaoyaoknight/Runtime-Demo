//
//  Test5ViewController.m
//  Runtime-Demo
//
//  Created by 王泽龙 on 2019/4/28.
//  Copyright © 2019 王泽龙. All rights reserved.
//

#import "Test5ViewController.h"
#import "Book.h"
#import <objc/runtime.h>

@interface Test5ViewController ()
@end

@implementation Test5ViewController

- (void)viewDidLoad {
    
    self.title = @"消息转发";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_back"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    
    [self demo];

}

- (void)demo {

    Book *book = [Book new];
    [book driving];
}


- (void)back {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
