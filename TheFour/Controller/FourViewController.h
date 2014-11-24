//
//  FourViewController.h
//  iNews
//
//  Created by 邹建敏 on 14-9-2.
//  Copyright (c) 2014年 test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "MoreViewController.h"
#import <Parse/Parse.h>
#import  <ShareSDK/ShareSDK.h>//分享
#import "MainViewController.h"
#import "DataViewController.h"
#import "AboutViewController.h"
//  抽屉效果
#import "DXSemiViewControllerCategory.h"
#import "RightViewController.h"

#import "SDImageCache.h"



@interface FourViewController : BaseViewController

@property (nonatomic, retain)UIImageView *imageView;
@property (nonatomic, retain)UILabel *label;


@property (nonatomic, retain)NSString *user;
@property (nonatomic, retain)UIImage *ima;

@end
