//
//  MoreViewController.h
//  iNews
//
//  Created by 邹建敏 on 14-9-4.
//  Copyright (c) 2014年 test. All rights reserved.
//

#import "BaseViewController.h"
#import "BaseColor.h"

@interface MoreViewController : BaseViewController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain)UITableView *tableView;
@property (nonatomic, retain)UISegmentedControl *segment;

@end
