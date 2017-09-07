//
//  MissionListTVC.h
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/9/1.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FieldDispatchDataBase.h"

@interface MissionListTVC : UITableViewController

typedef enum _MissionType{  Accepted = 0,
                            Delegate,
                            Complete,
                            Acceptable
                        }MissionType;


@property (nonatomic,assign) MissionType missionType;
@property (nonatomic,strong) NSArray <MissionVO*>*array;

@end
