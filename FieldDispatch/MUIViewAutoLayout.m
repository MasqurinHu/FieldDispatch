//
//  MUIViewAutoLayout.m
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/7/26.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import "MUIViewAutoLayout.h"

@implementation MUIViewAutoLayout

+(void)initLeftTopWithSelf:(UIView *)selfview
                    Target:(UIView*)target
                 SuperView:(UIView *)superView
                Multiplier:(CGFloat)multiplier
                       Gap:(CGFloat)gap{
    
    [self initWidthFromTargetWithSelf:selfview
                               Target:superView
                            SuperView:superView
                           Multiplier:multiplier
                             Constant:gap];
    
    [self initHeightFromTargetWithSelf:selfview
                                Target:superView
                             SuperView:superView
                            Multiplier:multiplier
                              Constant:gap];
    
    
    NSMutableArray <NSLayoutConstraint*>*layout = [NSMutableArray new];
    [layout addObject:[NSLayoutConstraint constraintWithItem:selfview attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:superView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:gap]];
}







+(void)initWidthFromTargetWithSelf:(UIView*)selfView
                           Target:(UIView*)target
                        SuperView:(UIView*)superView
                       Multiplier:(CGFloat)multiplier
                         Constant:(CGFloat)constant{
    selfView.translatesAutoresizingMaskIntoConstraints = false;
    [superView addConstraint:[NSLayoutConstraint
                              constraintWithItem:selfView
                              attribute:NSLayoutAttributeWidth
                              relatedBy:NSLayoutRelationEqual
                              toItem:target
                              attribute:NSLayoutAttributeWidth
                              multiplier:multiplier
                              constant:constant]];
}

+(void)initHeightFromTargetWithSelf:(UIView*)selfView
                            Target:(UIView*)target
                         SuperView:(UIView*)superView
                        Multiplier:(CGFloat)multiplier
                          Constant:(CGFloat)constant{
    [superView addConstraint:[NSLayoutConstraint
                              constraintWithItem:selfView
                              attribute:NSLayoutAttributeHeight
                              relatedBy:NSLayoutRelationEqual
                              toItem:target
                              attribute:NSLayoutAttributeHeight
                              multiplier:multiplier
                              constant:constant]];
}

#pragma - Loc

+(void)initAtRightBotonWithSelf:(UIView *)selfView
                      SuperView:(UIView *)superView
                       LevelGap:(CGFloat)levelGap
                    VerticalGap:(CGFloat)verticalGap{
    [self initLocConstraintSelfView:selfView
                         targetView:superView
                          SuperView:superView
                         AttributeX:NSLayoutAttributeRight
                         AttributeY:NSLayoutAttributeBottom
                        MultiplierX:0.0
                        MultiplierY:0.0
                               GapX:levelGap
                               GapY:verticalGap];
}

+(void)initAtRightCenterWithSelf:(UIView *)selfView
                       SuperView:(UIView *)superView
                        LevelGap:(CGFloat)levelGap
                     VerticalGap:(CGFloat)verticalGap{
    [self initLocConstraintSelfView:selfView
                         targetView:superView
                          SuperView:superView
                         AttributeX:NSLayoutAttributeRight
                         AttributeY:NSLayoutAttributeCenterY
                        MultiplierX:0.0
                        MultiplierY:0.0
                               GapX:levelGap
                               GapY:verticalGap];
}

+(void)initAtRightTopWithSelf:(UIView *)selfView
                    SuperView:(UIView *)superView
                     LevelGap:(CGFloat)levelGap
                  VerticalGap:(CGFloat)verticalGap{
    [self initLocConstraintSelfView:selfView
                         targetView:superView
                          SuperView:superView
                         AttributeX:NSLayoutAttributeRight
                         AttributeY:NSLayoutAttributeTop
                        MultiplierX:0.0
                        MultiplierY:0.0
                               GapX:levelGap
                               GapY:verticalGap];
}

