//
//  AboutViewController.m
//  iNews
//
//  Created by 邹建敏 on 14-9-15.
//  Copyright (c) 2014年 test. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

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
    
    self.title = @"关于我们";
    
    NSMutableArray *arr = [NSMutableArray arrayWithObjects:[UIImage imageNamed:@"zou.png"], [UIImage imageNamed:@"dong.png"], [UIImage imageNamed:@"fei.png"], nil];
    
    UITextView *textView  = [[UITextView alloc]initWithFrame:CGRectMake(0, 10, self.view.frame.size.width   , self.view.frame.size.height - 50)];
    
    textView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bei.jpg"]];
    
    textView.editable = NO;
    textView.text = @"        O Yeah，为你带来最好的资讯  \n\n    O Yeah 将资讯、报纸、杂志、图片、微博等众多内容，按照用户的需求聚合在一起，实现深度个性定制     \n\n    它拥有强大的互动分享功能，方便有价值资讯的快速传播  \n\n    联系我们：    \n\n        电话：13624251562    \n        QQ：  1209019261    \n        QQ：  1127945424   \n        QQ：  545043111    \n\n        邮箱：zjmhk95@163.com    \n\n      开发人员：    阿邹       东东       大飞";
    textView.font = [UIFont boldSystemFontOfSize:15];
    
    [self.view addSubview:textView];
    
    for (int i = 0; i < arr.count; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[arr objectAtIndex:i]];

        imageView.frame = CGRectMake(20 + 100 * i, self.view.frame.size.height - 210, 80, 80);
        
        //  图片变圆形
        [imageView setClipsToBounds:YES];
        [imageView.layer setCornerRadius:imageView.frame.size.width/2.0];
        [textView addSubview:imageView];
        [imageView release];
        
        
    }
    [textView release];

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
