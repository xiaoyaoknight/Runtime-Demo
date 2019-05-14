//
//  Test2ViewController.m
//  Runtime-Demo
//
//  Created by 王泽龙 on 2019/4/28.
//  Copyright © 2019 王泽龙. All rights reserved.
//

#import "Test2ViewController.h"
#import "MJPerson.h"
#import "MJStudent.h"
#import "MJGoodStudent.h"
#import "ClassInfo.h"
#import <objc/runtime.h>

@interface Test2ViewController ()

@end

@implementation Test2ViewController

- (void)viewDidLoad {
    
    self.title = @"Class的结构";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_back"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];

    [self demo1];
}

- (void)demo1 {

    
    MJPerson *person = [[MJPerson alloc] init];
    MJStudent *student = [[MJStudent alloc] init];
    MJGoodStudent *goodStudent = [[MJGoodStudent alloc] init];
    
    struct xx_objc_class *personClass = (__bridge struct xx_objc_class *)[person class];
    struct xx_objc_class *studentClass = (__bridge struct xx_objc_class *)[student class];
    struct xx_objc_class *goodStudentClass = (__bridge struct xx_objc_class *)[goodStudent class];

    struct xx_objc_class *personMetaClass = metaClass(personClass);
    struct xx_objc_class *studentMetaClass = metaClass(studentClass);
    struct xx_objc_class *goodStudentMetaClass = metaClass(goodStudentClass);

    struct class_rw_t *personClassData = data(personMetaClass);
    struct class_rw_t *studentClassData = data(studentMetaClass);
    struct class_rw_t *goodStudentClassData = data(goodStudentMetaClass);

    struct class_rw_t *personMetaClassData = data(personClassData);
    struct class_rw_t *studentMetaClassData = data(studentClassData);
    struct class_rw_t *goodStudentMetaClassData = data(goodStudentClassData);

    NSLog(@"%p %p %p %p %p %p",  personClassData, studentClassData, goodStudentClassData,
          personMetaClassData, studentMetaClassData, goodStudentMetaClassData);

    
}


- (void)back {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
