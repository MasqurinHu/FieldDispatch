//
//  LoginViewController.m
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/7/21.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import "LoginViewController.h"
#import <FBSDKCoreKit.h>
#import <FBSDKLoginKit.h>
#import <GoogleSignIn/GoogleSignIn.h>
#import "AppDelegate.h"
#import "MasqurinTool.h"

@interface LoginViewController ()<GIDSignInUIDelegate,GIDSignInDelegate>
{
    FBSDKLoginButton *loginButton;
    NSLayoutConstraint *constraint;
}
@property(weak, nonatomic) IBOutlet GIDSignInButton *signInButton;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self prepare];
}
-(void)singoutView{
    //登出準備登入畫面
    UILabel *title = [UILabel new];
    title.numberOfLines = 0;
    title.text = @"Welcome to the Field Dispatch system\nPlease select the login method";
    
    [title setTranslatesAutoresizingMaskIntoConstraints:false];
//    [title sizeToFit];
    [self.view addSubview:title];
//    title.center = self.view.center;
    
//    constraint = [NSLayoutConstraint
//                  constraintWithItem:title
//                  attribute:NSLayoutAttributeWidth
//                  relatedBy:NSLayoutRelationEqual
//                  toItem:self.view
//                  attribute:NSLayoutAttributeWidth
//                  multiplier:.8
//                  constant:0.0
//                  ];
//    [self.view addConstraint:constraint];
//    
//    constraint = [NSLayoutConstraint
//                  constraintWithItem:title
//                  attribute:NSLayoutAttributeHeight
//                  relatedBy:NSLayoutRelationEqual
//                  toItem:self.view
//                  attribute:NSLayoutAttributeHeight
//                  multiplier:.2
//                  constant:0.0
//                  ];
//    [self.view addConstraint:constraint];

    constraint = [NSLayoutConstraint
                  constraintWithItem:title
                  attribute:NSLayoutAttributeCenterX
                  relatedBy:NSLayoutRelationEqual
                  toItem:self.view
                  attribute:NSLayoutAttributeCenterX
                  multiplier:1.0
                  constant:0.0
                  ];
    [self.view addConstraint:constraint];
//    constraint.firstAttribute = NSLayoutAttributeCenterY;
    constraint = [NSLayoutConstraint
                  constraintWithItem:title
                  attribute:NSLayoutAttributeCenterY
                  relatedBy:NSLayoutRelationEqual
                  toItem:self.view
                  attribute:NSLayoutAttributeCenterY
                  multiplier:1/3.0 constant:0.0];
    [self.view addConstraint:constraint];
    MUIBottonlineTextField *account = [MUIBottonlineTextField new];
    account.placeholder = @"Please enter the account";//請輸入您要申請的帳戶
    [account setTranslatesAutoresizingMaskIntoConstraints:false];
    [self.view addSubview:account];
    constraint = [NSLayoutConstraint
                  constraintWithItem:account
                  attribute:NSLayoutAttributeWidth
                  relatedBy:NSLayoutRelationEqual
                  toItem:self.view
                  attribute:NSLayoutAttributeWidth
                  multiplier:.8
                  constant:0.0
                  ];
    [self.view addConstraint:constraint];
    constraint = [NSLayoutConstraint
                  constraintWithItem:account
                  attribute:NSLayoutAttributeTop
                  relatedBy:NSLayoutRelationEqual
                  toItem:title
                  attribute:NSLayoutAttributeBottom
                  multiplier:1.0
                  constant:10.0
                  ];
    [self.view addConstraint:constraint];
    constraint = [NSLayoutConstraint
                  constraintWithItem:account
                  attribute:NSLayoutAttributeCenterX
                  relatedBy:NSLayoutRelationEqual
                  toItem:title
                  attribute:NSLayoutAttributeCenterX
                  multiplier:1.0 constant:0.0];
    [self.view addConstraint:constraint];
//    UIView *bottomline = [UIView new];
//    bottomline.backgroundColor = [UIColor blackColor];
//    [bottomline setTranslatesAutoresizingMaskIntoConstraints:false];
//    [self.view addSubview:bottomline];
//    constraint = [NSLayoutConstraint
//                  constraintWithItem:bottomline
//                  attribute:NSLayoutAttributeWidth
//                  relatedBy:NSLayoutRelationEqual
//                  toItem:account
//                  attribute:NSLayoutAttributeWidth
//                  multiplier:1.0 constant:0.0];
//    [self.view addConstraint:constraint];
//    constraint = [NSLayoutConstraint constraintWithItem:bottomline attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:account attribute:NSLayoutAttributeHeight multiplier:.01 constant:.0];
//    [self.view addConstraint:constraint];
//    constraint = [NSLayoutConstraint constraintWithItem:bottomline attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:account attribute:NSLayoutAttributeBottom multiplier:1.0 constant:.0];
//    [self.view addConstraint:constraint];
//    constraint = [NSLayoutConstraint constraintWithItem:bottomline attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:account attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:.0];
//    [self.view addConstraint:constraint];
//    UIBottonlineTextField *bbb = [UIBottonlineTextField new];
//    
//    bbb.placeholder = @"有用嗎";
//    [self.view addSubview:bbb];
}
-(void)singinView{
    //登入準備登出畫面
    loginButton.center = self.view.center;
    [self.view addSubview:loginButton];
}

-(void)prepare{
    [GIDSignIn sharedInstance].uiDelegate = self;
    [GIDSignIn sharedInstance].delegate = self;
    loginButton = [FBSDKLoginButton new];
    // 選擇性：將按鈕置於檢視中央。測試
    [self singoutView];
}

-(void)viewWillDisappear:(BOOL)animated{
    NSLog(@"我是回來準備");
    if ([FBSDKAccessToken currentAccessToken]) {
        NSLog(@"\n回來確認登入");
        NSString *aa = @"true";
        [[NSUserDefaults standardUserDefaults] setObject: aa forKey:@"login"];
        [[NSUserDefaults standardUserDefaults] synchronize];
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

- (void)signIn:(GIDSignIn *)signIn
didSignInForUser:(GIDGoogleUser *)user
     withError:(NSError *)error {
    // Perform any operations on signed in user here.
    // For client-side use only!
    if (user == nil) {
        NSLog(@"登入失敗");
        return;
    }
    
    
    NSString *userId = user.userID;
    // Safe to send to the server
    NSString *idToken = user.authentication.idToken;
    NSString *fullName = user.profile.name;
    NSString *givenName = user.profile.givenName;
    NSString *familyName = user.profile.familyName;
    NSString *email = user.profile.email;
    NSLog(@"\n我是id%@\n我是偷捆%@\n我是全名%@\n我是givenName%@\n我是性%@\n我是信箱%@",userId,idToken,fullName,givenName,familyName,email);
    // ...
    NSLog(@"\n回來確認登入");
    NSString *login = @"Google";
    [[NSUserDefaults standardUserDefaults] setObject: login forKey:@"login"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)viewWillAppear:(BOOL)animated{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (IBAction)didTapSignOut:(id)sender {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"login"];
    NSLog(@"登出Google");
    [[GIDSignIn sharedInstance] signOut];
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
