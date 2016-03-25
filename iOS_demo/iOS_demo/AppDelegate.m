//
//  AppDelegate.m
//  iOS_demo
//
//  Created by yik on 16/3/15.
//  Copyright © 2016年 jzg. All rights reserved.
//

#import "AppDelegate.h"
#import "SDWebImageManager.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"nav_icon_bg"] forBarMetrics:UIBarMetricsDefault];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:[[ViewController alloc] init]];
    SVProgressHUD.defaultStyle = SVProgressHUDStyleDark;
    SVProgressHUD.font = [UIFont systemFontOfSize:12];
    self.window.rootViewController = nav;
    
    
    return YES;
    
    
    
}
//自定义缓存的计算清理
- (void)removeCache:(BOOL)isNum{
    //    缓存计算  fileCount返回M            totalSize返回二进制
    [SDWebImageManager.sharedManager.imageCache
     calculateSizeWithCompletionBlock:^(NSUInteger fileCount, NSUInteger totalSize) {
         if(fileCount > 50 || isNum == YES){
             [[NSURLCache sharedURLCache] removeAllCachedResponses];
             [[[SDWebImageManager sharedManager] imageCache] clearDisk];
             [[[SDWebImageManager sharedManager] imageCache] clearMemory];
         }
         //         if(isNum == YES){
         //             [ProgressHUD show];
         //             [ProgressHUD showSuccessWithStatus:@"缓存清理成功"];
         //         }
     }];
    //    缓存清理
    //        [[NSURLCache sharedURLCache] removeAllCachedResponses];
    //        [[[SDWebImageManager sharedManager] imageCache] clearDisk];
    //        [[[SDWebImageManager sharedManager] imageCache] clearMemory];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
