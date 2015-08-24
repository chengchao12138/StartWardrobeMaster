//
//  NDLog.h
//  IOS-IM
//
// Created by chengchao on 15/8/24.
// Copyright (c) 2015年 chengchao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DDLog.h"
#import "DDFileLogger.h"
#import "DDTTYLogger.h"

//#define

/**
 *	文件log控制开发，Documents目录下有此文件名时候，会输出文件Log，否则的话无文件log
 */
#define LOG_INDICATOR_FILE_NAME   @"IMFileLog.Open.Archermind"

/******************************
 * 默认LOG等级，由开发者调试时候设置
 *******************************/
static const int ddLogLevel = LOG_LEVEL_VERBOSE;

@interface Log : NSObject
@property(nonatomic,assign,getter=isDoing,readonly) BOOL  Doing;

+ (Log *)logOpen;

- (id)init;

- (void)dealloc;

@end
