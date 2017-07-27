//
//  TeamMembers.h
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/7/27.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TeamMembers : NSObject
@property (nonatomic,strong) NSString *userid;
@property (nonatomic,strong) NSString *status;

-(NSDictionary*) onLionTeamMembersWithID:(NSString*)userID;

@end
