//
//  NewsViewController.h
//  iNews
//
//  Created by 赵东东 on 14-9-4.
//  Copyright (c) 2014年 test. All rights reserved.
//

#import "BaseViewController.h"
#import "DataBaseHandle.h"
#import <sqlite3.h>

@interface NewsViewController : BaseViewController<UIWebViewDelegate>

@property(nonatomic, retain)NSString *str;
@property (nonatomic, retain)UIAlertView *alert;
@property (nonatomic, retain)NSString *dataTitle;
@property (nonatomic, retain)NSString *dataId;

@end
