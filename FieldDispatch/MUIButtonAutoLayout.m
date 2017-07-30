//
//  MUIButtonAutoLayout.m
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/7/24.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import "MUIButtonAutoLayout.h"

@implementation MUIButtonAutoLayout


-(instancetype)initWithTitle:(NSString*)title
             backgroundColor:(UIColor*)bgc
                   addTarget:(id)class
                        func:(SEL)func
                  targetView:(UIView*)tatget
                  multiplier:(CGFloat)multiplier
                   superView:(UIView*)superView{
    self = [super init];
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
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
