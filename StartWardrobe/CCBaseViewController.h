//
//  CCBaseViewController.h
//  StartWardrobe
//
//  Created by chengchao on 15/8/24.
//  Copyright (c) 2015年 chengchao. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^CCBarButtonItemActionBlock)(void);

typedef NS_ENUM(NSInteger, CCBarbuttonItemStyle) {
    CCBarbuttonItemStyleSetting = 0,
    CCBarbuttonItemStyleMore,
    CCBarbuttonItemStyleCamera,
};
@interface CCBaseViewController : UIViewController

/**
 *  统一设置背景图片
 *
 *  @param backgroundImage 目标背景图片
 */
-(void)setbackGroundImage:(UIImage*)backgroundImage;


/**
 *  push新的控制器到导航控制器
 *
 *  @param newViewController 目标新的控制器对象
 */
- (void)pushNewViewController:(UIViewController *)newViewController;

/**
 *  显示加载的loading，没有文字的
 */
- (void)showLoading;


/**
 *  显示带有某个文本加载的loading
 *
 *  @param text 目标文本
 */
- (void)showLoadingWithText:(NSString *)text;

- (void)showLoadingWithText:(NSString *)text onView:(UIView *)view;

/**
 *  显示成功的HUD
 */
- (void)showSuccess;

/**
 *  显示错误的HUD
 */
- (void)showError;


/**
 *  隐藏在该View上的所有HUD，不管有哪些，都会全部被隐藏
 */
- (void)hideLoading;

/**
 *  配置导航栏按钮
 */
- (void)configureBarbuttonItemStyle:(CCBarbuttonItemStyle)style action:
                                                (CCBarButtonItemActionBlock)action;


@end
