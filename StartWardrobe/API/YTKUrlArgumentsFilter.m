//
//  YTKUrlArgumentsFilter.m
//  StartWardrobe
//
//  Created by chengchao on 15/9/1.
//  Copyright (c) 2015年 chengchao. All rights reserved.
//

#import "YTKUrlArgumentsFilter.h"
#import "YTKNetworkPrivate.h"
@implementation YTKUrlArgumentsFilter
{
    
     NSDictionary *_arguments;
}
+ (YTKUrlArgumentsFilter *)filterWithArguments:(NSDictionary *)arguments {
    return [[self alloc] initWithArguments:arguments];
}
- (id)initWithArguments:(NSDictionary *)arguments {
    self = [super init];
    if (self) {
        _arguments = arguments;
    }
    return self;
}
-(NSString *)filterUrl:(NSString *)originUrl withRequest:(YTKBaseRequest *)request {
    return [YTKNetworkPrivate urlStringWithOriginUrlString:originUrl appendParameters:_arguments];
}
@end
