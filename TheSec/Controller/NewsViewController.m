//
//  NewsViewController.m
//  iNews
//
//  Created by 赵东东 on 14-9-4.
//  Copyright (c) 2014年 test. All rights reserved.
//

#import "NewsViewController.h"
#import <ShareSDK/ShareSDK.h>
#import "SecViewController.h"

@interface NewsViewController ()
@property(nonatomic, retain)UIView *myView;
@property(nonatomic, retain)UILabel *backLabel;
@property(nonatomic, retain)UIButton *button3;
@property(nonatomic, retain)UIButton *button1;
@property(nonatomic, retain)UIButton *button2;
@property(nonatomic, retain)UIButton *button4;

@end

@implementation NewsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIWebView *webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, -66, self.view.frame.size.width, self.view.frame.size.height + 140)];
    
    
    for (id subview in webView.subviews){
        if ([[subview class] isSubclassOfClass:[UIScrollView class]]) {
            ((UIScrollView *)subview).bounces = NO;
        }
    }
    
    [self.view addSubview:webView];
    
    [webView release];
    NSURL *url = [[NSURL alloc]initWithString:_str];
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
    [webView loadRequest:request];
    [url release];
    [request release];
    
    self.button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _button1.frame = CGRectMake(0, self.view.frame.size.height - 40, self.view.frame.size.width/4, 40);
    _button1.backgroundColor = [UIColor whiteColor];
    [_button1 setTitle:@"返回" forState:0];
    [_button1 addTarget:self action:@selector(backTo:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button1];
    
    self.button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _button2.frame = CGRectMake(self.view.frame.size.width/4, self.view.frame.size.height - 40, self.view.frame.size.width/4, 40);
    [_button2 addTarget:self action:@selector(NSbutton2:) forControlEvents:UIControlEventTouchUpInside];
    _button2.backgroundColor = [UIColor whiteColor];
    [_button2 setTitle:@"分享" forState:0];
    [self.view addSubview:_button2];
    
    self.button3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _button3.frame = CGRectMake(self.view.frame.size.width/4*2, self.view.frame.size.height - 40, self.view.frame.size.width/4, 40);
    [_button3 addTarget:self action:@selector(NSbutton3:) forControlEvents:UIControlEventTouchUpInside];
    _button3.backgroundColor = [UIColor whiteColor];
    [_button3 setTitle:@"设置" forState:0];
    [self.view addSubview:_button3];
    
    self.button4 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _button4.frame = CGRectMake(self.view.frame.size.width/4*3, self.view.frame.size.height - 40, self.view.frame.size.width/4, 40);
    [_button4 addTarget:self action:@selector(collect:) forControlEvents:UIControlEventTouchUpInside];
    _button4.backgroundColor = [UIColor whiteColor];
    [_button4 setTitle:@"收藏" forState:0];
    [self.view addSubview:_button4];
    
    _button1.tintColor = [UIColor blueColor];
    _button2.tintColor = [UIColor blueColor];
    _button3.tintColor = [UIColor blueColor];
    _button4.tintColor = [UIColor blueColor];
    
    self.myView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 94 - 40 + 66, self.view.frame.size.width, 94)];
    _myView.backgroundColor = [UIColor whiteColor];
    _myView.hidden  = YES; //隐藏
    [webView addSubview:_myView];
    [_myView release];
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 160, 140 /3)];
    label1.text = @"  夜间模式";
    [_myView addSubview:label1];
    [label1 release];
    
    UISwitch *switchView = [[UISwitch alloc] initWithFrame:CGRectMake(240, 10, 0, 0)];
    [switchView addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
    [_myView addSubview:switchView];
    [switchView release];
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 140/3, 160, 140/3)];
    label2.text = @"  屏幕亮度";
    [_myView addSubview:label2];
    [label2 release];
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(100, 140/3, 200, 45)];
    [slider addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventValueChanged];
    slider.tintColor = [UIColor redColor];
    
    [_myView addSubview:slider];
    [slider release];
    
    
    self.backLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height + 66)];
    
    
    _backLabel.backgroundColor = [UIColor blackColor];
    _backLabel.hidden = YES;
    [webView addSubview:_backLabel];
    [_backLabel release];
    
    
}

- (void)dealloc
{
    [_str release];
    [_alert release];
    [super dealloc];
}

- (void)collect:(UIButton *)button{
    
    DataBaseHandle *han = [DataBaseHandle shareInstance];
    [han openDatabase];
    [han createTable];

    [han insertTab:_dataTitle idd:_dataId name:_str];
    
    if (han.result == 19) {
        self.alert = [[UIAlertView alloc]initWithTitle:@"已收藏成功" message:@"请勿重复收藏" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        
        [_alert show];
        [self.view addSubview:_alert];
        [_alert release];
    }
    
    else{
        self.alert = [[UIAlertView alloc]initWithTitle:@"收藏成功" message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];

        [_alert show];
        [self.view addSubview:_alert];
        [_alert release];
    }
}


- (void)backTo:(UIButton *)button{

    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}


-(void)NSbutton2:(NSInteger)number
{
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"ShareSDK"  ofType:@"jpg"];
    //构造分享内容
    id<ISSContent> publishContent = [ShareSDK content:self.str
                                       defaultContent:@"默认分享内容，没内容时显示"
                                                image:[ShareSDK imageWithPath:imagePath]
                                                title:@"ZAKER" url:@"http://www.sharesdk.cn"
                                          description:@"这是一条测试信息"
                                            mediaType:SSPublishContentMediaTypeNews];
    [ShareSDK showShareActionSheet:nil
                         shareList:nil
                           content:publishContent
                     statusBarTips:YES
                       authOptions:nil
                      shareOptions: nil
                            result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                if (state == SSResponseStateSuccess)
                                {
//                                    NSLog(@"分享成功");
                                }
                                else if (state == SSResponseStateFail)
                                {
//                                    NSLog(@"分享失败,错误码:%d,错误描述:%@", [error errorCode], [error errorDescription]);
                                }
                            }];
    
}
-(void)NSbutton3:(UIButton *)but
{
    
    if (self.myView.hidden == YES) {
        self.myView.hidden = NO;
        self.backLabel.alpha = 0.5;
    }
    else
    {
        self.myView.hidden = YES;
    }
}

-(void)switchAction:(UISwitch *)swi
{
    
    if (swi.on == YES) {
        self.backLabel.hidden = NO;
        _button1.backgroundColor = [UIColor grayColor];
        _button2.backgroundColor = [UIColor grayColor];
        _button3.backgroundColor = [UIColor grayColor];
        _button4.backgroundColor = [UIColor grayColor];
        _button1.tintColor = [UIColor whiteColor];
        _button2.tintColor = [UIColor whiteColor];
        _button3.tintColor = [UIColor whiteColor];
        _button4.tintColor = [UIColor whiteColor];
    }
    else
    {
        self.backLabel.hidden = YES;
        _button1.backgroundColor = [UIColor whiteColor];
        _button2.backgroundColor = [UIColor whiteColor];
        _button3.backgroundColor = [UIColor whiteColor];
        _button4.backgroundColor = [UIColor whiteColor];
        _button1.tintColor = [UIColor blueColor];
        _button2.tintColor = [UIColor blueColor];
        _button3.tintColor = [UIColor blueColor];
        _button4.tintColor = [UIColor blueColor];
    }
    
}

//slder 触发方法
-(void)sliderAction:(UISlider *)slder
{
    //调用系统方法 条件亮度
    [[UIScreen mainScreen]setBrightness:slder.value];
    
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
