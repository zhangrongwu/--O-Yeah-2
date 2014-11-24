//
//  PushInViewController.m
//  iNews
//
//  Created by 赵东东 on 14-9-11.
//  Copyright (c) 2014年 test. All rights reserved.
//

#import "PushInViewController.h"

@interface PushInViewController ()<UIWebViewDelegate>

@end

@implementation PushInViewController

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
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, -66, 320, 480+66)];
    for (id subview in webView.subviews){
        if ([[subview class] isSubclassOfClass:[UIScrollView class]]) {
            ((UIScrollView *)subview).bounces = NO;
        }
    }
    
    webView.delegate = self;
    NSURL *url = [[NSURL alloc] initWithString:_str];
    NSURLRequest * request = [[NSURLRequest alloc] initWithURL:url];
    [webView loadRequest:request];
    [self.view addSubview:webView];
    [webView release];
    [url release];
    [request release];
}

- (void)dealloc
{
    [_str release];
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
