
//  BaseViewController.m
//  iNews
//
//  Created by 邹建敏 on 14-9-2.
//  Copyright (c) 2014年 test. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.center = [NSNotificationCenter defaultCenter];
        
        [self.center addObserver:self selector:@selector(changeSinkAction:) name:@"changeSink" object:nil];
        [self.center addObserver:self selector:@selector(changeColorAction:) name:@"changeColor" object:nil];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
}



- (void)changeSinkAction:(NSNotification *)notification
{
    if ([notification.object isEqualToString:@"YES"]) {
        
        [self.navigationController.navigationBar setBarTintColor:[UIColor blackColor]];
        self.tabBarController.tabBar.barTintColor = [UIColor blackColor];
        [self.view setBackgroundColor: [UIColor blackColor]];
    }
    
    else {
    
        BaseColor *manager = [BaseColor baseColor];
        self.view.backgroundColor =[UIColor whiteColor];
        [self.navigationController.navigationBar setBarTintColor: manager.baseColor];
        [self.tabBarController.tabBar setBarTintColor:manager.baseColor];
    }
}

- (void)changeColorAction:(NSNotification *)notification
{
    
    if ([notification.object isEqualToString:@"红"]) {
        [self.navigationController.navigationBar setBarTintColor:[UIColor redColor]];
        [self.tabBarController.tabBar setBarTintColor:[UIColor redColor]];
    }
    else if ([notification.object isEqualToString:@"青"]) {
        [self.navigationController.navigationBar setBarTintColor:[UIColor cyanColor]];
        [self.tabBarController.tabBar setBarTintColor:[UIColor cyanColor]];
    }
    else if ([notification.object isEqualToString:@"橙"]) {
        [self.navigationController.navigationBar setBarTintColor:[UIColor orangeColor]];
        [self.tabBarController.tabBar setBarTintColor:[UIColor orangeColor]];
    }
    else if ([notification.object isEqualToString:@"绿"]) {
        [self.navigationController.navigationBar setBarTintColor:[UIColor greenColor]];
        [self.tabBarController.tabBar setBarTintColor:[UIColor greenColor]];
    }
    
//   @"洋",  @"蓝", @"棕", @"粉", @"未知", @"未知",nil];

    
    else if ([notification.object isEqualToString:@"浅"]) {
        [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:143/255.0 green:189/255.0 blue:44/255.0 alpha:0.9]];
        [self.tabBarController.tabBar setBarTintColor:[UIColor colorWithRed:143/255.0 green:189/255.0 blue:44/255.0 alpha:0.9]];
    }
    
    else if ([notification.object isEqualToString:@"黄"]) {
        [self.navigationController.navigationBar setBarTintColor:[UIColor yellowColor]];
        [self.tabBarController.tabBar setBarTintColor:[UIColor yellowColor]];
    }
    else if ([notification.object isEqualToString:@"洋"]) {
        [self.navigationController.navigationBar setBarTintColor:[UIColor magentaColor]];
        [self.tabBarController.tabBar setBarTintColor:[UIColor magentaColor]];
    }
    else if ([notification.object isEqualToString:@"蓝"]) {
        [self.navigationController.navigationBar setBarTintColor:[UIColor blueColor]];
        [self.tabBarController.tabBar setBarTintColor:[UIColor blueColor]];
    }
    else if ([notification.object isEqualToString:@"棕"]) {
        [self.navigationController.navigationBar setBarTintColor:[UIColor brownColor]];
        [self.tabBarController.tabBar setBarTintColor:[UIColor brownColor]];
    }
    else if ([notification.object isEqualToString:@"紫"]) {
        [self.navigationController.navigationBar setBarTintColor:[UIColor purpleColor]];
        [self.tabBarController.tabBar setBarTintColor:[UIColor purpleColor]];
    }
    
    else if ([notification.object isEqualToString:@"草"]) {
        
        [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:49/255.0 green:133/255.0 blue:25/255.0 alpha:0.9]];
        [self.tabBarController.tabBar setBarTintColor:[UIColor colorWithRed:49/255.0 green:133/255.0 blue:25/255.0 alpha:0.9]];
    }
    else if ([notification.object isEqualToString:@"灰"]) {
        [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:97/255.0 green:101/255.0 blue:107/255.0 alpha:1]];
        [self.tabBarController.tabBar setBarTintColor:[UIColor colorWithRed:97/255.0 green:101/255.0 blue:107/255.0 alpha:1]];
    }
    
}

- (void)dealloc
{
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center removeObserver:self];
    
    [_center release];
    [super dealloc];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
