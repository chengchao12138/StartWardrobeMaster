//
//  GlobalConfig.m
//  StartWardrobe
//
//  Created by chengchao on 15/8/31.
//  Copyright (c) 2015年 chengchao. All rights reserved.
//

#import "GlobalConfig.h"

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
    
    
}
-(void)initGlobalLogSettting
{
    
    
}

@end
