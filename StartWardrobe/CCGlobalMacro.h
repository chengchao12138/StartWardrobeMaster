//
//  CCGlobalMacro.h
//  StartWardrobe
//
//  Created by chengchao on 15/8/24.
//  Copyright (c) 2015年 chengchao. All rights reserved.
//

#ifndef StartWardrobe_CCGlobalMacro_h
#define StartWardrobe_CCGlobalMacro_h


#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define DLog(...)
#endif



// block self
#define WEAKSELF typeof(self) __weak weakSelf = self;
#define STRONGSELF typeof(weakSelf) __strong strongSelf = weakSelf;

// device verson float value
#define CURRENT_SYS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

// Size
#define MDK_SCREEN_WIDTH  [[UIScreen mainScreen] bounds].size.width
#define MDK_SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

// iPad
#define kIsiPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define kIs_iPhone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define kIs_iPhone_6 (kIs_iPhone && MDK_SCREEN_HEIGHT == 667.0)
#define kIs_iPhone_6P (kIs_iPhone && MDK_SCREEN_HEIGHT == 736.0)


// image STRETCH
#define XH_STRETCH_IMAGE(image, edgeInsets) (CURRENT_SYS_VERSION < 6.0 ? [image stretchableImageWithLeftCapWidth:edgeInsets.left topCapHeight:edgeInsets.top] : [image resizableImageWithCapInsets:edgeInsets resizingMode:UIImageResizingModeStretch])


#endif
