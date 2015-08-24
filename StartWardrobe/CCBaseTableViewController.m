//
//  CCBaseTableViewController.m
//  StartWardrobe
//
//  Created by chengchao on 15/8/24.
//  Copyright (c) 2015年 chengchao. All rights reserved.
//

#import "CCBaseTableViewController.h"

@interface CCBaseTableViewController ()

@end

@implementation CCBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)dealloc {
    self.dataSource = nil;
    self.tableView.delegate = nil;
    self.tableView.dataSource = nil;
    self.tableView = nil;
}
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView=[[UITableView  alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
        _tableView.backgroundColor=[UIColor whiteColor];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.tableFooterView=[[UIView alloc]initWithFrame:CGRectZero];
    }
    return _tableView;
}
-(NSMutableArray*)dataSource{
    if (!_dataSource) {
        _dataSource =[[NSMutableArray alloc]initWithCapacity:0];
    }
    return _dataSource;
}
- (void)loadDataSource{
    // for SubClass
}

#pragma mark -- UITableView DataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  self.dataSource.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return nil;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
#pragma mark - TableView Helper Method
/**
 *  iOS7 tableview separatorInset cell分割线左对齐
 *  是在iOS7之前是没有这个设置，所以要加下判断。以免程序在iOS7之前的环境下运行崩溃。
 *
 */
-(BOOL)validateSeparatorInset {
    if ([_tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        return YES;
    }
    return NO;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
