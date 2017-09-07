//
//  CreateMissionVC.m
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/8/14.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import "CreateMissionVC.h"
#import <MapKit/MapKit.h>

@interface CreateMissionVC () <MKMapViewDelegate,UIPickerViewDelegate,UIPickerViewDataSource>
{
    UIScrollView *bgS;
    MKMapView *map;
    UILabel *missionId;
    
    UIButton *chooseBtn;
    NSArray *chooseArray;
    
    MLoctionVO *loc;
    MemberDatabase *member;
    
    NSString *missionDelegate;
    
}
@end

@implementation CreateMissionVC

-(void)viewDidLayoutSubviews{
    bgS.contentSize = CGSizeMake(bgS.frame.size.width, bgS.frame.size.height*3);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    member = [MemberDatabase stand];
    if (_mission == nil) {
        _mission = [MissionVO new];
        _mission.missionCreateMemberId = member.memberId;
    }
    missionDelegate = @"委託給：";
    if (_mission.missionCreateMemberId != member.memberId) {
        missionDelegate = @"接受至：";
    }
    
    
    loc = [MLoctionVO stand];
    
    map = [MKMapView new];
    map.delegate = self;
    map.mapType = MKMapTypeStandard;
    map.userTrackingMode = MKUserTrackingModeNone;
    [self.view addSubview:map];
    [UIView initSizeWithSelf:map
                  TargetView:self.view
                   SuperView:self.view
                  AttributeX:NSLayoutAttributeWidth
                  AttributeY:NSLayoutAttributeHeight
                 MultiplierX:1.0
                 MultiplierY:.33
                        GapX:-8.0
                        GapY:.0];
    [UIView initAtCenterTopWithSelf:map
                          SuperView:self.view
                           LevelGap:.0
                        VerticalGap:4.0];
    
    bgS = [UIScrollView new];
    [self.view addSubview:bgS];
    bgS.translatesAutoresizingMaskIntoConstraints = false;
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:bgS
                              attribute:NSLayoutAttributeTop
                              relatedBy:NSLayoutRelationEqual
                              toItem:map
                              attribute:NSLayoutAttributeBottom
                              multiplier:1.0
                              constant:4.0]];
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:bgS
                              attribute:NSLayoutAttributeBottom
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.view
                              attribute:NSLayoutAttributeBottom
                              multiplier:1.0
                              constant:-4.0]];
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:bgS
                              attribute:NSLayoutAttributeLeading
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.view
                              attribute:NSLayoutAttributeLeading
                              multiplier:1.0
                              constant:4.0]];
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:bgS
                              attribute:NSLayoutAttributeTrailing
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.view
                              attribute:NSLayoutAttributeTrailing
                              multiplier:1.0
                              constant:-4.0]];
    [self.view layoutIfNeeded];
    
    UIView *background = [UIView new];
    background.frame = CGRectMake(0, 0, bgS.frame.size.width, bgS.frame.size.height * 3);
    [bgS addSubview:background];
    background.backgroundColor = [[UIColor alloc]
                                  initWithRed:22/255.0f
                                  green:149/225.0f
                                  blue:163/225.0f
                                  alpha:.5];
    
    missionId = [UILabel new];
    self.pleaseSelectAGroup = @"任務編號：";
    if (_mission.missionId != 0) {
        missionId.text = [NSString stringWithFormat:@"任務編號：%d",_mission.missionId];
    }
    
    [missionId sizeToFit];
    [map addSubview:missionId];
    [UIView initAtLeftTopWithSelf:missionId
                        SuperView:map
                         Levelgap:4.0
                      VerticalGap:4.0];
    
    UIButton *chooseGroup = [[UIButton alloc]
                             initWithTitle:@"請選擇群組"
                             backgroundColor:[[UIColor alloc]
                                              initWithRed:237/255.0f
                                              green:127/255.0f
                                              blue:0/255.0f
                                              alpha:.3]
                             addTarget:self
                             func:@selector(choose:)
                             superView:map];
    chooseGroup.tag = 10;
    
    [UIView initArrangementWithSelf:chooseGroup
                         targetView:map
                          superView:map
                        x1Attribute:NSLayoutAttributeLeading
                        x2Attribute:NSLayoutAttributeCenterX
                        y1Attribute:NSLayoutAttributeTop
                        y2Attribute:NSLayoutAttributeTop
                        multiplierX:1.0
                        multiplierY:1.0
                               xGap:-20.0
                               yGap:-2.0];
    
    if (_mission.missionCreateMemberId != member.memberId) {
        
    }
    
    UILabel *createMemberName = [UILabel new];
    createMemberName.text = [MemberDatabase stand].nickName;
    if ([MemberDatabase stand].nickName == NULL) {
        createMemberName.text = @"自己";
    }
    [createMemberName sizeToFit];
    [map addSubview:createMemberName];
    [UIView initFromTopWithSelf:createMemberName
                     targetView:map
                      superView:self.view
                            gap:2];
    
