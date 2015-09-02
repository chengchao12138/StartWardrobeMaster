//
//  LoginInAPI.h
//  StartWardrobe
//
//  Created by chengchao on 15/9/1.
//  Copyright (c) 2015年 chengchao. All rights reserved.
//

#import "YTKRequest.h"

@interface LoginInAPI : YTKRequest
/**
 *
 *
 *  @param userName userName
 *  @param passWord passWord
 *
 *  @return
 */
-(id)initWithUserName:(NSString *)userName
                WithPassWord:(NSString*)passWord;
@end
