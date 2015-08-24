//
//  NDLog.m
//  IOS-IM
//
//  Created by chengchao on 15/8/24.
//  Copyright (c) 2015年 chengchao. All rights reserved.
//


// DDLog的简单调用控制
#import "Log.h"
#import <Foundation/Foundation.h>
#import "Header.h"

@implementation Log

+ (Log *)logOpen
{
    static Log *shareLogInstance = nil;
    
    static dispatch_once_t doInit;
    dispatch_once(&doInit, ^{
        shareLogInstance = [[self alloc] init];
    });
    
    return shareLogInstance;
}


- (id)init
{
    if(self = [super init])
    {
        #ifdef CONSOLE_LOG_ON
            [DDLog addLogger:[DDTTYLogger sharedInstance]];
            [[DDTTYLogger sharedInstance] setColorsEnabled:YES];
        #endif

        if([self isFileLogIndicatorExist])
        {
            DDFileLogger *fileLogger = [[DDFileLogger alloc] init];
            fileLogger.rollingFrequency = 60 * 60 * 24;  //记录2个小时的log
            fileLogger.logFileManager.maximumNumberOfLogFiles = 1;//1
            [DDLog addLogger:fileLogger];
        }
    }
    return self;
}


- (BOOL)isFileLogIndicatorExist
{

#ifdef CONSOLE_LOG_ON
    return TRUE;
#else
    return FALSE;
#endif
    return YES;
    return true;
}
- (void)dealloc
{
}

@end
