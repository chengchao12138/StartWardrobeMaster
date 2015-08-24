//
//  CCBaseTableViewController.h
//  StartWardrobe
//
//  Created by chengchao on 15/8/24.
//  Copyright (c) 2015年 chengchao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCBaseViewController.h"
@interface CCBaseTableViewController : CCBaseViewController<UITableViewDataSource,UITableViewDelegate>
/**
 *  展示数据控件
 */
@property (nonatomic,retain) UITableView *tableView;


/**
 *   数据源
 */
@property (nonatomic,retain) NSMutableArray *dataSource;


/**
 *  加载本地或者网络数据源
 */
- (void)loadDataSource;

@end
