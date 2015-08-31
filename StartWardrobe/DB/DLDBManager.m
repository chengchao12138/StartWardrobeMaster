//
//  DLDBManager.m
//  DLAppStore
//
//  Created by ZhangGang on 14-2-12.
//  Copyright (c) 2014年 Archermind. All rights reserved.
//

#import "DLDBManager.h"
#import "DDLog.h"

/**
 *
 *建表Sql
 *
 **/

#define CREATE_VERSION_TABLE          @"CREATE TABLE IF NOT EXISTS %@(VersionID integer primary key,VersionValue text)"
//更新表,添加字段语句
#define ADD_CHAT_MAPADDR    @"ALTER TABLE %@ ADD mapAddr text"

//////////////////////////////////////////////////////////////////////////
static FMDatabaseQueue *dbQueue;

@implementation DLDBManager

+(FMDatabaseQueue *)getDBQueue
{
    if (dbQueue)
    {
        return dbQueue;
    }
    @synchronized(self)
    {
        NSString * realPath = [[NSString  getUserPath] stringByAppendingPathComponent:DL_DB_NAME];
        dbQueue = [FMDatabaseQueue databaseQueueWithPath:realPath];
    }
    return dbQueue;
}

+(void)reInitDBQueue
{
    @synchronized(self)
    {
        NSString * realPath = [[NSString  getUserPath] stringByAppendingPathComponent:DL_DB_NAME];
        dbQueue = [FMDatabaseQueue databaseQueueWithPath:realPath];
    }
}

+ (void)closeDB
{
    [dbQueue close];
}

+ (void)createTables
{
    // To create your table
    [self createTable:CREATE_VERSION_TABLE withTableName:T_DB_VERSION];

    //新增的数据库表或者字段
    [self updateDBTable:MY_SQLITE_VERSION andOldVersion:ORIGIN_SQLITE_VERSION];
}
+ (void)createTable:(NSString*)sql withTableName:(NSString *)tableName
{
    NSString * realPath = [[NSString getUserPath] stringByAppendingPathComponent:DL_DB_NAME];
    FMDatabase * db = [FMDatabase databaseWithPath:realPath];
    if ([db open])
    {
        NSString *sSQL = [NSString stringWithFormat:sql,tableName];
        
      DDLogInfo(@"createTable SQL is:%@",sSQL);
        BOOL res = [db executeUpdate:sSQL];
        if (!res)
        {
//            DDLogError(@"createTable SQL is:%@",sql);
        }
        else
        {
//            DDLogInfo(@"succ to creating db table");
        }
        [db close];
    }
    else
    {
//        DDLogError(@"error when open db");
    }
}

//更新数据库表字段
+(void)alterTableData:(NSString*)sql withTableName:(NSString *)tableName
{
    FMDatabaseQueue *dataQueue = [DLDBManager getDBQueue];
    __block BOOL result = NO;
    
    [dataQueue inDatabase:^(FMDatabase *db)
     {
         NSString *sSQL = [NSString stringWithFormat:sql,tableName];
//      NSString *sql = [NSString stringWithFormat:@"ALTER TABLE %@ ADD  lastVersionName text",T_DB_APPS];
         
         result = [db executeUpdate:sSQL];
         
         if(result)
         {
//             DDLogError(@"ALTER Success");
         }
         else
         {
//             DDLogError(@"ALTER Failed");
         }
     }];
}

+(void)setDBVersion:(NSString *)versionString
{
    FMDatabaseQueue *dataQueue = [DLDBManager getDBQueue];
    __block BOOL result = NO;
    
    [dataQueue inDatabase:^(FMDatabase *db)
     {
         NSString *sql = [NSString stringWithFormat:@"INSERT INTO %@ (VersionValue) VALUES ('%@')",T_DB_VERSION,versionString];
         
         result = [db executeUpdate:sql];
         
         if(result)
         {
//             DDLogError(@"setDBVersion is Success");
         }
         else
         {
//             DDLogError(@"setDBVersion is Failed");
         }
     }];
}

//根据数据库版本号更新数据库
+ (void)updateDBTable:(NSString*)sqlVersion andOldVersion:(NSString*)oldVersion
{
    NSUInteger versionNum = [sqlVersion integerValue];
    NSUInteger oldVersionNum = [oldVersion integerValue];
    //    for (NSUInteger i = versionNum; i > oldVersionNum; i--) {
    for (NSUInteger i = oldVersionNum + 1; i < versionNum + 1; i++) {
        switch (i)
        {
            case 3:
            {
    
                
            }
                break;
                
            default:
                break;
        }
    }
    //设置数据库版本号
    [self setDBVersion:MY_SQLITE_VERSION];
}

//删除表数据
+(void)deleteDataFromTable:(NSString*)sql withTableName:(NSString *)tableName
{
    FMDatabaseQueue *dataQueue = [DLDBManager getDBQueue];
    __block BOOL result = NO;
    
    [dataQueue inDatabase:^(FMDatabase *db)
     {
         NSString *sSQL = [NSString stringWithFormat:sql,tableName];
         //         NSString *sql = [NSString stringWithFormat:@"ALTER TABLE %@ ADD lastVersionName text",T_DB_APPS];
         
         result = [db executeUpdate:sSQL];
         
         if(result)
         {
//             DDLogError(@"ALTER Success");
         }
         else
         {
//             DDLogError(@"ALTER Failed");
         }
     }];
}

@end