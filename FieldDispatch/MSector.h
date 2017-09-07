//
//  MSector.h
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/9/3.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MSector : UIButton

@property (nonatomic,assign) int page;

-(instancetype) initSectorWithSuperView:(UIView*)superView;

@end
