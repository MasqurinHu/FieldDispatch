//
//  ViewController.m
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/7/18.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "LogIn.h"
#import "MobileDataBase.h"


@interface ViewController ()<MKMapViewDelegate,CLLocationManagerDelegate>
{
    MKMapView *map;
    CLLocationManager *locManager;
    MobileDataBase *mobileDataBase;
    UIStoryboard * teststory;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    mobileDataBase = [MobileDataBase stand];
    [mobileDataBase
     setSizeWithWidth:self.view.frame.size.width
     height:self.view.frame.size.height];
    [self prepare];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [self prepare];
}

-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation{
    
}

-(void)prepare{
    LogIn *login = [LogIn sharedInstance];
    if ([login didLogin] != true) {
        
        LoginViewController *logVC = [self.storyboard instantiateViewControllerWithIdentifier:@"VC"];
        [self.navigationController pushViewController:logVC animated:true];
        return;
    };
    
    locManager = [CLLocationManager new];
    locManager.delegate = self;
    
    locManager.allowsBackgroundLocationUpdates = true;
    NSLayoutConstraint *cn;
    map = [MKMapView new];
    map.delegate = self;
    map.userTrackingMode = MKUserTrackingModeFollowWithHeading;
    [map setTranslatesAutoresizingMaskIntoConstraints:false];
    [self.view addSubview:map];
    cn = [NSLayoutConstraint
          constraintWithItem:map
          attribute:NSLayoutAttributeWidth
          relatedBy:NSLayoutRelationEqual
          toItem:self.view
          attribute:NSLayoutAttributeWidth
          multiplier:1.0
          constant:0.0
          ];
    [self.view addConstraint:cn];
    
    cn= [NSLayoutConstraint
         constraintWithItem:map
         attribute:NSLayoutAttributeHeight
         relatedBy:NSLayoutRelationEqual
         toItem:self.view
         attribute:NSLayoutAttributeHeight
         multiplier:1.0
         constant:0.0
         ];
    [self.view addConstraint:cn];
    cn = [NSLayoutConstraint
          constraintWithItem:map
          attribute:NSLayoutAttributeCenterX
          relatedBy:NSLayoutRelationEqual
          toItem:self.view
          attribute:NSLayoutAttributeCenterX
          multiplier:1.0
          constant:0.0
          ];
    [self.view addConstraint:cn];

    cn= [NSLayoutConstraint
         constraintWithItem:map
         attribute:NSLayoutAttributeCenterY
         relatedBy:NSLayoutRelationEqual
         toItem:self.view
         attribute:NSLayoutAttributeCenterY
         multiplier:1.0
         constant:0.0
         ];
    [self.view addConstraint:cn];
    [locManager requestAlwaysAuthorization];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }

@end
