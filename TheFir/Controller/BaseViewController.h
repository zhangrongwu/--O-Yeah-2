//
//  BaseViewController.h
//  iNews
//
//  Created by 邹建敏 on 14-9-2.
//  Copyright (c) 2014年 test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseColor.h"

@interface BaseViewController : UIViewController

@property(nonatomic, retain)NSNotificationCenter *center;
@property(nonatomic, retain)UILabel *labelAll;

- (void)changeSinkAction:(NSNotification *)notification;

- (void)changeColorAction:(NSNotification *)notification;

@end
