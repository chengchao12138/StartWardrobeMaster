//
//  NSString+Tools.m
//  StartWardrobe
//
//  Created by chengchao on 15/8/31.
//  Copyright (c) 2015年 chengchao. All rights reserved.
//

#import "NSString+Tools.h"

@implementation NSString (Tools)
+(NSString *) getUserPath;
{
    //初始化documents目录
    NSString *documentPath = PATH_OF_DOCUMENT;
    //设置用户保存的文件夹
    /*
     *
     * 应该是用户的唯一id
     *
     */
    NSString *userPath = [documentPath stringByAppendingPathComponent:@"USER_ID"];
    //创建文件管理器
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    BOOL isFolder = NO;
    
    if ([fileManager fileExistsAtPath:userPath isDirectory:&isFolder])
    {
        if (!isFolder)
        {
            [fileManager createDirectoryAtPath:userPath withIntermediateDirectories:YES attributes:nil error:NULL];
        }
    }
    else
    {
        [fileManager createDirectoryAtPath:userPath withIntermediateDirectories:YES attributes:nil error:NULL];
    }
    return userPath;
}
@end
