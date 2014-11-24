//
//  MainPushInViewController.h
//  iNews
//
//  Created by 顾鸿飞 on 14-9-15.
//  Copyright (c) 2014年 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainPushInViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain) UITableView *tableView;

@property (nonatomic, retain) NSString *str;

@property (nonatomic, retain) NSMutableArray *arr;

@end
