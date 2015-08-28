//
//  HUDTools.h
//  StartWardrobe
//
//  Created by chengchao on 15/8/27.
//  Copyright (c) 2015年 chengchao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HUDTools : NSObject

+(instancetype)ShareInstance;


+(void) ShowLoadingHUD;


+(void)ShowLoadingHUDWithText:(NSString*)text;

@end