+(void)initAtCenterTopWithSelf:(UIView *)selfView
                     SuperView:(UIView *)superView
                      LevelGap:(CGFloat)levelGap
                   VerticalGap:(CGFloat)virticalGap{
    [self initLocConstraintSelfView:selfView
                         targetView:superView
                          SuperView:superView
                         AttributeX:NSLayoutAttributeCenterX
                         AttributeY:NSLayoutAttributeTop
                        MultiplierX:0.0
                        MultiplierY:0.0
                               GapX:levelGap
                               GapY:virticalGap];
}

+(void)initAtCenterCenterWithSelf:(UIView *)selfView
              SuperView:(UIView *)superView
               LevelGap:(CGFloat)levelGap
            VerticalGap:(CGFloat)virticalGap{
    [self initLocConstraintSelfView:selfView
                         targetView:superView
                          SuperView:superView
                         AttributeX:NSLayoutAttributeCenterX
                         AttributeY:NSLayoutAttributeCenterY
                        MultiplierX:0.0
                        MultiplierY:0.0
                               GapX:levelGap
                               GapY:virticalGap];
}


+(void)initAtCenterBottonWithSelf:(UIView *)selfViel
                        SuperView:(UIView *)superView
                         LevelGap:(CGFloat)levelGap
                      VerticalGap:(CGFloat)verticalGap{
    [self initLocConstraintSelfView:selfViel
                         targetView:superView
                          SuperView:superView
                         AttributeX:NSLayoutAttributeCenterX
                         AttributeY:NSLayoutAttributeBottom
                        MultiplierX:0.0
                        MultiplierY:0.0
                               GapX:levelGap
                               GapY:verticalGap];
}

+(void)initAtLeftBottonWithSelf:(UIView *)selfView
                      SuperView:(UIView *)superView
                       LevelGap:(CGFloat)levelGap
                    verticalGap:(CGFloat)verticalGap{
    [self initLocConstraintSelfView:selfView
                         targetView:superView
                          SuperView:superView
                         AttributeX:NSLayoutAttributeLeft
                         AttributeY:NSLayoutAttributeCenterY
                        MultiplierX:0.0
                        MultiplierY:0.0
                               GapX:levelGap
                               GapY:verticalGap];
}

+(void)initAtLeftCenterWithSelf:(UIView *)selfView
                      SuperView:(UIView *)superView
                       LevelGap:(CGFloat)levelGap
                    VerticalGap:(CGFloat)verticalGap{
    [self initLocConstraintSelfView:selfView
                         targetView:superView
                          SuperView:superView
                         AttributeX:NSLayoutAttributeLeft
                         AttributeY:NSLayoutAttributeCenterY
                        MultiplierX:0.0
                        MultiplierY:0.0
                               GapX:levelGap
                               GapY:verticalGap];
}

+(void)initAtLeftTopWithSelf:(UIView *)selfView
                   SuperView:(UIView *)superView
                    Levelgap:(CGFloat)levelGap
                 VerticalGap:(CGFloat)verticalGap{
    [self initLocConstraintSelfView:selfView
                         targetView:superView
                          SuperView:superView
                         AttributeX:NSLayoutAttributeLeft
                         AttributeY:NSLayoutAttributeTop
                        MultiplierX:0.0
                        MultiplierY:0.0
                               GapX:levelGap
                               GapY:verticalGap];
}

+(void)initTopToTargetBottonWithSelf:(UIView *)selfView
                          TargetView:(UIView *)targetView
                           SuperView:(UIView *)superView
                                 gap:(CGFloat)gap{
    selfView.translatesAutoresizingMaskIntoConstraints = false;
    [superView addConstraint:[NSLayoutConstraint
                              constraintWithItem:selfView
                              attribute:NSLayoutAttributeTop
                              relatedBy:NSLayoutRelationEqual
                              toItem:targetView
                              attribute:NSLayoutAttributeBottom
                              multiplier:1.0
                              constant:gap]];
}

