//
//  MobileDataBase.h
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/7/23.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MobileDataBase : NSObject

@property (readonly,nonatomic,weak) NSString *deviceToken;
@property (readonly,nonatomic,weak) NSString *nickName;
@property (readonly,nonatomic,assign) int tel;
@property (readonly,nonatomic,assign) int size;


+(instancetype)stand;
-(void)setSizeWithWidth:(int)width height:(int)heigh;
-(void)setDeviceToken:(NSString*)deviceToken;
-(void)setNickName:(NSString *)nickName;
-(void)setTel:(int)tel;

@end
