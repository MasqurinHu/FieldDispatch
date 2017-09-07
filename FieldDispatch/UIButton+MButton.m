//
//  UIButton+MButton.m
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/8/2.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import "UIButton+MButton.h"

@implementation UIButton (MButton)

-(instancetype)initWithTitle:(NSString *)title
             backgroundColor:(UIColor *)bgc
                   addTarget:(id)class
                        func:(SEL)func
                   superView:(UIView *)superView{
    self = [super init];
//    self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//    self.contentEdgeInsets = UIEdgeInsetsMake(0,10, 0, 0);
    [superView addSubview:self];
    self.backgroundColor = bgc;
    [self addTarget:class action:func forControlEvents:UIControlEventTouchUpInside];
    self.translatesAutoresizingMaskIntoConstraints = false;
    [self setTitle:title forState:UIControlStateNormal];
    [self sizeToFit];
    self.layer.borderWidth = self.frame.size.height*.05;
    self.layer.cornerRadius = self.frame.size.height*.1;
    self.layer.shadowOffset = CGSizeMake(self.frame.size.width/90, self.frame.size.height/20);
    self.layer.shadowOpacity = .5f;
    return self;
}

-(instancetype)initWithTitle:(NSString*)title
             backgroundColor:(UIColor*)bgc
                   addTarget:(id)class
                        func:(SEL)func
                  targetView:(UIView*)tatget
                  multiplier:(CGFloat)multiplier
                   superView:(UIView*)superView{
    self = [super init];
//    self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//    self.contentEdgeInsets = UIEdgeInsetsMake(0,10, 0, 0);
    [superView addSubview:self];
    self.backgroundColor = bgc;
    [self addTarget:class action:func forControlEvents:UIControlEventTouchUpInside];
    self.translatesAutoresizingMaskIntoConstraints = false;
    [self setTitle:title forState:UIControlStateNormal];
    NSMutableArray <NSLayoutConstraint*>* aLc = [NSMutableArray new];
    [aLc addObject:[NSLayoutConstraint
                    constraintWithItem:self
                    attribute:NSLayoutAttributeCenterX
                    relatedBy:NSLayoutRelationEqual
                    toItem:superView
                    attribute:NSLayoutAttributeCenterX
                    multiplier:1.0
                    constant:0.0]];
    [aLc addObject:[NSLayoutConstraint
                    constraintWithItem:self
                    attribute:NSLayoutAttributeCenterY
                    relatedBy:NSLayoutRelationEqual
                    toItem:superView
                    attribute:NSLayoutAttributeCenterY
                    multiplier:1.0
                    constant:0.0]];
    [self sizeToFit];
    [superView addConstraints:aLc];
    [superView layoutIfNeeded];
    self.layer.borderWidth = self.frame.size.height*.05;
    self.layer.cornerRadius = self.frame.size.height*.1;
    return self;
    
}


@end
