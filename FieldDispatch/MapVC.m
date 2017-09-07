//
//  MapVC.m
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/8/8.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import "MapVC.h"
#import "FieldDispatchDataBase.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import <UserNotifications/UserNotifications.h>

@interface MapVC ()<MKMapViewDelegate,CLLocationManagerDelegate,UITextFieldDelegate>

@end

@implementation MapVC
{
    CLLocationManager *locManager;
    MKMapView *map;
    MUIBottonlineTextField *missionLoc;
    CLLocation *userLoc;
    MUIButtonAutoLayout *backRegion;
    UIView *loc;
    MKPointAnnotation *missionLocAnn;
    MissionVO *createMission;
    UIButton *dissmissBTN;
    
    CLLocation *oldLoc;
    NSDate *oldTime;
    
    MUIBottonlineTextField *missionName;
    MUIBottonlineTextField *missionTel;
    MUIBottonlineTextField *missionMemo;
    
    int lock;
}

//設定本地通知
-(void) alerttt {
    UNMutableNotificationContent *content = [UNMutableNotificationContent new];
    content.title = @"你好";
    content.body = @"我是通知";
    content.sound = [UNNotificationSound defaultSound];
    UNNotificationRequest *request = [UNNotificationRequest
                                      requestWithIdentifier:@"requ"
                                      content:content
                                      trigger:nil];
    
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    [center removeAllPendingNotificationRequests];
    [center addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@",error.description);
        }
    }];
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    locManager = [CLLocationManager new];
    locManager.delegate = self;
    locManager.allowsBackgroundLocationUpdates = true;
    [locManager requestAlwaysAuthorization];
    [locManager startUpdatingLocation];
    
    map = [MKMapView new];
    map.delegate = self;
    map.userTrackingMode = MKUserTrackingModeFollowWithHeading;
    map.translatesAutoresizingMaskIntoConstraints = false;
    [self.view addSubview:map];
    [UIView initSizeWithSelf:map
                  TargetView:self.view
                   SuperView:self.view
                  AttributeX:NSLayoutAttributeWidth
                  AttributeY:NSLayoutAttributeHeight
                 MultiplierX:1.0
                 MultiplierY:1.0
                        GapX:.0
                        GapY:.0];
    [UIView initAtCenterCenterWithSelf:map
                             SuperView:self.view
                              LevelGap:.0
                           VerticalGap:.0];
    
    missionLoc = [MUIBottonlineTextField new];
    missionLoc.delegate = self;
    [self.view addSubview:missionLoc];
    missionLoc.backgroundColor = [[UIColor alloc]
                                  initWithRed:0.01f
                                  green:.01f
                                  blue:.01f
                                  alpha:.2];
    [UIView initAtCenterTopWithSelf:missionLoc
                          SuperView:self.view
                           LevelGap:.0
                        VerticalGap:20.0];
    [UIView initWidthWithSelf:missionLoc
                   TargetView:map
                    SuperView:self.view
                   Multiplier:.7
                     Constant:.0];
    [UIView initHeightWithSelf:missionLoc
                    TargetView:map SuperView:self.view
                    Multiplier:.001
                      Constant:40];
    
    [self.view layoutIfNeeded];
    loc = [UIView new];
    loc.backgroundColor = [UIColor blueColor];
    loc.frame = CGRectMake(map.frame.size.width/2-1, map.frame.size.height/2-56, 2, 20);
    [map addSubview:loc];
    
    UIButton *clearText = [UIButton buttonWithType:UIButtonTypeContactAdd];
    clearText.transform = CGAffineTransformMakeRotation(M_PI/4);
    clearText.translatesAutoresizingMaskIntoConstraints = false;
    [clearText addTarget:self
                  action:@selector(cleartetxField)
        forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:clearText];
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:clearText
                              attribute:NSLayoutAttributeLeading
                              relatedBy:NSLayoutRelationEqual
                              toItem:missionLoc
                              attribute:NSLayoutAttributeTrailing
                              multiplier:1.0
                              constant:4.0]];
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:clearText
                              attribute:NSLayoutAttributeCenterY
                              relatedBy:NSLayoutRelationEqual
                              toItem:missionLoc
                              attribute:NSLayoutAttributeCenterY
                              multiplier:1.0
                              constant:.0]];
    
    backRegion = [[MUIButtonAutoLayout alloc]
                                       initWithTitle:@"十"
                                       backgroundColor:[[UIColor alloc]
                                                        initWithRed:.0f
                                                        green:.0f
                                                        blue:.0f
                                                        alpha:.3]
                                       addTarget:self
                                       func:@selector(backUserLoc)
                                       superView:self.view];
    [UIView initAtRightCenterWithSelf:backRegion
                            SuperView:self.view
                             LevelGap:-10.0
                          VerticalGap:.0];
    backRegion.hidden = true;
    loc.hidden = true;
    missionLocAnn = [MKPointAnnotation new];
    
    
    
    
    
    
    
    
}

