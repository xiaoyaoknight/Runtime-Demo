//
//  Person.m
//  Runtime-Demo
//
//  Created by 王泽龙 on 2019/5/6.
//  Copyright © 2019 王泽龙. All rights reserved.
//

#import "Person.h"
//#define TallMask 0b00000100 // 4
//#define RichMask 0b00000010 // 2
//#define HandsomeMask 0b00000001 // 1

//#define TallMask (1<<2) // 0b00000100 4
//#define RichMask (1<<1) // 0b00000010 2
//#define HandsomeMask (1<<0) // 0b00000001 1

@implementation Person
//{
//    char _tallRichHandsome;
//}
{
    struct {
        char handsome : 1; // 位域，代表占用一位空间
        char rich : 1;  // 按照顺序只占一位空间
        char tall : 1;
    }_tallRichHandsome;
}

#pragma mark 设值

//- (void)setTall:(BOOL)tall
//{
//    if (tall) { // 如果需要将值置为1  // 按位或掩码
//        _tallRichHandsome |= TallMask;
//    }else{ // 如果需要将值置为0 // 按位与（按位取反的掩码）
//        _tallRichHandsome &= ~TallMask;
//    }
//}
//- (void)setRich:(BOOL)rich
//{
//    if (rich) {
//        _tallRichHandsome |= RichMask;
//    }else{
//        _tallRichHandsome &= ~RichMask;
//    }
//}
//- (void)setHandsome:(BOOL)handsome
//{
//    if (handsome) {
//        _tallRichHandsome |= HandsomeMask;
//    }else{
//        _tallRichHandsome &= ~HandsomeMask;
//    }
//}



- (void)setTall:(BOOL)tall
{
    _tallRichHandsome.tall = tall;
}
- (void)setRich:(BOOL)rich
{
    _tallRichHandsome.rich = rich;
}
- (void)setHandsome:(BOOL)handsome
{
    _tallRichHandsome.handsome = handsome;
}

#pragma mark 取值

//- (BOOL)tall
//{
//    return !!(_tallRichHandsome & TallMask);
//}
//- (BOOL)rich
//{
//    return !!(_tallRichHandsome & RichMask);
//}
//- (BOOL)handsome
//{
//    return !!(_tallRichHandsome & HandsomeMask);
//}


- (BOOL)tall
{
    return _tallRichHandsome.tall;
}
- (BOOL)rich
{
    return _tallRichHandsome.rich;
}
- (BOOL)handsome
{
    return _tallRichHandsome.handsome;
}



@end
