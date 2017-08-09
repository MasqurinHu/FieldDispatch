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

@interface MapVC ()<MKMapViewDelegate,CLLocationManagerDelegate>

@end

@implementation MapVC
{
    CLLocationManager *locManager;
    MKMapView *map;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    locManager = [CLLocationManager new];
    locManager.delegate = self;
    locManager.allowsBackgroundLocationUpdates = true;
    [locManager requestAlwaysAuthorization];
    
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
                 MultiplierX:.8
                 MultiplierY:.8
                        GapX:.0
                        GapY:.0];
    [UIView initAtCenterCenterWithSelf:map
                             SuperView:self.view
                              LevelGap:.0
                           VerticalGap:.0];
    
    
    
    
    
    
    
    
}





#pragma - CLLoction
-(void)locationManager:(CLLocationManager *)manager
    didUpdateLocations:(NSArray<CLLocation *> *)locations{
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
