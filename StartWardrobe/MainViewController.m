//
//  MainViewController.m
//  StartWardrobe
//
//  Created by chengchao on 15/8/24.
//  Copyright (c) 2015年 chengchao. All rights reserved.
//

#import "MainViewController.h"
#import "MBProgressHUD.h"

@implementation MainViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
}
-(void)viewWillAppear:(BOOL)animated{
    [self showLoading];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self  showSuccess];
    });
   
}
-(void)loadDataSource
{
     dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
         
         [self.dataSource addObject:@"s"];
     });
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * CellID= @"CELLID";
    
    UITableViewCell *cell=[tableView
                           dequeueReusableCellWithIdentifier:CellID];
    if (!cell) {
        cell=[[UITableViewCell  alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID];
    }
    cell.textLabel.text=@"s";
    return cell;
    
}
@end
