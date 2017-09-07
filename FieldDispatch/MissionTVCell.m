//
//  MissionTVCell.m
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/8/12.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import "MissionTVCell.h"
#import <MapKit/MapKit.h>
#import "FieldDispatchDataBase.h"

@interface MissionTVCell()<MKMapViewDelegate>
{
    AdvanceImageView *photo;
    MKMapView *map;
    UILabel *missionId;
    UILabel *type;
    UILabel *status;
    UILabel *missionName;
    UILabel *name;
    UILabel *missionType;
    UILabel *creatTime;
    UILabel *memo;
}
@end

@implementation MissionTVCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    map = [MKMapView new];
    map.userInteractionEnabled = false;
    [self addSubview:map];
    map.translatesAutoresizingMaskIntoConstraints = false;
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:map
                         attribute:NSLayoutAttributeLeading
                         relatedBy:NSLayoutRelationEqual
                         toItem:self
                         attribute:NSLayoutAttributeLeading
                         multiplier:1.0
                         constant:4.0]];
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:map
                         attribute:NSLayoutAttributeTrailing
                         relatedBy:NSLayoutRelationEqual
                         toItem:self
                         attribute:NSLayoutAttributeTrailing
                         multiplier:1.0
                         constant:-4.0]];
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:map
                         attribute:NSLayoutAttributeTop
                         relatedBy:NSLayoutRelationEqual
                         toItem:self
                         attribute:NSLayoutAttributeTop
                         multiplier:1.0
                         constant:4.0]];
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:map
                         attribute:NSLayoutAttributeHeight
                         relatedBy:NSLayoutRelationEqual
                         toItem:self
                         attribute:NSLayoutAttributeHeight
                         multiplier:.0001
                         constant:100.0]];
    
    photo = [AdvanceImageView new];
    [self addSubview:photo];
    photo.translatesAutoresizingMaskIntoConstraints = false;
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:photo
                         attribute:NSLayoutAttributeWidth
                         relatedBy:NSLayoutRelationEqual
                         toItem:self
                         attribute:NSLayoutAttributeHeight
                         multiplier:.001
                         constant:30.0]];
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:photo
                         attribute:NSLayoutAttributeHeight
                         relatedBy:NSLayoutRelationEqual
                         toItem:self
                         attribute:NSLayoutAttributeHeight
                         multiplier:.001
                         constant:30.0]];
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:photo
                         attribute:NSLayoutAttributeLeading
                         relatedBy:NSLayoutRelationEqual
                         toItem:map attribute:NSLayoutAttributeLeading
                         multiplier:1.0
                         constant:.0]];
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:photo
                         attribute:NSLayoutAttributeTop
                         relatedBy:NSLayoutRelationEqual
                         toItem:map
                         attribute:NSLayoutAttributeBottom
                         multiplier:1.0
                         constant:4.0]];
    NSURL *url = [NSURL URLWithString:[MemberDatabase stand].photoURL];
    [photo loadImageWithURL:url];
    
    type = [UILabel new];
    type.translatesAutoresizingMaskIntoConstraints = false;
    [type sizeToFit];
    [self addSubview:type];
    [self addConstraint:[NSLayoutConstraint
                        constraintWithItem:type
                        attribute:NSLayoutAttributeLeading
                        relatedBy:NSLayoutRelationEqual
                        toItem:photo
                        attribute:NSLayoutAttributeLeading
                        multiplier:1.0
                        constant:.0]];
    [self addConstraint:[NSLayoutConstraint
                        constraintWithItem:type
                        attribute:NSLayoutAttributeTop
                        relatedBy:NSLayoutRelationEqual
                        toItem:photo
                        attribute:NSLayoutAttributeBottom
                        multiplier:1.0
                        constant:4.0]];
    
    missionId = [UILabel new];
    missionId.translatesAutoresizingMaskIntoConstraints = false;
    [self addSubview:missionId];
    [missionId sizeToFit];
    [self addConstraint:[NSLayoutConstraint
                        constraintWithItem:missionId
                        attribute:NSLayoutAttributeLeading
                        relatedBy:NSLayoutRelationEqual
                        toItem:type
                        attribute:NSLayoutAttributeLeading
                        multiplier:1.0
                        constant:.0]];
    [self addConstraint:[NSLayoutConstraint
                        constraintWithItem:missionId
                        attribute:NSLayoutAttributeTop
                        relatedBy:NSLayoutRelationEqual
                        toItem:type
                        attribute:NSLayoutAttributeBottom
                        multiplier:1.0
                        constant:4.0]];
    
    status = [UILabel new];
    status.translatesAutoresizingMaskIntoConstraints = false;
    [self addSubview:status];
    [status sizeToFit];
    [self addConstraint:[NSLayoutConstraint
                        constraintWithItem:status
                        attribute:NSLayoutAttributeLeading
                        relatedBy:NSLayoutRelationEqual
                        toItem:missionId
                        attribute:NSLayoutAttributeLeading
                        multiplier:1.0
                        constant:.0]];
    [self addConstraint:[NSLayoutConstraint
                        constraintWithItem:status
                        attribute:NSLayoutAttributeTop
                        relatedBy:NSLayoutRelationEqual
                        toItem:missionId
                        attribute:NSLayoutAttributeBottom
                        multiplier:1.0
                        constant:4.0]];
