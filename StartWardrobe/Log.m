//
//  NDLog.m
//  IOS-IM
//
//  Created by chenhui on 13-9-9.
//  Copyright (c) 2013年 chenhui. All rights reserved.
//

// DDLog的简单调用控制
#import "Log.h"
#import <Foundation/Foundation.h>

@implementation Log

+ (void)logOpen
{
#ifdef CONSOLE_LOG_ON
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    
    [self openFileLog];
#endif
}

+ (void)openFileLog
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *docDir = [paths objectAtIndex:0];
    NSString *FileLogIndicator = [docDir stringByAppendingPathComponent:LOG_INDICATOR_FILE_NAME];
    DDLogFileManagerDefault *defaultFileManager = [[DDLogFileManagerDefault alloc] initWithLogsDirectory:FileLogIndicator];
    DDFileLogger *fileLogger = [[DDFileLogger alloc] initWithLogFileManager:defaultFileManager];
    fileLogger.rollingFrequency = 60 * 60 * 24; //记录一周
    fileLogger.logFileManager.maximumNumberOfLogFiles = 7;
    
    [DDLog addLogger:fileLogger];
}

@end
