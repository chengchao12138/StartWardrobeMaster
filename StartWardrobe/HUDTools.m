//
//  HUDTools.m
//  StartWardrobe
//
//  Created by chengchao on 15/8/27.
//  Copyright (c) 2015年 chengchao. All rights reserved.
//

#import "HUDTools.h"

@implementation HUDTools
#pragma mark - lefe cycle
+(instancetype)ShareInstance{
    
    static HUDTools *tools=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tools =[[HUDTools    alloc] init];
    });
    
    return tools;
}
-(id)init{
    if(self= [super init])
    return self;
    return nil;
}
+(void)ShowLoadingHUD{
    
    
    
    
    
    
}



@end
