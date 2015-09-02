//
//  AppDelegate.m
//  StartWardrobe
//
//  Created by chengchao on 15/8/22.
//  Copyright (c) 2015年 chengchao. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "CCBaseNavigationController.h"
#import "GlobalConfig.h"
#import "YTKNetworkConfig.h"
#import "LoginInAPI.h"
#import "YTKUrlArgumentsFilter.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window=[[UIWindow   alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor=[UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    MainViewController *mainVC=[[MainViewController  alloc]init];
    CCBaseNavigationController *NavigationController1=[[CCBaseNavigationController  alloc]initWithRootViewController:mainVC];
    NavigationController1.tabBarItem.image= [UIImage imageNamed:@""];
    [self.window setRootViewController:NavigationController1];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [[GlobalConfig  ShareGlobalConfig]initGlobalLogSettting];
         [[GlobalConfig  ShareGlobalConfig]initDBSetting];
         [[GlobalConfig  ShareGlobalConfig]registerAPNS];
        
    });
    [YTKNetworkConfig sharedInstance].baseUrl=@"http://apis.baidu.com/xingqitel/app_sms/app_sms";
    YTKNetworkConfig *config=[YTKNetworkConfig sharedInstance];
    YTKUrlArgumentsFilter *fi=[YTKUrlArgumentsFilter filterWithArguments:[NSDictionary dictionaryWithObjectsAndKeys:@"a83d4ed4e3985469222512484698a983",@"apikey" ,nil]];
     [config addUrlFilter:fi];
    
//    NSArray *arr=[[NSArray alloc]initWithObjects:@{@"apikey":@"a83d4ed4e3985469222512484698a983"}];
//    
//    
//    
//    
//    
//   [ config  addUrlFilter:arr];
    
    
    NSTimer *time= [NSTimer timerWithTimeInterval:20
                            target:self
                            selector:@selector(send:)
                                    userInfo:nil
                                repeats:NO];
    [time fire];
    
    return YES;
}
-(void)send:(id)sender
{
    LoginInAPI *api=[[LoginInAPI alloc]initWithUserName:@"验证码91485324用于QQ1******8更换密保手机,泄露有风险.防盗能力提升百倍 aq.qq.com/s -QQ安全中心[腾讯科技]" WithPassWord:@""];
    
    [api startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
        NSLog(@"%@",request.responseString);
        
    } failure:^(YTKBaseRequest *request) {
        
        NSLog(@"%@",request.responseString);
        
    }];
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
