//
//  CCBaseNavigationController.m
//  StartWardrobe
//
//  Created by chengchao on 15/8/24.
//  Copyright (c) 2015年 chengchao. All rights reserved.
//

#import "CCBaseNavigationController.h"

@interface CCBaseNavigationController ()

@end

@implementation CCBaseNavigationController

#pragma mark -- left Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [super pushViewController:viewController animated:YES];
    if (self.viewControllers.count) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
}
#pragma mark - View rotation

- (BOOL)shouldAutorotate {
    return NO;
}

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationPortrait;
}
/*Portrait
 #pragma mark #pragma mark - View rotation
 
 - (BOOL)shouldAutorotate {
 return NO;
 }
 
 - (NSUInteger)supportedInterfaceOrientations {
 return UIInterfaceOrientationMaskPortrait;
 }
 
 - (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
 return UIInterfaceOrientationPortrait;
 }- Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
