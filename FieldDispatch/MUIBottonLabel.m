//
//  MUIBottonLabel.m
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/8/10.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import "MUIBottonLabel.h"

@implementation MUIBottonLabel


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(ctx, 0, rect.size.height);
    CGContextAddLineToPoint(ctx, rect.size.width, rect.size.width);
    [[UIColor blackColor] setStroke];
    CGContextSetLineWidth(ctx, 2);
    CGContextStrokePath(ctx);
    self.layer.contents = (__bridge id _Nullable)UIGraphicsGetImageFromCurrentImageContext().CGImage;
    UIGraphicsGetCurrentContext();
    
    
}





@end
