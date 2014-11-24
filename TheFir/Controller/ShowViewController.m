//
//  ShowViewController.m
//  iNews
//
//  Created by 邹建敏 on 14-9-2.
//  Copyright (c) 2014年 test. All rights reserved.
//

#import "ShowViewController.h"

@interface ShowViewController ()

@property (nonatomic, retain)NSMutableDictionary *dic;

@end

@implementation ShowViewController

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
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:@"http://iphone.myzaker.com/zaker/cover.php?_appid=iphone&_bsize=640_1136&api_version=1.1" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
        
        self.dic = [responseObject objectForKey:@"data"];
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
        imageView.userInteractionEnabled = YES;
        [imageView addGestureRecognizer:tap];
        
        NSURL *url = [NSURL URLWithString:[_dic objectForKey:@"pic"]];
        [imageView setImageWithURL:url];
        
        [self.view addSubview:imageView];
        [imageView release];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
        
    }];
    
    
}



- (void)tap:(UIGestureRecognizer *)tap
{
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    
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
