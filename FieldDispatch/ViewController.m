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
    UIView *aa;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    mobileDataBase = [MobileDataBase stand];
    [mobileDataBase
     setSizeWithWidth:self.view.frame.size.width
     height:self.view.frame.size.height];
    aa = [UIView new];
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
    
    
    
    MUIButtonAutoLayout *circle = [[MUIButtonAutoLayout alloc]
                                   initWithTitle:@"circle"
                                   backgroundColor:[UIColor brownColor]
                                   addTarget:self
                                   func:@selector(goToCircleButton)
                                   targetView:self.view
                                   multiplier:1.0
                                   superView:self.view];
    NSLog(@"%@",circle);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(void)goToCircleButton{
    NSLog(@"我要去右下角按鈕");
    CircleViewController *cv = [self.storyboard instantiateViewControllerWithIdentifier:@"CircleViewController"];
    
    
    [self addChildViewController:cv];
    [self.view addSubview:cv.view];
//    cv.view.frame = CGRectMake(self.view.frame.size.width*1/2, self.view.frame.size.height*2/3, self.view.frame.size.width/2, self.view.frame.size.width/2);
    cv.view.translatesAutoresizingMaskIntoConstraints = false;
    NSMutableArray <NSLayoutConstraint*>* lay = [NSMutableArray new];
    [lay addObject:[NSLayoutConstraint
                    constraintWithItem:cv.view
                    attribute:NSLayoutAttributeWidth
                    relatedBy:NSLayoutRelationEqual
                    toItem:self.view
                    attribute:NSLayoutAttributeWidth
                    multiplier:.5 constant:0.0]];
    [lay addObject:[NSLayoutConstraint
                    constraintWithItem:cv.view
                    attribute:NSLayoutAttributeHeight
                    relatedBy:NSLayoutRelationEqual
                    toItem:self.view
                    attribute:NSLayoutAttributeWidth
                    multiplier:.5 constant:0.0]];
    [lay addObject:[NSLayoutConstraint
                    constraintWithItem:cv.view
                    attribute:NSLayoutAttributeBottom
                    relatedBy:NSLayoutRelationEqual
                    toItem:self.view
                    attribute:NSLayoutAttributeBottom
                    multiplier:1.0 constant:-10.0]];
    [lay addObject:[NSLayoutConstraint
                    constraintWithItem:cv.view
                    attribute:NSLayoutAttributeRight
                    relatedBy:NSLayoutRelationEqual
                    toItem:self.view
                    attribute:NSLayoutAttributeRight
                    multiplier:1.0 constant:0.0]];
    [self.view addConstraints:lay];
    [self.view layoutIfNeeded];
    cv.view.layer.cornerRadius = self.view.frame.size.width/4;
//    cv.view.layer.masksToBounds = true;
//    cv.view.clipsToBounds = true;

    
    
    
    [cv didMoveToParentViewController:self];
//    [self.navigationController pushViewController:cv animated:true];
}
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }

@end
