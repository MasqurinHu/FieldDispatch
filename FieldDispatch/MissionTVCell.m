//
//  MissionTVCell.m
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/8/12.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import "MissionTVCell.h"
#import <MapKit/MapKit.h>

@interface MissionTVCell()<MKMapViewDelegate>
{
    AdvanceImageView *photo;
    MKMapView *map;
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
    // Initialization code
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
                         constant:70.0]];
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:photo
                         attribute:NSLayoutAttributeHeight
                         relatedBy:NSLayoutRelationEqual
                         toItem:self
                         attribute:NSLayoutAttributeHeight
                         multiplier:.001
                         constant:70.0]];
    [UIView initAtLeftTopWithSelf:photo
                        SuperView:self
                         Levelgap:20.0
                      VerticalGap:4.0];
    NSURL *url = [NSURL URLWithString:[MemberDatabase stand].photoURL];
    [photo loadImageWithURL:url];
    
    map = [MKMapView new];
    map.backgroundColor = [UIColor blueColor];
    map.userInteractionEnabled = false;
    [self addSubview:map];
    map.translatesAutoresizingMaskIntoConstraints = false;
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:map
                         attribute:NSLayoutAttributeLeading
                         relatedBy:NSLayoutRelationEqual
                         toItem:photo
                         attribute:NSLayoutAttributeTrailing
                         multiplier:1.0
                         constant:20.0]];
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
                         attribute:NSLayoutAttributeBottom
                         relatedBy:NSLayoutRelationEqual
                         toItem:self
                         attribute:NSLayoutAttributeBottom
                         multiplier:1.0
                         constant:-30.0]];
    
    missionName = [UILabel new];
    missionName.numberOfLines = 0;
    missionName.translatesAutoresizingMaskIntoConstraints = false;
    missionName.text = [NSString stringWithFormat:@"任務名稱：\n%@",_mission.missionName];
    [self addSubview:missionName];
    [missionName sizeToFit];
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:missionName
                         attribute:NSLayoutAttributeTop
                         relatedBy:NSLayoutRelationEqual
                         toItem:photo
                         attribute:NSLayoutAttributeBottom
                         multiplier:1.0
                         constant:.0]];
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:missionName
                         attribute:NSLayoutAttributeLeading
                         relatedBy:NSLayoutRelationEqual
                         toItem:self
                         attribute:NSLayoutAttributeLeading
                         multiplier:1.0
                         constant:4.0]];
    
    name = [UILabel new];
    [self addSubview:name];
    name.numberOfLines = 0;
    name.translatesAutoresizingMaskIntoConstraints = false;
    name.text = [NSString stringWithFormat:@"執行者：\n%@",_mission.missionExecutor];
    [name sizeToFit];
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem: name
                         attribute:NSLayoutAttributeTop
                         relatedBy:NSLayoutRelationEqual
                         toItem:missionName
                         attribute:NSLayoutAttributeBottom
                         multiplier:1.0
                         constant:2.0]];
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:name
                         attribute:NSLayoutAttributeLeading
                         relatedBy:NSLayoutRelationEqual
                         toItem:missionName
                         attribute:NSLayoutAttributeLeading
                         multiplier:1.0
                         constant:2.0]];
    
    missionType = [UILabel new];
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
    
    [missionType sizeToFit];
    [self addSubview:missionType];
    missionType.translatesAutoresizingMaskIntoConstraints = false;
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:missionType
                         attribute:NSLayoutAttributeLeading
                         relatedBy:NSLayoutRelationEqual
                         toItem:name
                         attribute:NSLayoutAttributeLeading
                         multiplier:1.0
                         constant:.0]];
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:missionType
                         attribute:NSLayoutAttributeTop
                         relatedBy:NSLayoutRelationEqual
                         toItem:name
                         attribute:NSLayoutAttributeBottom
                         multiplier:1.0
                         constant:4.0]];
    
    creatTime = [UILabel new];
    creatTime.numberOfLines = 0;
    
    creatTime.text = [NSString
                      stringWithFormat:@"預約時間：%@",_mission.workPointList[0].expectedArrivalTime];
    creatTime.translatesAutoresizingMaskIntoConstraints = false;
    [creatTime sizeToFit];
    [self addSubview:creatTime];
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:creatTime
                         attribute:NSLayoutAttributeTop
                         relatedBy:NSLayoutRelationEqual
                         toItem:missionType
                         attribute:NSLayoutAttributeBottom
                         multiplier:1.0
                         constant:2.0]];
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:creatTime
                         attribute:NSLayoutAttributeTrailing
                         relatedBy:NSLayoutRelationEqual
                         toItem:map
                         attribute:NSLayoutAttributeTrailing
                         multiplier:1.0
                         constant:.0]];
    
    memo = [UILabel new];
    
    memo.text = [NSString stringWithFormat:@"備註:%@",_mission.missionMemo];
    memo.translatesAutoresizingMaskIntoConstraints = false;
    [memo sizeToFit];
    [self addSubview:memo];
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:memo
                         attribute:NSLayoutAttributeTop
                         relatedBy:NSLayoutRelationEqual
                         toItem:map
                         attribute:NSLayoutAttributeBottom
                         multiplier:1.0
                         constant:2]];
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:memo
                         attribute:NSLayoutAttributeLeading
                         relatedBy:NSLayoutRelationEqual
                         toItem:missionType
                         attribute:NSLayoutAttributeLeading
                         multiplier:1.0
                         constant:.0]];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}

-(void)reload {
    NSURL *url = [NSURL URLWithString:[MemberDatabase stand].photoURL];
    [photo loadImageWithURL:url];
    
    missionName.text = [NSString stringWithFormat:@"任務名稱：\n%@",_mission.missionName];
    NSString *aa = [[MemberDatabase stand].people getNameWithId:_mission.missionCreateMemberId];
    name.text = [NSString stringWithFormat:@"執行者：\n%@",aa];
    
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
