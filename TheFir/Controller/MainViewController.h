//
//  MainViewController.h
//  iNews
//
//  Created by 邹建敏 on 14-9-2.
//  Copyright (c) 2014年 test. All rights reserved.
//

#import "BaseViewController.h"
#import <UIKit/UIKit.h>
#import "UIImageView+WebCache.h"
#import "MJRefresh.h"
#import "AFNetworking.h"
#import "Mycell.h"
#import "CityViewController.h"
#import "ShowViewController.h"
#import "fourPhoto.h"        //    首页四张图，封装成的一个类
#import "WeatherViewController.h"
#import "AutoScrollView.h"
#import "ThirdFourViewController.h"
#import "ThirdFiveViewController.h"
#import "UIColor+AddColor.h"
#import "SearchViewController.h"
#import "MainPushInViewController.h"



@interface MainViewController : BaseViewController

@property (nonatomic, retain)UIScrollView *scroll;
@property (nonatomic, retain)NSMutableArray *arrCity;

@end
