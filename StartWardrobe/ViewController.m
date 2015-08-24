//
//  ViewController.m
//  StartWardrobe
//
//  Created by chengchao on 15/8/22.
//  Copyright (c) 2015年 chengchao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UILabel *la=[[UILabel alloc]initWithFrame:self.view.frame];
    [self.view addSubview:la];
    NSString * str=NSLocalizedString(@"key", nil);
    la.text=str;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