//進入
-(void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region {
    [self alerttt];
    NSLog(@"近來了");
    lock = 1;
}

-(void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region {
//    [self alerttt];
    NSLog(@"出去了");
    lock = 0;
}



#pragma - dismissCreat
-(void)dismissBTNFN{
    dissmissBTN.hidden = true;
    dissmissBTN = nil;
}

#pragma - Mission
-(void)createMission{
//    NSLog(@"準備建立任務,%f,%f",map.centerCoordinate.latitude,map.centerCoordinate.longitude);
    createMission = [MissionVO new];
    
    dissmissBTN = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:dissmissBTN];
    [UIView initAtCenterCenterWithSelf:dissmissBTN
                             SuperView:self.view
                              LevelGap:.0
                           VerticalGap:.0];
    [UIView initSizeWithSelf:dissmissBTN
                  TargetView:self.view
                   SuperView:self.view
                  AttributeX:NSLayoutAttributeWidth
                  AttributeY:NSLayoutAttributeHeight
                 MultiplierX:1.0
                 MultiplierY:1.0
                        GapX:.0
                        GapY:.0];
    [dissmissBTN addTarget:self
                    action:@selector(dismissBTNFN)
          forControlEvents:UIControlEventTouchUpInside];
    
    UIView *createBackground = [UIView new];
    [dissmissBTN addSubview:createBackground];
    createBackground.backgroundColor = [[UIColor alloc]
                                        initWithRed:.2f
                                        green:.2f
                                        blue:.43f
                                        alpha:.8];
    [UIView initSizeWithSelf:createBackground
                  TargetView:dissmissBTN
                   SuperView:dissmissBTN
                  AttributeX:NSLayoutAttributeWidth
                  AttributeY:NSLayoutAttributeHeight
                 MultiplierX:.75
                 MultiplierY:.75
                        GapX:.0
                        GapY:.0];
    [UIView initAtCenterCenterWithSelf:createBackground
                             SuperView:dissmissBTN
                              LevelGap:.0
                           VerticalGap:.0];
    [self.view layoutIfNeeded];
    [dissmissBTN layoutIfNeeded];
    createBackground.layer.borderWidth = createBackground.frame.size.height*.003;
    createBackground.layer.cornerRadius = createBackground.frame.size.height*.1;
    
    UILabel *startingPointL = [UILabel new];
    [createBackground addSubview:startingPointL];
//    NSString *workPoint1 = [self ];
    startingPointL.text = @"工作點一：";
    [startingPointL sizeToFit];
    startingPointL.translatesAutoresizingMaskIntoConstraints = false;
    [createBackground addConstraint:[NSLayoutConstraint
                                     constraintWithItem:startingPointL
                                     attribute:NSLayoutAttributeTop
                                     relatedBy:NSLayoutRelationEqual
                                     toItem:createBackground
                                     attribute:NSLayoutAttributeTop
                                     multiplier:1.0
                                     constant:10.0]];
    [createBackground addConstraint:[NSLayoutConstraint
                                     constraintWithItem:startingPointL
                                     attribute:NSLayoutAttributeLeading
                                     relatedBy:NSLayoutRelationEqual
                                     toItem:createBackground
                                     attribute:NSLayoutAttributeLeading
                                     multiplier:1.0
                                     constant:10.0]];
    
    
//    MKUserTrackingBarButtonItem *aaa = [[MKUserTrackingBarButtonItem alloc] initWithMapView:map];
    
    missionName = [MUIBottonlineTextField new];
    missionName.translatesAutoresizingMaskIntoConstraints = false;
    [createBackground addSubview:missionName];
    [UIView initAtCenterTopWithSelf:missionName
                          SuperView:createBackground
                           LevelGap:.0
                        VerticalGap:20.0];
    [UIView initSizeWithSelf:missionName
                  TargetView:createBackground
                   SuperView:createBackground
                  AttributeX:NSLayoutAttributeWidth
                  AttributeY:NSLayoutAttributeHeight
                 MultiplierX:.7
                 MultiplierY:.00001
                        GapX:.0
                        GapY:16.0];
    missionName.placeholder = @"請輸入任務名稱";
    
    missionTel = [MUIBottonlineTextField new];
    [createBackground addSubview:missionTel];
    missionTel.translatesAutoresizingMaskIntoConstraints = false;
    [UIView initSizeWithSelf:missionTel
                  TargetView:missionName
                   SuperView:createBackground
                  AttributeX:NSLayoutAttributeWidth
                  AttributeY:NSLayoutAttributeHeight
                 MultiplierX:1.0
                 MultiplierY:1.0
                        GapX:.0
                        GapY:.0];
    [UIView initFromTopWithSelf:missionTel
                     targetView:missionName
                      superView:createBackground
                            gap:16.0];
    missionTel.placeholder = @"請輸入聯絡電話";
    missionTel.keyboardType = UIKeyboardTypeNumberPad;
    
    missionMemo = [MUIBottonlineTextField new];
    [createBackground addSubview: missionMemo];
    missionMemo.translatesAutoresizingMaskIntoConstraints = false;
    [UIView initSizeWithSelf:missionMemo
                  TargetView:missionName
                   SuperView:createBackground
                  AttributeX:NSLayoutAttributeWidth
                  AttributeY:NSLayoutAttributeHeight
                 MultiplierX:1.0
                 MultiplierY:1.0
                        GapX:.0
                        GapY:.0];
    [UIView initFromTopWithSelf:missionMemo
                     targetView:missionTel
                      superView:createBackground
                            gap:16.0];
    missionMemo.placeholder = @"請輸入任務其他資訊";
    
    
    UIButton *mi = [[UIButton alloc]
                    initWithTitle:@"快速建立"
                    backgroundColor:[UIColor yellowColor]
                    addTarget:self func:@selector(cMissiom)
                    targetView:createBackground multiplier:1.0 superView:createBackground];
    
    [mi setTintColor:[UIColor blackColor]];
    
}

-(void) cMissiom {
    if (missionName.text.length < 1) {
        missionLoc.text = @"任務名稱空白";
        return;
    }
    if (missionTel.text.length < 1) {
        missionLoc.text = @"聯絡電話空白";
        return;
    }
    
    //測試
    MissionVO *mission = [MissionVO new];
    mission.groupId = 1;
    mission.missionCreateMemberId = [MemberDatabase stand].memberId;
    mission.contactPerson = @"周子榆";
    mission.missionName = missionName.text;
    mission.messionTel = missionTel.text;
    mission.missionMemo = missionMemo.text;
    
    MissionWorkPointVO *aa = [MissionWorkPointVO new];
    aa.order = 1;
    aa.address = missionLoc.text;
    aa.loc = map.centerCoordinate;
    
    NSDateFormatter *ndf = [NSDateFormatter new];
    [ndf setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    
    aa.expectedArrivalTime = [ndf stringFromDate:[NSDate new]];
    
    
    [mission.workPointList addObject:aa];
    
    NSMutableDictionary *createMission1 = [NSMutableDictionary new];
    [createMission1 setValue:@(mission.groupId) forKey:@"groupId"];
    [createMission1 setValue:@(mission.missionCreateMemberId) forKey:@"createMemberid"];
    [createMission1 setValue:mission.missionName forKey:@"missionName"];
    [createMission1 setValue:mission.contactPerson forKey:@"contactPerson"];
    [createMission1 setValue:mission.messionTel forKey:@"missionTel"];
    [createMission1 setValue:mission.missionMemo forKey:@"missionMemo"];
    [createMission1 setObject:@(mission.executorId) forKey:@"executorId"];
    
    
    NSMutableArray *wpl = [NSMutableArray new];
    for (MissionWorkPointVO *wp in mission.workPointList) {
        NSMutableDictionary *wpd = [NSMutableDictionary new];
        
        [wpd setValue:@(wp.order) forKey:@"order"];
        [wpd setValue:wp.address forKey:@"WPadd"];
        [wpd setValue:@(wp.loc.latitude) forKey:@"WPlat"];
        [wpd setValue:@(wp.loc.longitude) forKey:@"WPlon"];
        [wpd setValue:wp.expectedArrivalTime forKey:@"expectedArrivalTime"];
        [wpl addObject:wpd];
    }
    
    [createMission1 setObject:wpl forKey:@"missionWorkPoint"];
    
    NSMutableDictionary *para = [NSMutableDictionary new];
    [para addEntriesFromDictionary:@{@"createMission" : createMission1}];
    [para addEntriesFromDictionary:[MemberDatabase stand].signInData];
    
    
    [[HttpConnection stand] doPostWithURLString:@"CreateMission.php" parameters:para data:nil finish:^(NSError *error, id result) {
        
    }];
}


#pragma - clearTextField
-(void)cleartetxField{
    missionLoc.text = @"";
}

#pragma textField
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    NSLog(@"有嗎");
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    [[CLGeocoder new] geocodeAddressString:textField.text completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
//        NSLog(@"地址查詢%@\n地址查詢結束",placemarks);
        if (placemarks[0]) {
            [map setCenterCoordinate:placemarks[0].location.coordinate animated:true];
        }else {
            textField.text = @"";
            textField.placeholder = @"沒有這個地方";
        }
    }];
    return true;
}


