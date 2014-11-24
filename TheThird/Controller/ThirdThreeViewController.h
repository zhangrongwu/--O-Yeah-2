//
//  ThirdThreeViewController.h
//  iNews
//
//  Created by 顾鸿飞 on 14-9-3.
//  Copyright (c) 2014年 test. All rights reserved.
//

#import "BaseViewController.h"

@interface ThirdThreeViewController : BaseViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain) NSMutableArray *arr;

@property (nonatomic, retain) UITableView *tableView;

@property (nonatomic, retain) NSString *str;

@end