//    [self addConstraint:[NSLayoutConstraint
//                         constraintWithItem:status
//                         attribute:NSLayoutAttributeBottom
//                         relatedBy:NSLayoutRelationEqual
//                         toItem:self
//                         attribute:NSLayoutAttributeBottom
//                         multiplier:1.0
//                         constant:-4.0]];
    
//    
//    missionName = [UILabel new];
//    missionName.numberOfLines = 0;
//    missionName.translatesAutoresizingMaskIntoConstraints = false;
//    missionName.text = [NSString stringWithFormat:@"任務名稱：\n%@",_mission.missionName];
//    [self addSubview:missionName];
//    [missionName sizeToFit];
//    [self addConstraint:[NSLayoutConstraint
//                         constraintWithItem:missionName
//                         attribute:NSLayoutAttributeTop
//                         relatedBy:NSLayoutRelationEqual
//                         toItem:photo
//                         attribute:NSLayoutAttributeBottom
//                         multiplier:1.0
//                         constant:.0]];
//    [self addConstraint:[NSLayoutConstraint
//                         constraintWithItem:missionName
//                         attribute:NSLayoutAttributeLeading
//                         relatedBy:NSLayoutRelationEqual
//                         toItem:self
//                         attribute:NSLayoutAttributeLeading
//                         multiplier:1.0
//                         constant:4.0]];
//    
//    name = [UILabel new];
//    [self addSubview:name];
//    name.numberOfLines = 0;
//    name.translatesAutoresizingMaskIntoConstraints = false;
//    name.text = [NSString stringWithFormat:@"執行者：\n%@",_mission.missionExecutor];
//    [name sizeToFit];
//    [self addConstraint:[NSLayoutConstraint
//                         constraintWithItem: name
//                         attribute:NSLayoutAttributeTop
//                         relatedBy:NSLayoutRelationEqual
//                         toItem:missionName
//                         attribute:NSLayoutAttributeBottom
//                         multiplier:1.0
//                         constant:2.0]];
//    [self addConstraint:[NSLayoutConstraint
//                         constraintWithItem:name
//                         attribute:NSLayoutAttributeLeading
//                         relatedBy:NSLayoutRelationEqual
//                         toItem:missionName
//                         attribute:NSLayoutAttributeLeading
//                         multiplier:1.0
//                         constant:2.0]];
//    
//    missionType = [UILabel new];
//    missionType.numberOfLines = 0;
//    switch (_mission.missionStatus) {
//        case 1:
//            missionType.text = @"狀態：待接送";
//            break;
//        case 2:
//            missionType.text = @"狀態：前往中";
//            break;
//        case 3:
//            missionType.text = @"狀態：工作中";
//            break;
//        case 4:
//            missionType.text = @"狀態：已完成";
//            break;
//        default:
//            missionType.text = @"狀態：異常～";
//            break;
//    }
//    
//    [missionType sizeToFit];
//    [self addSubview:missionType];
//    missionType.translatesAutoresizingMaskIntoConstraints = false;
//    [self addConstraint:[NSLayoutConstraint
//                         constraintWithItem:missionType
//                         attribute:NSLayoutAttributeLeading
//                         relatedBy:NSLayoutRelationEqual
//                         toItem:name
//                         attribute:NSLayoutAttributeLeading
//                         multiplier:1.0
//                         constant:.0]];
//    [self addConstraint:[NSLayoutConstraint
//                         constraintWithItem:missionType
//                         attribute:NSLayoutAttributeTop
//                         relatedBy:NSLayoutRelationEqual
//                         toItem:name
//                         attribute:NSLayoutAttributeBottom
//                         multiplier:1.0
//                         constant:4.0]];
//    
//    creatTime = [UILabel new];
//    creatTime.numberOfLines = 0;
//    
//    creatTime.text = [NSString
//                      stringWithFormat:@"預約時間：%@",_mission.workPointList[0].expectedArrivalTime];
//    creatTime.translatesAutoresizingMaskIntoConstraints = false;
//    [creatTime sizeToFit];
//    [self addSubview:creatTime];
//    [self addConstraint:[NSLayoutConstraint
//                         constraintWithItem:creatTime
//                         attribute:NSLayoutAttributeTop
//                         relatedBy:NSLayoutRelationEqual
//                         toItem:missionType
//                         attribute:NSLayoutAttributeBottom
//                         multiplier:1.0
//                         constant:2.0]];
//    [self addConstraint:[NSLayoutConstraint
//                         constraintWithItem:creatTime
//                         attribute:NSLayoutAttributeTrailing
//                         relatedBy:NSLayoutRelationEqual
//                         toItem:map
//                         attribute:NSLayoutAttributeTrailing
//                         multiplier:1.0
//                         constant:.0]];
//    
//    memo = [UILabel new];
//    
//    memo.text = [NSString stringWithFormat:@"備註:%@",_mission.missionMemo];
//    memo.translatesAutoresizingMaskIntoConstraints = false;
//    [memo sizeToFit];
//    [self addSubview:memo];
//    [self addConstraint:[NSLayoutConstraint
//                         constraintWithItem:memo
//                         attribute:NSLayoutAttributeTop
//                         relatedBy:NSLayoutRelationEqual
//                         toItem:map
//                         attribute:NSLayoutAttributeBottom
//                         multiplier:1.0
//                         constant:2]];
//    [self addConstraint:[NSLayoutConstraint
//                         constraintWithItem:memo
//                         attribute:NSLayoutAttributeLeading
//                         relatedBy:NSLayoutRelationEqual
//                         toItem:missionType
//                         attribute:NSLayoutAttributeLeading
//                         multiplier:1.0
//                         constant:.0]];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}

