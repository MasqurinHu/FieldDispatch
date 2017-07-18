//
//  ViewController.m
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/7/18.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import "ViewController.h"
#import <FBSDKCoreKit.h>
#import <FBSDKLoginKit.h>
#import <GoogleSignIn/GoogleSignIn.h>

@interface ViewController ()<GIDSignInUIDelegate>
@property(weak, nonatomic) IBOutlet GIDSignInButton *signInButton;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    // 選擇性：將按鈕置於檢視中央。測試
    [GIDSignIn sharedInstance].uiDelegate = self;
    loginButton.center = self.view.center;
    [self.view addSubview:loginButton];
    if ([FBSDKAccessToken currentAccessToken]) {
        // 用戶已登入，執行如前往下一個檢視控制器的操作。
        loginButton.readPermissions =
        @[@"public_profile", @"email", @"user_friends"];
        FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc]
                                      initWithGraphPath:@"me"
                                      parameters:@{@"fields" : @"gender,picture,email, name, first_name, last_name"}
                                      HTTPMethod:@"GET"];
        [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection,
                                              id result,
                                              NSError *error) {
            // Handle the result
            NSLog(@"我是資料%@",result);
        }];
        
        
    }
}

- (IBAction)didTapSignOut:(id)sender {
    [[GIDSignIn sharedInstance] signOut];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
