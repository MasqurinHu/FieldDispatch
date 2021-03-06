//
//  UIView+AutoLayout.h
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/7/28.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (AutoLayout)



#pragma - add subView

+(void) atTargetCT_Withself:(UIView*)selfView
                     target:(UIView*)target
                  superView:(UIView*)superView
                multiplierX:(CGFloat)multiplierX
                multiplierY:(CGFloat)multiplierY
                       gapX:(CGFloat)gapX
                       gapY:(CGFloat)gapY;

+(void) atTargetLB_WithSelf:(UIView*)selfView
                     target:(UIView*)target
                  superView:(UIView*)superView
                multiplierX:(CGFloat)multiplierX
                multiplierY:(CGFloat)multiplierY
                       gapX:(CGFloat)gapX
                       gapY:(CGFloat)gapY;
//arrangement排列
+(void)initArrangementWithSelf:(UIView*)selfView
                         targetView:(UIView*)target
                         superView:(UIView*)superViev
                         x1Attribute:(NSLayoutAttribute)x1Attribute
                         x2Attribute:(NSLayoutAttribute)x2Attribute
                         y1Attribute:(NSLayoutAttribute)y1Attribute
                         y2Attribute:(NSLayoutAttribute)y2Attribute
                  multiplierX:(CGFloat)multiplierX
                   multiplierY:(CGFloat)multiplierY
                         xGap:(CGFloat)xGap
                         yGap:(CGFloat)yGap;

+(void)initFromBottonWithSelf:(UIView*)selfView
                targetView:(UIView*)target
                 superView:(UIView*)superView
                       gap:(CGFloat)gap;

+(void)initFromTopWithSelf:(UIView*)selfView
                targetView:(UIView*)target
                 superView:(UIView*)superView
                       gap:(CGFloat)gap;

+(void) initAtLeftTopWithSelf:(UIView*)selfView
                    SuperView:(UIView*)superView
                     Levelgap:(CGFloat)levelGap
                  VerticalGap:(CGFloat)verticalGap;

+(void) initAtLeftCenterWithSelf:(UIView*)selfView
                       SuperView:(UIView*)superView
                        LevelGap:(CGFloat)levelGap
                     VerticalGap:(CGFloat)verticalGap;

+(void) initAtLeftBottonWithSelf:(UIView*)selfView
                       SuperView:(UIView*)superView
                        LevelGap:(CGFloat)levelGap
                     verticalGap:(CGFloat)verticalGap;

+(void) initAtCenterCenterWithSelf:(UIView*)selfView
                         SuperView:(UIView*)superView
                          LevelGap:(CGFloat)levelGap
                       VerticalGap:(CGFloat)verticalGap;

+(void) initAtCenterTopWithSelf:(UIView*)selfView
                      SuperView:(UIView*)superView
                       LevelGap:(CGFloat)levelGap
                    VerticalGap:(CGFloat)virticalGap;

+(void) initAtCenterBottonWithSelf:(UIView*)selfViel
                         SuperView:(UIView*)superView
                          LevelGap:(CGFloat)levelGap
                       VerticalGap:(CGFloat)verticalGap;

+(void) initAtRightTopWithSelf:(UIView*)selfView
                     SuperView:(UIView*)superView
                      LevelGap:(CGFloat)levelGap
                   VerticalGap:(CGFloat)verticalGap;

+(void) initAtRightCenterWithSelf:(UIView*)selfView
                        SuperView:(UIView*)superView
                         LevelGap:(CGFloat)levelGap
                      VerticalGap:(CGFloat)verticalGap;

+(void) initAtRightBotonWithSelf:(UIView*)selfView
                       SuperView:(UIView*)superView
                        LevelGap:(CGFloat)levelGap
                     VerticalGap:(CGFloat)verticalGap;

+(void) initLeftToTargetRightWithSelf:(UIView*)selfView
                           TargetView:(UIView*)targetView
                            SuperView:(UIView*)superView
                                  gap:(CGFloat)gap;

+(void) initTopToTargetBottonWithSelf:(UIView*)selfView
                           TargetView:(UIView*)targetView
                            SuperView:(UIView*)superView
                                  gap:(CGFloat)gap;

+(void) initLocConstraintSelfView:(UIView*)selfView
                       targetView:(UIView*)targetView
                        SuperView:(UIView*)superView
                       AttributeX:(NSLayoutAttribute)attributeX
                       AttributeY:(NSLayoutAttribute)attributeY
                      MultiplierX:(CGFloat)multiplierX
                      MultiplierY:(CGFloat)multiplierY
                             GapX:(CGFloat)gapX
                             GapY:(CGFloat)gapY;

#pragma - SizeLayout
+(void)initWidthWithSelf:(UIView*)selfView
              TargetView:(UIView*)targetView
               SuperView:(UIView*)superVier
              Multiplier:(CGFloat)multiplier
                Constant:(CGFloat)constant;

+(void)initHeightWithSelf:(UIView*)selfView
               TargetView:(UIView*)targetView
                SuperView:(UIView*)superView
               Multiplier:(CGFloat)multiplier
                 Constant:(CGFloat)constant;

+(void)initSizeWithSelf:(UIView*)selfView
             TargetView:(UIView*)targetView
              SuperView:(UIView*)superView
             AttributeX:(NSLayoutAttribute)attributeX
             AttributeY:(NSLayoutAttribute)attributeY
            MultiplierX:(CGFloat)multiplierX
            MultiplierY:(CGFloat)multiplierY
                   GapX:(CGFloat)gapX
                   GapY:(CGFloat)gapY;




@end
