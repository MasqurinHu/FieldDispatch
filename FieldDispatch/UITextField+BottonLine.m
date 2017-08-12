//
//  UITextField+BottonLine.m
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/8/2.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import "UITextField+BottonLine.h"

@implementation UITextField (BottonLine)

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    NSLayoutConstraint *constraint;
    UIView *bottomline = [UIView new];
    bottomline.backgroundColor = [UIColor blackColor];
    [bottomline setTranslatesAutoresizingMaskIntoConstraints:false];
    CGFloat widht = self.frame.size.width;
    [self addSubview:bottomline];
    
    constraint = [NSLayoutConstraint
                  constraintWithItem:bottomline
                  attribute:NSLayoutAttributeWidth
                  relatedBy:NSLayoutRelationEqual
                  toItem:self
                  attribute:NSLayoutAttributeWidth
                  multiplier:1.0 constant:-widht];
    [self addConstraint:constraint];
    
    constraint = [NSLayoutConstraint
                  constraintWithItem:bottomline
                  attribute:NSLayoutAttributeHeight
                  relatedBy:NSLayoutRelationEqual
                  toItem:self
                  attribute:NSLayoutAttributeHeight
                  multiplier:.02 constant:.0];
    [self addConstraint:constraint];
    
    constraint = [NSLayoutConstraint
                  constraintWithItem:bottomline
                  attribute:NSLayoutAttributeTop
                  relatedBy:NSLayoutRelationEqual
                  toItem:self
                  attribute:NSLayoutAttributeBottom
                  multiplier:1.0 constant:-1.0];
    [self addConstraint:constraint];
    
    constraint = [NSLayoutConstraint
                  constraintWithItem:bottomline
                  attribute:NSLayoutAttributeCenterX
                  relatedBy:NSLayoutRelationEqual
                  toItem:self
                  attribute:NSLayoutAttributeCenterX
                  multiplier:1.0 constant:.0];
    [self addConstraint:constraint];
    [self layoutIfNeeded];
    
    for (NSLayoutConstraint *tmp in self.constraints) {
        if (tmp.firstItem == bottomline &&
            tmp.firstAttribute == NSLayoutAttributeWidth &&
            tmp.constant == -widht) {
            
            tmp.constant = 0.0;
        }
    }
    
    [UIView animateWithDuration:.9 animations:^{
        [self layoutIfNeeded];
    }];
}

-(instancetype)initWithPlaseHold:(NSString *)placeHold{
    self = [super init];
    self.placeholder = placeHold;
    return self;
}

@end
