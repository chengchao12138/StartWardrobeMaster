//
//  LoginInAPI.m
//  StartWardrobe
//
//  Created by chengchao on 15/9/1.
//  Copyright (c) 2015年 chengchao. All rights reserved.
//

#import "LoginInAPI.h"
#define  APPKEY    @"a83d4ed4e3985469222512484698a983"
#define  CITENAME   @"南京"
@interface LoginInAPI ()
{
    NSString *  _userName;
    NSString *  _passWord;
}
@end

@implementation LoginInAPI
-(id)initWithUserName:(NSString *)userName  WithPassWord:(NSString*)passWord
{
    self=[super init];
    if (self) {
        
        _userName   =   userName;
        _passWord   =   passWord;
    }
    return self;
}
- (NSTimeInterval)requestTimeoutInterval
{
    return 15;
}
- (YTKRequestMethod)requestMethod
{
    return YTKRequestMethodGet;
}
- (NSDictionary *)requestHeaderFieldValueDictionary
{
    return [NSDictionary dictionaryWithObjectsAndKeys:APPKEY,@"apikey", nil];
}
- (id)requestArgument
{
     return @{@"c": _userName,
              @"m": _passWord};
}
//JSON数据合法性检查city
- (id)jsonValidator {
    return @{
             @"nick": [NSString class],
             @"level": [NSNumber class]
             };
}
@end
