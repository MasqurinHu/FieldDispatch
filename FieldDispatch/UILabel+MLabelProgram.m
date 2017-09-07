//
//  UILabel+MLabelProgram.m
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/9/2.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import "UILabel+MLabelProgram.h"

@implementation UILabel (MLabelProgram)

-(instancetype)initWithProgramInSuperView:(UIView *)superView {
    self = [super init];
    self.translatesAutoresizingMaskIntoConstraints = false;
    [self sizeToFit];
    [superView addSubview:self];
    return self;
}

@end