#pragma - MKMapView
-(void)mapView:(MKMapView *)mapView regionWillChangeAnimated:(BOOL)animated{
    backRegion.hidden = false;
    loc.hidden = false;
}

-(void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated{
    CLLocation *mapCenterLoc = [[CLLocation alloc]
                                initWithLatitude:map.centerCoordinate.latitude
                                longitude:map.centerCoordinate.longitude];
    
    [self changeAddressBarWithLocation:mapCenterLoc];
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    if (annotation == mapView.userLocation){
        return nil;
    }
    NSString *identifier = annotation.subtitle;
        MKPinAnnotationView *result = (MKPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
//    MKAnnotationView *result = [mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    if(result == nil){
        result = [[MKPinAnnotationView alloc]initWithAnnotation:annotation
                                                reuseIdentifier:identifier];
//        result = [[MKAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:identifier];
    }else{
        result.annotation = annotation;
    }
    result.canShowCallout = true;
    
//        result.pinColor = MKPinAnnotationColorGreen;
//        result.pinTintColor = [UIColor brownColor];
    
    UILabel *left = [UILabel new];
    left.text = @"左邊";
    [left sizeToFit];
    result.leftCalloutAccessoryView = left;
    
    UIButton *createMissionBTN = [UIButton buttonWithType:UIButtonTypeSystem];
    [createMissionBTN setTitle:@"建立任務" forState:UIControlStateNormal];
    [createMissionBTN sizeToFit];
    [createMissionBTN addTarget:self
                      action:@selector(createMission)
            forControlEvents:UIControlEventTouchUpInside];
    result.rightCalloutAccessoryView = createMissionBTN;
    return result;

}

-(void)backUserLoc{
    MKCoordinateRegion region;
    region.center = userLoc.coordinate;
    region.span = MKCoordinateSpanMake(.01, .01);
    [map setRegion:region animated:true];
    backRegion.hidden = true;
    
    //    NSLog(@"\n我是 ＝ %@",[MemberDatabase stand].signInData);
    NSMutableDictionary *aa = [NSMutableDictionary new];
    [aa addEntriesFromDictionary:[MemberDatabase stand].signInData];
    [aa setValue:@(userLoc.coordinate.latitude) forKey:@"lat"];
    [aa setValue:@(userLoc.coordinate.longitude) forKey:@"lon"];
    [[HttpConnection stand] doPostWithURLString:@"ReportStatus.php" parameters:aa data:nil finish:^(NSError *error, id result) {
        
    }];
    
}

#pragma - CLLoction
-(void)locationManager:(CLLocationManager *)manager
    didUpdateLocations:(NSArray<CLLocation *> *)locations{
    userLoc = locations.lastObject;
    [MemberDatabase stand].location = userLoc;
    
    
    if (lock == 0) {
        if (userLoc.coordinate.latitude > 30.0) {
                lock = 1;
        }
        
        //設定範圍
        CLCircularRegion *region = [[CLCircularRegion alloc] initWithCenter:userLoc.coordinate radius:100 identifier:@"report"];
        // id用變數 每個點要有自己的id
        [locManager requestStateForRegion:region];
        //    [locManager stopMonitoringForRegion:region];
        [locManager startMonitoringForRegion:region];
    }
    
    
}

-(void) report {
    if (oldLoc == nil) {
        oldLoc = userLoc;
    }
    
    if (oldTime == nil) {
        oldTime = [NSDate new];
    }
    
    //    NSTimeInterval after = [oldTime timeIntervalSinceNow];
    //    NSLog(@"\n我是時間%f",after);
    
    [MemberDatabase stand].location = userLoc;
    CLLocationDistance distance = [oldLoc distanceFromLocation:userLoc];
    
    if (distance > 10.0) {
        
        oldLoc = userLoc;
        
        NSMutableDictionary *aa = [NSMutableDictionary new];
        [aa addEntriesFromDictionary:[MemberDatabase stand].signInData];
        [aa setValue:@(userLoc.coordinate.latitude) forKey:@"lat"];
        [aa setValue:@(userLoc.coordinate.longitude) forKey:@"lon"];
        [[HttpConnection stand] doPostWithURLString:@"ReportStatus.php" parameters:aa data:nil finish:^(NSError *error, id result) {

        }];
    }

}

-(void)changeAddressBarWithLocation:(CLLocation*)location {
    
    [[CLGeocoder new]
     reverseGeocodeLocation:location
     completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
         
         CLPlacemark *placemark = [placemarks objectAtIndex:0];
         if (placemark) {
//             NSLog(@"\n資訊placemark\n %@",placemark);
             //String to hold address
             NSString *locatedAt = [[placemark.addressDictionary valueForKey:@"FormattedAddressLines"] componentsJoinedByString:@", "];
//             NSLog(@"\n字典addressDictionary \n%@", placemark.addressDictionary);
//             NSLog(@"placemark\n範圍 %@",placemark.region);
//             NSLog(@"placemark\n國家 %@",placemark.country);
             // Give Country Name
//             NSLog(@"placemark\n鄉鎮市區 %@",placemark.locality);
             // Extract the city name
//             NSLog(@"location \n地標名字 %@",placemark.name);
//             NSLog(@"location \n我是%@",placemark.ocean);
//             NSLog(@"location \n我是2%@",placemark.postalCode);
//             NSLog(@"location \n我是3%@",placemark.subLocality);
//             NSLog(@"location \n位置資訊，緯經度，精確範圍，秒速，時間%@",placemark.location);
             //Print the location to console
//             NSLog(@"I am currently at %@",locatedAt);
             
             missionLoc.text = locatedAt;
             [map removeAnnotation:missionLocAnn];
             missionLocAnn.coordinate = location.coordinate;
             missionLocAnn.title = locatedAt;
             missionLocAnn.subtitle = @"才好吃";
             [map addAnnotation:missionLocAnn];
             loc.hidden = true;
             
         }else {
             NSLog(@"Could not locate");
         }
         
         
     }];
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