-(void)reload {
    PeopleVO *people = [[MemberDatabase stand] .people getPeopleWithId:_mission.missionCreateMemberId];
    NSURL *url = [NSURL URLWithString:people.photo];
    [photo loadImageWithURL:url];
    
    missionId.text = [NSString stringWithFormat:@"%@%d",MISSION_ID,_mission.missionId];
    type.text = _mission.type;
    
    if (_mission.missionStatus == 0) {
        status.text = MISSION_STATUS_WAIT;
    }
    if (_mission.missionStatus == -1) {
        status.text = MISSION_STATUS_COMPLETED;
    }
    if (_mission.missionStatus == 1) {
        int gotoPoint = 0;
        for (MissionWorkPointVO *tmp in _mission.workPointList) {
            if (tmp.status > 0) {
                gotoPoint++;
            }
            status.text = [NSString stringWithFormat:@"%@%d",MISSION_STATUS_GOTO,gotoPoint];
        }
    }
    
    
    missionName.text = [NSString stringWithFormat:@"任務名稱：\n%@",_mission.missionName];
    name.text = [NSString stringWithFormat:@"執行者：\n%@",people.nickName];
    
    missionType.numberOfLines = 0;
    switch (_mission.missionStatus) {
        case 1:
            missionType.text = @"狀態：待接送";
            break;
        case 2:
            missionType.text = @"狀態：前往中";
            break;
        case 3:
            missionType.text = @"狀態：工作中";
            break;
        case 4:
            missionType.text = @"狀態：已完成";
            break;
        default:
            missionType.text = @"狀態：異常～";
            break;
    }
    
    creatTime.text = [NSString
                      stringWithFormat:@"預約時間：%@",_mission.workPointList[0].expectedArrivalTime];
    
    memo.text = [NSString stringWithFormat:@"備註:%@",_mission.missionMemo];
    
}




@end
