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
#import "FieldDispatchDataBase.h"



@interface ViewController ()<MKMapViewDelegate,CLLocationManagerDelegate>
{
    BOOL singIn;
    BOOL isprepare;
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
}

-(void)viewWillAppear:(BOOL)animated{
    [self checkLogin];
    if (singIn != true) {
        return;
    }
    if (isprepare != true) {
        [self prepare];
    }
    
}

-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation{
    
}

-(void)checkLogin{
    LogIn *login = [LogIn sharedInstance];
    singIn = [login didLogin];
    if ([login didLogin] != true) {
        LoginViewController *logVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SE"];
        [self presentViewController:logVC animated:true completion:nil];
        return;
    };
}

-(void)prepare{
    isprepare = true;
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
