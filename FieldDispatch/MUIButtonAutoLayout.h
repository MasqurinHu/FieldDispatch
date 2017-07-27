//
//  MUIButtonAutoLayout.h
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/7/24.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MUIButtonAutoLayout : UIButton
-(instancetype)initWithTitle:(NSString*)title
             backgroundColor:(UIColor*)bgc
                   addTarget:(id)class
                        func:(SEL)func
                    targetView:(UIView*)tatget
                    multiplier:(CGFloat)multiplier
                    superView:(UIView*)superView;
@end
