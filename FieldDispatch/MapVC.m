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

#pragma - dismissCreat
-(void)dismissBTNFN{
    dissmissBTN.hidden = true;
    dissmissBTN = nil;
}

#pragma - Mission
-(void)createMission{
    NSLog(@"準備建立任務,%f,%f",map.centerCoordinate.latitude,map.centerCoordinate.longitude);
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
                                        initWithRed:.5f
                                        green:.5f
                                        blue:.5f
                                        alpha:.3];
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
        NSLog(@"地址查詢%@\n地址查詢結束",placemarks);
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
}

#pragma - CLLoction
-(void)locationManager:(CLLocationManager *)manager
    didUpdateLocations:(NSArray<CLLocation *> *)locations{
    userLoc = locations.lastObject;
}

-(void)changeAddressBarWithLocation:(CLLocation*)location {
    
    [[CLGeocoder new]
     reverseGeocodeLocation:location
     completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
         
         CLPlacemark *placemark = [placemarks objectAtIndex:0];
         if (placemark) {
             NSLog(@"\n資訊placemark\n %@",placemark);
             //String to hold address
             NSString *locatedAt = [[placemark.addressDictionary valueForKey:@"FormattedAddressLines"] componentsJoinedByString:@", "];
             NSLog(@"\n字典addressDictionary \n%@", placemark.addressDictionary);
             NSLog(@"placemark\n範圍 %@",placemark.region);
             NSLog(@"placemark\n國家 %@",placemark.country);
             // Give Country Name
             NSLog(@"placemark\n鄉鎮市區 %@",placemark.locality);
             // Extract the city name
             NSLog(@"location \n地標名字 %@",placemark.name);
             NSLog(@"location \n我是%@",placemark.ocean);
             NSLog(@"location \n我是2%@",placemark.postalCode);
             NSLog(@"location \n我是3%@",placemark.subLocality);
             NSLog(@"location \n位置資訊，緯經度，精確範圍，秒速，時間%@",placemark.location);
             //Print the location to console
             NSLog(@"I am currently at %@",locatedAt);
             
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
