//
//  Mpop.m
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/8/19.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import "Mpop.h"
#import "MasqurinTool.h"

@interface Mpop()
{
    
}
@end

@implementation Mpop


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}

-(instancetype)initPopWithSelf:(UIView *)selfView
                        target:(UIView *)target
                     superView:(UIView *)superView{
    self = [super init];
    [self addTarget:self
             action:@selector(dismissPOP)
   forControlEvents:UIControlEventTouchUpInside];
    [superView addSubview:self];
    [UIView initSizeWithSelf:self
                  TargetView:superView
                   SuperView:superView
                  AttributeX:NSLayoutAttributeWidth
                  AttributeY:NSLayoutAttributeHeight
                 MultiplierX:1.0
                 MultiplierY:1.0
                        GapX:.0
                        GapY:.0];
    [UIView initAtCenterCenterWithSelf:self
                             SuperView:superView
                              LevelGap:.0
                           VerticalGap:.0];
    self.backgroundColor = [[UIColor alloc]
                            initWithRed:.01f
                            green:.01f
                            blue:.01f
                            alpha:.3];
    [self addSubview:selfView];
    selfView.translatesAutoresizingMaskIntoConstraints = false;
    [UIView initSizeWithSelf:selfView
                  TargetView:superView
                   SuperView:superView
                  AttributeX:NSLayoutAttributeCenterX
                  AttributeY:NSLayoutAttributeCenterY
                 MultiplierX:1.0
                 MultiplierY:1.0
                        GapX:10.0
                        GapY:.0];
    
    return self;
}

-(void)dismissPOP{
    self.hidden = true;
}

@end
