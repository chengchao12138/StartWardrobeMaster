//
//  GlobalConfig.m
//  StartWardrobe
//
//  Created by chengchao on 15/8/31.
//  Copyright (c) 2015年 chengchao. All rights reserved.
//

#import "GlobalConfig.h"
#import "Log.h"
#import "DLDBManager.h"
#import "AppDelegate.h"
@implementation GlobalConfig
+(instancetype)ShareGlobalConfig
{
    static GlobalConfig *config=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        config=[[self alloc]init];
    });
    
    return config;
}
-(void)initDBSetting
{
    //获取当前用户文件目录（如没有则创建）
    NSString *userPath = [ NSString   getUserPath];
    NSString *realPath = [userPath stringByAppendingPathComponent:DL_DB_NAME];
    DDLogInfo(@"%@",realPath);
    NSFileManager *fileManager = [NSFileManager defaultManager];
    //判断数据库是否存在
    if (![fileManager fileExistsAtPath:realPath])
    {
        DDLogInfo(@"%@",realPath);
        [DLDBManager createTables];
    }
}
-(void)initGlobalLogSettting
{
    [Log logOpen];
}
-(void)registerAPNS
{
    if (TARGET_IPHONE_SIMULATOR)
    {
        return;
    }
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
        [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings
                                                                             settingsForTypes:(UIUserNotificationTypeSound |
                                                                                               UIUserNotificationTypeAlert |
                                                                                               UIUserNotificationTypeBadge)
                                                                             categories:nil]];
        [[UIApplication sharedApplication] registerForRemoteNotifications];
    }
    else {
        [[UIApplication sharedApplication]registerForRemoteNotificationTypes:UIRemoteNotificationTypeAlert|
         UIRemoteNotificationTypeBadge|
         UIRemoteNotificationTypeSound];
    }

}
//取消推送
-(void)unregisterAPNS
{
#if !TARGET_IPHONE_SIMULATOR
    [[UIApplication sharedApplication] unregisterForRemoteNotifications];
#endif
}







@end
