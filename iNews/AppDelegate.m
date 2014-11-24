//
//  AppDelegate.m
//  iNews
//
//  Created by 邹建敏 on 14-9-2.
//  Copyright (c) 2014年 test. All rights reserved.
//

#import "AppDelegate.h"
#import <ShareSDK/ShareSDK.h>
#import "WeiboApi.h"
#import <TencentOpenAPI/QQApiInterface.h>
#import <TencentOpenAPI/TencentOAuth.h>
#import "WXApi.h"
#import "WeiboSDK.h"
#import <Parse/Parse.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
 
    [ShareSDK registerApp:@"783b9ac2495"];
    
    [ShareSDK connectSinaWeiboWithAppKey:@"568898243"
                               appSecret:@"38a4f8204cc784f81f9f0daaf31e02e3"
                             redirectUri:@"http://www.sharesdk.cn"];
    
    [Parse setApplicationId:@"pSr2dNiZUqcgxrINsyrgJa3vwLcKyATkubNfZ0iX"
                  clientKey:@"aiK1CTRUKjDukAyyKXHJ7ScTfnsLw5IupC8bg1vu"];
    
    
    //添加腾讯微博应用 注册网址 http://dev.t.qq.com
    [ShareSDK connectTencentWeiboWithAppKey:@"801307650"
                                  appSecret:@"ae36f4ee3946e1cbb98d6965b0b2ff5c"
                                redirectUri:@"http://www.sharesdk.cn"
                                   wbApiCls:[WeiboApi class]];
    
    //添加豆瓣应用  注册网址 http://developers.douban.com
    [ShareSDK connectDoubanWithAppKey:@"07d08fbfc1210e931771af3f43632bb9"
                            appSecret:@"e32896161e72be91"
                          redirectUri:@"http://dev.kumoway.com/braininference/infos.php"];
    
    
    //    //添加印象笔记应用   注册网址  http://dev.yinxiang.com
        [ShareSDK connectEvernoteWithType:SSEverNoteTypeSandbox
                              consumerKey:@"sharesdk-7807"
                           consumerSecret:@"d05bf86993836004"];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
   
    

    MainViewController *mainVC = [[MainViewController alloc]init];
    mainVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"订阅" image:[UIImage imageNamed:@"4.png"] tag:1];
    UINavigationController *naVC1 = [[UINavigationController alloc]initWithRootViewController:mainVC];
    [mainVC release];
    
    SecViewController *secVC = [[SecViewController alloc]init];
    secVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"推荐" image:[UIImage imageNamed:@"3.png"] tag:2];
    UINavigationController *naVC2 = [[UINavigationController alloc]initWithRootViewController:secVC];
    [secVC release];
    
    ThirdViewController *thiVC = [[ThirdViewController alloc]init];
    thiVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"发现" image:[UIImage imageNamed:@"2.png"] tag:3];
    UINavigationController *naVC3 = [[UINavigationController alloc]initWithRootViewController:thiVC];
    [thiVC release];
    
    FourViewController *fourVC = [[FourViewController alloc]init];
    fourVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"我的" image:[UIImage imageNamed:@"1.png"] tag:4];
    UINavigationController *naVC4 = [[UINavigationController alloc]initWithRootViewController:fourVC];
    [fourVC release];
    
    
    UITabBarController *tabBarController = [[UITabBarController alloc]init];
       // 改变tabBar的填充色
    tabBarController.tabBar.tintColor = [UIColor redColor];
     // 改变bar的背景颜色
    tabBarController.tabBar.barTintColor = [UIColor whiteColor];
    
    tabBarController.viewControllers = [NSArray arrayWithObjects:naVC1, naVC2, naVC3, naVC4, nil];

    self.window.rootViewController = tabBarController;
    
    [naVC1 release];
    [naVC2 release];
    [naVC3 release];
    [naVC4 release];
    [tabBarController release];
    
    

// 下拉图片？？？
    UIImageView *ig = [[UIImageView alloc]initWithFrame:self.window.bounds];
    ig.image = [UIImage imageNamed:@"show.jpg"];
    
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(0, self.window.frame.size.height - 10, 10, 10)];
    lab.numberOfLines = 2;
    lab.font = [UIFont boldSystemFontOfSize:25];
    lab.textColor = [UIColor magentaColor];
    
    [ig addSubview:lab];
    [self.window addSubview:ig];
    
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        lab.frame = CGRectMake(self.window.frame.size.width, 0,  10, 10);
    } completion:^(BOOL finished) {
        ig.frame = CGRectMake(160, 240, 0, 0);
    }];
    
    [lab release];
    [ig release];
    
    
    [_window release];
    return YES;
}

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - WX回调

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url{
    
    return [ShareSDK handleOpenURL:url wxDelegate:nil];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    
    return [ShareSDK handleOpenURL:url sourceApplication:sourceApplication annotation:annotation wxDelegate:nil];
    
}

#pragma mark - WXApiDelegate

/*! @brief 收到一个来自微信的请求，第三方应用程序处理完后调用sendResp向微信发送结果
 *
 * 收到一个来自微信的请求，异步处理完成后必须调用sendResp发送处理结果给微信。
 * 可能收到的请求有GetMessageFromWXReq、ShowMessageFromWXReq等。
 * @param req 具体请求内容，是自动释放的
 */


-(void) onReq:(BaseReq*)req{
    
}

/*! @brief 发送一个sendReq后，收到微信的回应
 *
 * 收到一个来自微信的处理结果。调用一次sendReq后会收到onResp。
 * 可能收到的处理结果有SendMessageToWXResp、SendAuthResp等。
 * @param resp具体的回应内容，是自动释放的
 */

-(void) onResp:(BaseResp*)resp{
    
}




@end
