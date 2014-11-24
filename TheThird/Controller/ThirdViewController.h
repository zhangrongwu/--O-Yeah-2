//
//  ThirdViewController.h
//  iNews
//
//  Created by 邹建敏 on 14-9-3.
//  Copyright (c) 2014年 test. All rights reserved.
//

#import "BaseViewController.h"
#import "SonViewController.h"
#import "SouViewController.h"

@interface ThirdViewController : BaseViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain)UITableView *tableView;
@property (nonatomic, retain)UITableView *tableView1;

//   搜索出现的tableView
@property (nonatomic, retain)UITableView *searchTable;

@property (nonatomic, retain)UIScrollView *scrollView;

@property (nonatomic, retain)NSMutableArray *arr;

@property (nonatomic, retain)NSMutableArray *arr1;

@property (nonatomic, retain)NSMutableArray *arr2;

@property (nonatomic, retain)NSMutableDictionary *dic;

@property (nonatomic, retain)UIImageView *imageView;

@property (nonatomic, retain)UIImageView *imageView1;
@property (nonatomic, retain)UIImageView *imageView2;

@property (nonatomic, retain)NSString *str;

@property (nonatomic, retain)NSString *str1;


@end
