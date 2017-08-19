//
//  UIView+AutoLayout.m
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/7/28.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import "UIView+AutoLayout.h"

@implementation UIView (AutoLayout)

+(void)initFromBottonWithSelf:(UIView *)selfView
                   targetView:(UIView *)target
                    superView:(UIView *)superView
                          gap:(CGFloat)gap{
    selfView.translatesAutoresizingMaskIntoConstraints = false;
    NSMutableArray <NSLayoutConstraint*>*lo = [NSMutableArray new];
    [lo addObject:[NSLayoutConstraint
                   constraintWithItem:selfView
                   attribute:NSLayoutAttributeBottom
                   relatedBy:NSLayoutRelationEqual
                   toItem:target
                   attribute:NSLayoutAttributeTop
                   multiplier:1.0
                   constant:gap]];
    [lo addObject:[NSLayoutConstraint
                   constraintWithItem:selfView
                   attribute:NSLayoutAttributeLeading
                   relatedBy:NSLayoutRelationEqual
                   toItem:target
                   attribute:NSLayoutAttributeLeading
                   multiplier:1.0
                   constant:.0]];
    [superView addConstraints:lo];
}


+(void)initFromTopWithSelf:(UIView *)selfView
                targetView:(UIView *)target
                 superView:(UIView *)superView
                       gap:(CGFloat)gap{
    selfView.translatesAutoresizingMaskIntoConstraints = false;
    NSMutableArray <NSLayoutConstraint*>*lo = [NSMutableArray new];
    [lo addObject:[NSLayoutConstraint
                   constraintWithItem:selfView
                   attribute:NSLayoutAttributeTop
                   relatedBy:NSLayoutRelationEqual
                   toItem:target
                   attribute:NSLayoutAttributeBottom
                   multiplier:1.0
                   constant:gap]];
    [lo addObject:[NSLayoutConstraint
                   constraintWithItem:selfView
                   attribute:NSLayoutAttributeLeading
                   relatedBy:NSLayoutRelationEqual
                   toItem:target
                   attribute:NSLayoutAttributeLeading
                   multiplier:1.0
                   constant:.0]];
    [superView addConstraints:lo];
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
    selfView.translatesAutoresizingMaskIntoConstraints = false;
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
    selfView.translatesAutoresizingMaskIntoConstraints = false;
    [self initLocConstraintSelfView:selfView
                         targetView:superView
                          SuperView:superView
                         AttributeX:NSLayoutAttributeRight
                         AttributeY:NSLayoutAttributeBottom
                        MultiplierX:1.0
                        MultiplierY:1.0
                               GapX:levelGap
                               GapY:verticalGap];
}

+(void)initAtRightCenterWithSelf:(UIView *)selfView
                       SuperView:(UIView *)superView
                        LevelGap:(CGFloat)levelGap
                     VerticalGap:(CGFloat)verticalGap{
    selfView.translatesAutoresizingMaskIntoConstraints = false;
    [self initLocConstraintSelfView:selfView
                         targetView:superView
                          SuperView:superView
                         AttributeX:NSLayoutAttributeRight
                         AttributeY:NSLayoutAttributeCenterY
                        MultiplierX:1.0
                        MultiplierY:1.0
                               GapX:levelGap
                               GapY:verticalGap];
}

+(void)initAtRightTopWithSelf:(UIView *)selfView
                    SuperView:(UIView *)superView
                     LevelGap:(CGFloat)levelGap
                  VerticalGap:(CGFloat)verticalGap{
    selfView.translatesAutoresizingMaskIntoConstraints = false;
    [self initLocConstraintSelfView:selfView
                         targetView:superView
                          SuperView:superView
                         AttributeX:NSLayoutAttributeRight
                         AttributeY:NSLayoutAttributeTop
                        MultiplierX:1.0
                        MultiplierY:1.0
                               GapX:levelGap
                               GapY:verticalGap];
}

+(void)initAtCenterTopWithSelf:(UIView *)selfView
                     SuperView:(UIView *)superView
                      LevelGap:(CGFloat)levelGap
                   VerticalGap:(CGFloat)virticalGap{
    selfView.translatesAutoresizingMaskIntoConstraints = false;
    [self initLocConstraintSelfView:selfView
                         targetView:superView
                          SuperView:superView
                         AttributeX:NSLayoutAttributeCenterX
                         AttributeY:NSLayoutAttributeTop
                        MultiplierX:1.0
                        MultiplierY:1.0
                               GapX:levelGap
                               GapY:virticalGap];
}

+(void)initAtCenterCenterWithSelf:(UIView *)selfView
                        SuperView:(UIView *)superView
                         LevelGap:(CGFloat)levelGap
                      VerticalGap:(CGFloat)virticalGap{
    selfView.translatesAutoresizingMaskIntoConstraints = false;
    [self initLocConstraintSelfView:selfView
                         targetView:superView
                          SuperView:superView
                         AttributeX:NSLayoutAttributeCenterX
                         AttributeY:NSLayoutAttributeCenterY
                        MultiplierX:1.0
                        MultiplierY:1.0
                               GapX:levelGap
                               GapY:virticalGap];
}


+(void)initAtCenterBottonWithSelf:(UIView *)selfViel
                        SuperView:(UIView *)superView
                         LevelGap:(CGFloat)levelGap
                      VerticalGap:(CGFloat)verticalGap{
    selfViel.translatesAutoresizingMaskIntoConstraints = false;
    [self initLocConstraintSelfView:selfViel
                         targetView:superView
                          SuperView:superView
                         AttributeX:NSLayoutAttributeCenterX
                         AttributeY:NSLayoutAttributeBottom
                        MultiplierX:1.0
                        MultiplierY:1.0
                               GapX:levelGap
                               GapY:verticalGap];
}

+(void)initAtLeftBottonWithSelf:(UIView *)selfView
                      SuperView:(UIView *)superView
                       LevelGap:(CGFloat)levelGap
                    verticalGap:(CGFloat)verticalGap{
    selfView.translatesAutoresizingMaskIntoConstraints = false;
    [self initLocConstraintSelfView:selfView
                         targetView:superView
                          SuperView:superView
                         AttributeX:NSLayoutAttributeLeft
                         AttributeY:NSLayoutAttributeCenterY
                        MultiplierX:1.0
                        MultiplierY:1.0
                               GapX:levelGap
                               GapY:verticalGap];
}

+(void)initAtLeftCenterWithSelf:(UIView *)selfView
                      SuperView:(UIView *)superView
                       LevelGap:(CGFloat)levelGap
                    VerticalGap:(CGFloat)verticalGap{
    selfView.translatesAutoresizingMaskIntoConstraints = false;
    [self initLocConstraintSelfView:selfView
                         targetView:superView
                          SuperView:superView
                         AttributeX:NSLayoutAttributeLeft
                         AttributeY:NSLayoutAttributeCenterY
                        MultiplierX:1.0
                        MultiplierY:1.0
                               GapX:levelGap
                               GapY:verticalGap];
}

+(void)initAtLeftTopWithSelf:(UIView *)selfView
                   SuperView:(UIView *)superView
                    Levelgap:(CGFloat)levelGap
                 VerticalGap:(CGFloat)verticalGap{
    selfView.translatesAutoresizingMaskIntoConstraints = false;
    [self initLocConstraintSelfView:selfView
                         targetView:superView
                          SuperView:superView
                         AttributeX:NSLayoutAttributeLeft
                         AttributeY:NSLayoutAttributeTop
                        MultiplierX:1.0
                        MultiplierY:1.0
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


@end
