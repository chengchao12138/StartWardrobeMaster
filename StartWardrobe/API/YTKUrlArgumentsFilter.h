//
//  YTKUrlArgumentsFilter.h
//  StartWardrobe
//
//  Created by chengchao on 15/9/1.
//  Copyright (c) 2015年 chengchao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YTKNetworkConfig.h"
@interface YTKUrlArgumentsFilter : NSObject<YTKUrlFilterProtocol>
+ (YTKUrlArgumentsFilter *)filterWithArguments:(NSDictionary *)arguments ;
-(NSString *)filterUrl:(NSString *)originUrl withRequest:(YTKBaseRequest *)request ;
@end
