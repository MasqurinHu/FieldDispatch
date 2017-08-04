//
//  UIButton+MButton.h
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/8/2.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (MButton)

-(instancetype)initWithTitle:(NSString*)title
             backgroundColor:(UIColor*)bgc
                   addTarget:(id)class
                        func:(SEL)func
                    targetView:(UIView*)tatget
                    multiplier:(CGFloat)multiplier
                    superView:(UIView*)superView;

-(instancetype)initWithTitle:(NSString*)title
             backgroundColor:(UIColor*)bgc
                   addTarget:(id)class
                        func:(SEL)func
                    superView:(UIView*)superView;

@end
