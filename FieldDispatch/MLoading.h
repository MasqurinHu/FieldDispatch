//
//  MLoading.h
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/9/2.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MLoading : UIView

-(instancetype) initLoadingViewWithTarget:(UIView*)target;
-(void) removeLoadingView;

@end
