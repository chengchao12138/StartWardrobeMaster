//
//  NDLog.h
//  IOS-IM
//
//  Created by chenhui on 13-9-9.
//  Copyright (c) 2013年 chenhui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DDLog.h"
#import "DDFileLogger.h"
#import "DDTTYLogger.h"
#import "CocoaLumberjack.h"
#import "DDLegacyMacros.h"

//#define

/**
 *	文件log控制开发，Documents目录下有此文件名时候，会输出文件Log，否则的话无文件log
 */
#define LOG_INDICATOR_FILE_NAME   @"Log"

/******************************
 * 默认LOG等级，由开发者调试时候设置
 *******************************/

@interface Log : NSObject

+ (void)logOpen;

@end
