//
//  MemberGroupManagerVO.h
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/8/19.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MemberGroupManagerVO : NSObject

@property (nonatomic,assign)int memberId;
@property (nonatomic,assign)int athority;   //階級
@property (nonatomic,strong)NSDate *createTime;
@property (nonatomic,assign)int status;
@property (nonatomic,strong)NSDate *statusTime;

@end
