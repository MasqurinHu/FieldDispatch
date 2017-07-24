//
//  MobileDataBase.m
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/7/23.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import "MobileDataBase.h"
static MobileDataBase *mobileDataBase = nil;
@implementation MobileDataBase
+(instancetype)stand{
    if (mobileDataBase == nil) {
        mobileDataBase = [MobileDataBase new];
    }
    return mobileDataBase;
}

-(void)setSizeWithWidth:(int)width height:(int)heigt{
    if (width >= heigt) {
        _size = heigt;
    }else{
        _size = width;
    }
}

@end