//    MUIBottonlineTextField *missionName =
//    [[MUIBottonlineTextField alloc] initWithPlaseHold:@"請輸入任務名稱"];
//    if (_mission.missionName != NULL) {
//        missionName.text = _mission.missionName;
//    }
//    [self.view addSubview:missionName];
//    [UIView initSizeWithSelf:missionName
//                  TargetView:self.view
//                   SuperView:self.view
//                  AttributeX:NSLayoutAttributeWidth
//                  AttributeY:NSLayoutAttributeHeight
//                 MultiplierX:.75
//                 MultiplierY:.0001
//                        GapX:.0
//                        GapY:14.0];
//    [UIView initFromTopWithSelf:missionName
//                     targetView:createMemberName
//                      superView:self.view
//                            gap:2];
//    
//    
//
    UITextField *gid = [UITextField new];
    [background addSubview:gid];
    [gid sizeToFit];
    gid.translatesAutoresizingMaskIntoConstraints = false;
    [background addConstraint:[NSLayoutConstraint
                               constraintWithItem:gid
                               attribute:NSLayoutAttributeWidth
                               relatedBy:NSLayoutRelationEqual
                               toItem:background
                               attribute:NSLayoutAttributeWidth
                               multiplier:.8
                               constant:.0]];
    [UIView initAtCenterTopWithSelf:gid
                          SuperView:background
                           LevelGap:.0
                        VerticalGap:8.0];
    gid.placeholder = @"群組id";
    
    UIButton *cr = [[UIButton alloc] initWithTitle:@"建任務" backgroundColor:[UIColor greenColor] addTarget:self func:@selector(createMission) targetView:gid multiplier:1.0 superView:background];
    
    NSLog(@"%@",cr.description);
}

-(void)createMission {
    
    //測試
    _mission.groupId = 1;
    _mission.missionCreateMemberId = [MemberDatabase stand].memberId;
    _mission.missionName = @"測試任務";
    _mission.contactPerson = @"橋本環奈";
    _mission.messionTel = @"0987654321";
    _mission.missionMemo = @"好煩阿";
    
    MissionWorkPointVO *aa = [MissionWorkPointVO new];
    
    aa.order = (int)_mission.workPointList.count+1;
    aa.address = @"金錢豹";
    aa.loc = CLLocationCoordinate2DMake(23.15, 141.44);
    
    NSDateFormatter *ndf = [NSDateFormatter new];
    [ndf setDateFormat:@"YYYY-MM-dd HH:mm:ss"];

    aa.expectedArrivalTime = [ndf stringFromDate:[NSDate new]];
    
    
    [_mission.workPointList addObject:aa];
    
    NSMutableDictionary *createMission = [NSMutableDictionary new];
    [createMission setValue:@(_mission.groupId) forKey:@"groupId"];
    [createMission setValue:@(_mission.missionCreateMemberId) forKey:@"createMemberid"];
    [createMission setValue:_mission.missionName forKey:@"missionName"];
    [createMission setValue:_mission.contactPerson forKey:@"contactPerson"];
    [createMission setValue:_mission.messionTel forKey:@"missionTel"];
    [createMission setValue:_mission.missionMemo forKey:@"missionMemo"];
    [createMission setObject:@(_mission.executorId) forKey:@"executorId"];
    
    NSMutableArray *wpl = [NSMutableArray new];
    for (MissionWorkPointVO *wp in _mission.workPointList) {
        NSMutableDictionary *wpd = [NSMutableDictionary new];
        
        [wpd setValue:@(wp.order) forKey:@"order"];
        [wpd setValue:wp.address forKey:@"WPadd"];
        [wpd setValue:@(wp.loc.latitude) forKey:@"WPlat"];
        [wpd setValue:@(wp.loc.longitude) forKey:@"WPlon"];
        [wpd setValue:wp.expectedArrivalTime forKey:@"expectedArrivalTime"];
        [wpl addObject:wpd];
    }
    
    [createMission setObject:wpl forKey:@"missionWorkPoint"];
    
    NSMutableDictionary *para = [NSMutableDictionary new];
    [para addEntriesFromDictionary:@{@"createMission" : createMission}];
    [para addEntriesFromDictionary:[MemberDatabase stand].signInData];
    [[HttpConnection stand] doPostWithURLString:@"CreateMission.php" parameters:para data:nil finish:^(NSError *error, id result) {
        
    }];
}

-(void)choose:(UIButton*)sender{
    NSLog(@"\n%ld",(long)sender.tag);
    chooseBtn = sender;
    UIPickerView *picker = [UIPickerView new];
//    picker.backgroundColor = [[UIColor alloc]
//                              initWithRed:.1f
//                              green:.1f
//                              blue:.1f
//                              alpha:.3];
    picker.delegate = self;
    [picker sizeToFit];
//    picker.frame = CGRectMake(0,
//                              0,
//                              self.view.frame.size.width/2,
//                              self.view.frame.size.height/2);
    Mpop *pop = [[Mpop alloc] initPopWithSelf:picker
                                       target:sender
                                    superView:self.view];
    NSLog(@"%@",pop.description);
    
}

-(void)setPleaseSelectAGroup:(NSString *)pleaseSelectAGroup{
    
    _pleaseSelectAGroup = pleaseSelectAGroup;
    missionId.text = pleaseSelectAGroup;
    [chooseBtn setTitle:pleaseSelectAGroup
                 forState:UIControlStateNormal];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UIPickerViewDataSource
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    if (chooseBtn.tag == 10) {
        
        chooseArray = [MemberDatabase stand].people.groupList;
    }else {
        chooseArray = @[@"美女如雲群",@"正妹群"];
    }
//    chooseArray = @[@"美女如雲群",@"正妹群",@"後宮佳麗三千群",@"Twice",@"AKB48"];
    return chooseArray.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView
            titleForRow:(NSInteger)row
           forComponent:(NSInteger)component{
    
    return chooseArray[row];
}

-(void)pickerView:(UIPickerView *)pickerView
     didSelectRow:(NSInteger)row
      inComponent:(NSInteger)component{
    
    [chooseBtn setTitle:[NSString
                         stringWithFormat:@"群：%@",chooseArray[row]]
               forState:UIControlStateNormal];
    if (chooseBtn.tag == 10) {
        _mission.groupId = ((MemberGroupVO*)chooseArray[row]).groupId;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
