//
//  ClassInfo.h
//  Test
//
//  Created by Fu,Sheng on 2019/5/13.
//  Copyright © 2019年 王泽龙. All rights reserved.
//

#ifndef ClassInfo_h
#define ClassInfo_h

/* 类对象 */
struct xx_objc_class;

struct xx_objc_class* metaClass(struct xx_objc_class* obj);

struct class_rw_t* data(struct xx_objc_class* obj); 

#endif /* ClassInfo_h */
