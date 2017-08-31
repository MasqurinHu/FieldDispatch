//
//  AppDelegate.m
//  FieldDispatch
//
//  Created by Ｍasqurin on 2017/7/18.
//  Copyright © 2017年 Ｍasqurin. All rights reserved.
//

#import "AppDelegate.h"
#import <FBSDKCoreKit.h>
#import "FieldDispatchDataBase.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

//原生內加fb app啟動瞬間
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //Fb
    [[FBSDKApplicationDelegate sharedInstance] application:application
                             didFinishLaunchingWithOptions:launchOptions];
    
    //google
    NSError* configureError;
    [GIDSignIn sharedInstance].clientID = @"329125333064-i1irpo24q0imgj9gukmuclhfg73fk4mi.apps.googleusercontent.com";
    NSAssert(!configureError, @"Error configuring Google services: %@", configureError);
    [GIDSignIn sharedInstance].delegate = self;

    
    //設定通知
    UIUserNotificationType type = UIUserNotificationTypeAlert|UIUserNotificationTypeBadge;
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:type categories:nil];
    [application registerUserNotificationSettings:settings];
    //註冊使用通知
    [application registerForRemoteNotifications];
    
    return YES;
}

//
- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    
    NSLog(@"\n聽說是舊版連線");
    //google登入
    if ([[GIDSignIn sharedInstance] handleURL:url
                            sourceApplication:sourceApplication
                                   annotation:annotation]) {
        return true;
    }
    
    BOOL handled = [[FBSDKApplicationDelegate sharedInstance]
                    application:application
                    openURL:url
                    sourceApplication:sourceApplication
                    annotation:annotation
                    ];
    return handled;
}
//
- (BOOL)application:(UIApplication *)app
            openURL:(NSURL *)url
            options:(NSDictionary *)options {
    
    NSLog(@"\n聽說是新版連線 FB,google使用多次");
    if ([[FBSDKApplicationDelegate sharedInstance]
         application:app
         openURL:url
         sourceApplication:options[UIApplicationOpenURLOptionsSourceApplicationKey]
         annotation:options[UIApplicationOpenURLOptionsAnnotationKey]]) {
        
        return true;
    }
    
    return [[GIDSignIn sharedInstance]
            handleURL:url
            sourceApplication:options[UIApplicationOpenURLOptionsSourceApplicationKey]
            annotation:options[UIApplicationOpenURLOptionsAnnotationKey]];
}

//登入
- (void)signIn:(GIDSignIn *)signIn
            didSignInForUser:(GIDGoogleUser *)user
                withError:(NSError *)error {
    NSLog(@"\n我在applaction");
}

//google登出後要幹嘛 假的 不知道什麼時候觸發
- (void)signIn:(GIDSignIn *)signIn
            didDisconnectWithUser:(GIDGoogleUser *)user
                        withError:(NSError *)error {
    // Perform any operations when the user disconnects from app here.
    NSLog(@"\n我是登出google 真的會觸發嗎");
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    //記錄app被啟動過多少次以及FB登入過幾次
    int severalTimes;
    if ( [[NSUserDefaults standardUserDefaults] objectForKey:@"severalTimes"] == nil) {
        severalTimes = 0;
    }else{
        severalTimes = [[[NSUserDefaults standardUserDefaults] objectForKey:@"severalTimes"] intValue];
    }
    [[NSUserDefaults standardUserDefaults] setObject:@(++severalTimes) forKey:@"severalTimes"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    NSLog(@"APP啟動及fb登入幾次?%d",severalTimes);
    [FBSDKAppEvents activateApp];
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

#pragma mark - deviceToken
-(void)application:(UIApplication *)application
    didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken{
    
    NSLog(@"\n原生DeviceToken:\n%@",deviceToken.description);
    //將<a71d0f93b9478e70f3e36414cc555992d635fcd825701b9d659f697296d4d864>轉成字串
    NSString *deviceTokenString = deviceToken.description;
    //去刮號空白
    deviceTokenString = [deviceTokenString
                         stringByReplacingOccurrencesOfString:@"<" withString:@""];
    deviceTokenString = [deviceTokenString
                         stringByReplacingOccurrencesOfString:@" " withString:@""];
    deviceTokenString = [deviceTokenString
                         stringByReplacingOccurrencesOfString:@">" withString:@""];
    NSLog(@"\n修正後\n%@",deviceTokenString);
    
    [[NSUserDefaults standardUserDefaults] setObject:deviceTokenString forKey:@"deviceToken"];
    [MemberDatabase stand].deviceToken = deviceTokenString;
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    //檢查是否有帳號登入 有登入就回報deviceToken 及memberId
    NSString *memberId = [[NSUserDefaults standardUserDefaults] objectForKey:@"memberId"];
    if (memberId != NULL) {
        [[LogIn sharedInstance] upDateDeviceToken:deviceTokenString memberId:memberId transmissionResults:^(NSError *error, id result) {
            
            if (error) {
                NSLog(@"\n連線異常，錯誤訊息: %@",error.description);
                return ;
            }
            NSDictionary *severMemo = (NSDictionary*)result;
            if ([severMemo[@"result"] boolValue] == false) {
                NSLog(@"\n伺服器資料異常，錯誤訊息： %@",severMemo[@"errorCode"]);
                return;
            }
            
            NSLog(@"\nDeviceToken更新正常，id為： %@",severMemo[@"deviceTokenId"]);
        }];
    }
    
    
}

//獲取失敗
-(void)application:(UIApplication *)application
    didFailToRegisterForRemoteNotificationsWithError:(NSError *)error{
    
    NSLog(@"\ndidFailToRegisterForRemoteNotificationsWithError:%@",error.description);
}

#pragma mark - didReceiveRemoteNotification
-(void)application:(UIApplication *)application
        didReceiveRemoteNotification:(NSDictionary *)userInfo
        fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler{
    
    NSLog(@"\ndidReceiveRemoteNotification:\n%@",userInfo);
    [[NSNotificationCenter defaultCenter] postNotificationName:@"notification" object:nil];//待實作
    
    //回報收到新資料newdata或是沒資料nodata
    completionHandler(UIBackgroundFetchResultNewData);
}

#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"FieldDispatch"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
