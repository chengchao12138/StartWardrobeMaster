//
//  DLDBManager.h
//  DLAppStore
//
//  Created by ZhangGang on 14-2-12.
//  Copyright (c) 2014年 Archermind. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabaseQueue.h"
#import "FMDatabase.h"

//起始版本号:2
#define ORIGIN_SQLITE_VERSION @"2"

//最新版本号
#define MY_SQLITE_VERSION @"2"

//最近的需要强制进行数据库刷库(刷新用户数据)操作的版本，如果有新的刷库版本，更新此版本号
#define LATEST_REPLACEDATA_SQLITE_VERSION 1

/**
 *
 *Table Macros
 *
 **/
//项目数据库名称
#define DL_DB_NAME        @"IMDB.sqlite"

#define T_DB_VERSION      @"T_DB_VERSION"

@interface DLDBManager : NSObject
+ (FMDatabaseQueue *)getDBQueue;
//重新初始化数据库
+(void)reInitDBQueue;
+ (void)closeDB;
/**
 *  初始化数据库建表操作
 */
+ (void)createTables;
//更新数据库表字段
+ (void)updateDBTable:(NSString*)sqlVersion andOldVersion:(NSString*)oldVersion;

@end
