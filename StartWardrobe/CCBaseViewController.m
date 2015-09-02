//
//  CCBaseViewController.m
//  StartWardrobe
//
//  Created by chengchao on 15/8/24.
//  Copyright (c) 2015年 chengchao. All rights reserved.
//

#import "CCBaseViewController.h"
#import "LCProgressHUD.h"
@interface CCBaseViewController ()
    
@property (nonatomic, copy) CCBarButtonItemActionBlock barbuttonItemAction;

@end

@implementation CCBaseViewController
#pragma mark -- left Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    self.navigationController.navigationBar.barTintColor=[UIColor colorWithRed:30/255.0 green:144/255.0 blue:255/250.0 alpha:0.5];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setbackGroundImage:(UIImage*)backgroundImage{
    
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    backgroundImageView.image = backgroundImage;
    [self.view insertSubview:backgroundImageView atIndex:0];
}

- (void)pushNewViewController:(UIViewController *)newViewController {
    
    [self.navigationController pushViewController:newViewController animated:YES];
}

#pragma mark - Loading

- (void)showLoading {
    [self showLoadingWithText:nil];
}

- (void)showLoadingWithText:(NSString *)text {
    [self showLoadingWithText:text onView:self.view];
}

- (void)showLoadingWithText:(NSString *)text onView:(UIView *)view {
   
    NSArray *array =  [NSArray arrayWithObjects:
                       [UIImage imageNamed:@"icon_hud_1.png"],
                       [UIImage imageNamed:@"icon_hud_2.png"],
                       [UIImage imageNamed:@"icon_hud_3.png"],
                       [UIImage imageNamed:@"icon_hud_4.png"],
                       [UIImage imageNamed:@"icon_hud_5.png"],
                       [UIImage imageNamed:@"icon_hud_6.png"],
                       [UIImage imageNamed:@"icon_hud_7.png"],
                       [UIImage imageNamed:@"icon_hud_8.png"],
                       [UIImage imageNamed:@"icon_hud_9.png"],
                       nil];
    UIImageView *image=[[UIImageView alloc]init];
    image.center=self.view.center;
    image.bounds=CGRectMake(0, 0, 100, 65);
    [image setAnimationImages:array];
    [image setAnimationDuration:0.5];
    [image setAnimationRepeatCount:0];
    [image startAnimating];
    
    MBProgressHUD * hud=    [[MBProgressHUD alloc]initWithView:self.view];
    hud.mode=MBProgressHUDModeCustomView;
    hud.color=[UIColor whiteColor];
    hud.customView=image;
    hud.labelText=@"加载中";
    hud.labelFont=[UIFont fontWithName:@"Helvetica" size:12];
    hud.labelColor=RGBACOLOR(25, 225, 25, 1);
    [self.view addSubview:hud];
    [hud show:YES];
}

- (void)showSuccess {
     [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
}
- (void)showError {
    
    NSArray * arr= [MBProgressHUD  allHUDsForView:self.view];
    for ( MBProgressHUD *HUD in arr ) {
        if ([HUD respondsToSelector:@selector(removeFromSuperview)]) {
            [HUD removeFromSuperview];
        }
    }
}

- (void)hideLoading {
    
    NSArray * arr= [MBProgressHUD  allHUDsForView:self.view];
    for ( MBProgressHUD *HUD in arr ) {
        if ([HUD respondsToSelector:@selector(removeFromSuperview)]) {
            [HUD removeFromSuperview];
        }
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

- (void)configureBarbuttonItemStyle:(CCBarbuttonItemStyle)style action:

                                                (CCBarButtonItemActionBlock)action
{
    switch (style) {
        case CCBarbuttonItemStyleSetting:
        {
            
            break;
        }
        case CCBarbuttonItemStyleMore:
        {

            break;
        }
        case CCBarbuttonItemStyleCamera:
        {

            break;
        }
        default:
            break;
    }
    self.barbuttonItemAction = action;
}
- (void)clickedBarButtonItemAction {
    if (self.barbuttonItemAction) {
        self.barbuttonItemAction();
    }
}
#ifdef __IPHONE_7_0
- (UIRectEdge)edgesForExtendedLayout {
    return UIRectEdgeNone;
}
#endif
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
