//
//  MobileDataBase.h
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/7/23.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MobileDataBase : NSObject

@property (readonly,nonatomic,assign) int square;
@property (readonly,nonatomic,assign) double rectangleWidth;




+(instancetype)stand;
-(void)setSizeWithWidth:(int)width height:(int)heigh;




@end
