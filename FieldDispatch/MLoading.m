//
//  MLoading.m
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/9/2.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import "MLoading.h"

@interface MLoading ()
{
    UIActivityIndicatorView *loadingView;
}
@end

@implementation MLoading

-(instancetype)initLoadingViewWithTarget:(UIView *)target {
    self = [super init];
    self.frame = target.frame;
    loadingView = [[UIActivityIndicatorView alloc]
                   initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    loadingView.color = [UIColor darkGrayColor];
    loadingView.hidesWhenStopped = true;
    [loadingView startAnimating];
    [self addSubview:loadingView];
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:loadingView
                         attribute:NSLayoutAttributeWidth
                         relatedBy:NSLayoutRelationEqual
                         toItem:self
                         attribute:NSLayoutAttributeWidth
                         multiplier:.5
                         constant:.0]];
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:loadingView
                         attribute:NSLayoutAttributeHeight
                         relatedBy:NSLayoutRelationEqual
                         toItem:self
                         attribute:NSLayoutAttributeWidth
                         multiplier:.5
                         constant:.0]];
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:loadingView
                         attribute:NSLayoutAttributeCenterX
                         relatedBy:NSLayoutRelationEqual
                         toItem:self
                         attribute:NSLayoutAttributeCenterX
                         multiplier:1.0
                         constant:.0]];
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:loadingView
                         attribute:NSLayoutAttributeCenterY
                         relatedBy:NSLayoutRelationEqual
                         toItem:self
                         attribute:NSLayoutAttributeCenterY
                         multiplier:1.0
                         constant:.0]];
    [target addSubview:self];
    return self;
}

-(void)removeLoadingView {
    [loadingView stopAnimating];
    [loadingView removeFromSuperview];
    loadingView = nil;
    [self removeFromSuperview];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
