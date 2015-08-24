//
//  DBOperation.m
//  StartWardrobe
//
//  Created by chengchao on 15/6/26.
//  Copyright (c) 2015年 chengchao. All rights reserved.
//

#import "DBOperation.h"
#import "FMDB.h"
@implementation DBOperation
static FMDatabase *db   =   nil;

+(void)creatDatabase
{
    db = [FMDatabase databaseWithPath:[self databaseFilePath]];
}
+(void)creatTable
{
    //先判断数据库是否存在，如果不存在，创建数据库
    if (!db)
    {
    [self  creatDatabase];
        
    }
    	//判断数据库是否已经打开，如果没有打开，提示失败
    if (![db open])
    {
            
    NSLog(@"数据库打开失败");
    return;
    }
    	//为数据库设置缓存，提高查询效率
    [db  setShouldCacheStatements:YES];
    
    //判断数据库中是否已经存在这个表，如果不存在则创建该表
    if(![[NSFileManager defaultManager] fileExistsAtPath:[self databaseFilePath]])
    {
        [db executeUpdate:@"CREATE TABLE people(people_id INTEGER PRIMARYKEY AUTOINCREAMENT, name TEXT, age INTEGER)"];
        
        [db executeUpdate:@"CREATE TABLE Student(id INTEGER PRIMARYKEY AUTOINCREAMENT, student_name text)"];
        
    }
}
+(void)insertData:(int)fromIndex useTransaction:(BOOL)useTransaction
{
    
    FMDatabaseQueue *queue=[FMDatabaseQueue databaseQueueWithPath:[self databaseFilePath]];
    
    [queue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        
    }];
    
    [db open];
    if (useTransaction)
    {
        [db beginTransaction];
        BOOL isRollBack = NO;
        @try
        {
            for (int i = fromIndex; i<10+fromIndex; i++)
            {
                NSString *nId = [NSString stringWithFormat:@"%d",i];
                NSString *strName = [[NSString alloc] initWithFormat:@"student_%d",i];
                NSString *sql = @"INSERT INTO Student (id,student_name) VALUES (?,?)";
                BOOL a = [db executeUpdate:sql,nId,strName];
                if (!a)
                {
                   
                    
                    
                }
            }
        }
        @catch (NSException *exception)
        {
            isRollBack = YES;
            [db rollback];
        }
        @finally
        {
            if (!isRollBack)
            {
                [db commit];
            }
        }
    }else{
        for (int i = fromIndex; i<10+fromIndex; i++)
        {
            NSString *nId = [NSString stringWithFormat:@"%d",i];
            NSString *strName = [[NSString alloc] initWithFormat:@"student_%d",i];
            NSString *sql = @"INSERT INTO Student (id,student_name) VALUES (?,?)";
            BOOL a = [db executeUpdate:sql,nId,strName];
            if (!a)
            {
            
            }
        }
    }
    
    [db close];
    
}

+(void)queue
{
    
    FMDatabaseQueue *queue = [FMDatabaseQueue databaseQueueWithPath:[self databaseFilePath]];
    
    // 使用
    [queue inDatabase:^(FMDatabase *db) {
        [db executeUpdate:@"INSERT INTO myTable VALUES (?)", [NSNumber numberWithInt:1]];
        [db executeUpdate:@"INSERT INTO myTable VALUES (?)", [NSNumber numberWithInt:2]];
        [db executeUpdate:@"INSERT INTO myTable VALUES (?)", [NSNumber numberWithInt:3]];
        
        FMResultSet *rs = [db executeQuery:@"select * from foo"];
        while ([rs next]) {
            // …
        }
    }];
    
    // 如果要支持事务
    [queue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        [db executeUpdate:@"INSERT INTO myTable VALUES (?)", [NSNumber numberWithInt:1]];
        [db executeUpdate:@"INSERT INTO myTable VALUES (?)", [NSNumber numberWithInt:2]];
        [db executeUpdate:@"INSERT INTO myTable VALUES (?)", [NSNumber numberWithInt:3]];
        
        if (/* DISABLES CODE */ (1)) {
            *rollback = YES;
            return;
        }
        // etc…
        [db executeUpdate:@"INSERT INTO myTable VALUES (?)", [NSNumber numberWithInt:4]];
    }];
    
}


+(NSString *)databaseFilePath
{
    NSArray *filePath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                    NSUserDomainMask, YES);
    NSString *documentPath = [filePath objectAtIndex:0];
    NSLog(@"%@",filePath);
    NSString *dbFilePath = [documentPath stringByAppendingPathComponent:@"db.sqlite"];
    return dbFilePath;
}
@end