+(void)initLeftToTargetRightWithSelf:(UIView *)selfView
                          TargetView:(UIView *)targetView
                           SuperView:(UIView*)superView
                                 gap:(CGFloat)gap{
    selfView.translatesAutoresizingMaskIntoConstraints = false;
    [superView addConstraint:[NSLayoutConstraint
                              constraintWithItem:selfView
                              attribute:NSLayoutAttributeLeft
                              relatedBy:NSLayoutRelationEqual
                              toItem:targetView
                              attribute:NSLayoutAttributeRight
                              multiplier:1.0
                              constant:gap]];
}

+(void)initLocConstraintSelfView:(UIView*)selfView
                      targetView:(UIView*)targetView
                       SuperView:(UIView*)superView
                      AttributeX:(NSLayoutAttribute)attributeX
                      AttributeY:(NSLayoutAttribute)attributeY
                     MultiplierX:(CGFloat)multiplierX
                     MultiplierY:(CGFloat)multiplierY
                            GapX:(CGFloat)gapX
                            GapY:(CGFloat)gapY{
    selfView.translatesAutoresizingMaskIntoConstraints = false;
    NSMutableArray <NSLayoutConstraint*>*layout = [NSMutableArray new];
    [layout addObject:[NSLayoutConstraint
                       constraintWithItem:selfView
                       attribute:attributeX
                       relatedBy:NSLayoutRelationEqual
                       toItem:targetView
                       attribute:attributeX
                       multiplier:multiplierX
                       constant:gapX]];
    [layout addObject:[NSLayoutConstraint
                       constraintWithItem:selfView
                       attribute:attributeY
                       relatedBy:NSLayoutRelationEqual
                       toItem:targetView
                       attribute:attributeY
                       multiplier:multiplierY
                       constant:gapY]];
    [superView addConstraints:layout];
}

#pragma - Size
+(void)initWidthWithSelf:(UIView *)selfView
              TargetView:(UIView *)targetView
               SuperView:(UIView *)superVier
              Multiplier:(CGFloat)multiplier
                Constant:(CGFloat)constant{
    selfView.translatesAutoresizingMaskIntoConstraints = false;
    [superVier addConstraint:[NSLayoutConstraint
                              constraintWithItem:selfView
                              attribute:NSLayoutAttributeWidth
                              relatedBy:NSLayoutRelationEqual
                              toItem:targetView
                              attribute:NSLayoutAttributeWidth
                              multiplier:multiplier
                              constant:constant]];
}

+(void)initHeightWithSelf:(UIView *)selfView
               TargetView:(UIView *)targetView
                SuperView:(UIView *)superView
               Multiplier:(CGFloat)multiplier
                 Constant:(CGFloat)constant{
    selfView.translatesAutoresizingMaskIntoConstraints = false;
    [superView addConstraint:[NSLayoutConstraint
                              constraintWithItem:selfView
                              attribute:NSLayoutAttributeHeight
                              relatedBy:NSLayoutRelationEqual
                              toItem:targetView
                              attribute:NSLayoutAttributeHeight
                              multiplier:multiplier
                              constant:constant]];
}

+(void)initSizeWithSelf:(UIView *)selfView
             TargetView:(UIView *)targetView
              SuperView:(UIView *)superView
             AttributeX:(NSLayoutAttribute)attributeX
             AttributeY:(NSLayoutAttribute)attributeY
            MultiplierX:(CGFloat)multiplierX
            MultiplierY:(CGFloat)multiplierY
                   GapX:(CGFloat)gapX
                   GapY:(CGFloat)gapY{
    selfView.translatesAutoresizingMaskIntoConstraints = false;
    NSMutableArray <NSLayoutConstraint*>*layout = [NSMutableArray new];
    [layout addObject:[NSLayoutConstraint
                       constraintWithItem:selfView
                       attribute:attributeX
                       relatedBy:NSLayoutRelationEqual
                       toItem:targetView
                       attribute:attributeX
                       multiplier:multiplierX
                       constant:gapX]];
    [layout addObject:[NSLayoutConstraint
                       constraintWithItem:selfView
                       attribute:attributeY
                       relatedBy:NSLayoutRelationEqual
                       toItem:targetView
                       attribute:attributeY
                       multiplier:multiplierY
                       constant:gapY]];
    [superView addConstraints:layout];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
