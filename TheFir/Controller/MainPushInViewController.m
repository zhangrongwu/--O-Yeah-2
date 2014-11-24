//
//  MainPushInViewController.m
//  iNews
//
//  Created by 顾鸿飞 on 14-9-15.
//  Copyright (c) 2014年 test. All rights reserved.
//

#import "MainPushInViewController.h"
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"
#import "recommendCell.h"
#import "oneCell.h"
#import "threeCell.h"
#import "ThirdFiveViewController.h"

@interface MainPushInViewController ()

@end

@implementation MainPushInViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.arr = [NSMutableArray array];
    }
    return self;
}
- (void)dealloc
{
    [_tableView release];
    [_arr release];
    [_str release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:self.str parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        self.arr = [[responseObject objectForKey:@"data"]objectForKey:@"articles"];
        
        NSString *strImage = [[[[responseObject objectForKey:@"data"]objectForKey:@"block_info"] objectForKey:@"diy"]objectForKey:@"bgimage_url"];
      
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60)];
        [self.view addSubview:imageView];
        NSURL *url = [NSURL URLWithString:strImage];
        [imageView setImageWithURL:url];
        
        
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height- 20 - 50) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorColor = [UIColor cyanColor];
        [self.view addSubview:_tableView];
        [_tableView release];
        
        _tableView.tableHeaderView = imageView;
        [_tableView release];
        [imageView release];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(0, self.view.frame.size.height-42, self.view.frame.size.width, 40);
        [button setTitle:@"返回上一页" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
        button.backgroundColor = [UIColor whiteColor];
        button.tintColor = [UIColor blueColor];
        [self.view addSubview:button];
        [_tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];
    
}

- (void)buttonClicked
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *ce = [[UITableViewCell alloc] init];
    
    NSArray *arr = [[_arr objectAtIndex:indexPath.row] objectForKey:@"media"];
    NSDictionary *dic = [_arr objectAtIndex:indexPath.row];
    if (arr.count == 0) {
        
        static NSString *str = @"reuse";
        recommendCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
        if (cell == nil) {
            cell = [[[recommendCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:str]autorelease];
        }
        cell.title.text = [dic objectForKey:@"title"];
        cell.from.text =  [dic objectForKey:@"auther_name"];
        return cell;
    } else if (arr.count == 1){
        static NSString *str = @"reuse1";
        oneCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
        if (cell == nil) {
            cell = [[[oneCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:str]autorelease];
        }
        cell.title.text = [dic objectForKey:@"title"];
        cell.from.text =  [dic objectForKey:@"auther_name"];
        NSString *str1 = [[[dic objectForKey:@"media"]firstObject]objectForKey:@"raw_url"];
        NSURL *url = [NSURL URLWithString:str1];
        [cell.image setImageWithURL:url];
        return cell;
    } else if (arr.count >= 3){
        static NSString *str = @"reuse2";
        threeCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
        if (cell == nil) {
            cell = [[[threeCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:str]autorelease];
        }
        cell.title.text = [dic objectForKey:@"title"];
        cell.from.text =  [dic objectForKey:@"auther_name"];
        NSString *str1 = [[[dic objectForKey:@"media"]firstObject]objectForKey:@"raw_url"];
        NSURL *url = [NSURL URLWithString:str1];
        [cell.image1 setImageWithURL:url];
        
        NSString *str2 = [[[dic objectForKey:@"media"]objectAtIndex:1]objectForKey:@"raw_url"];
        NSURL *url1 = [NSURL URLWithString:str2];
        [cell.image2 setImageWithURL:url1];
        
        NSString *str3 = [[[dic objectForKey:@"media"]objectAtIndex:2]objectForKey:@"raw_url"];
        NSURL *url2 = [NSURL URLWithString:str3];
        [cell.image3 setImageWithURL:url2];
        
        return cell;
    }
    
 
    
    return ce;
}
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
NSArray *arr = [[_arr objectAtIndex:indexPath.row] objectForKey:@"media"];
    if (arr.count == 0) {
        return 80;
    }
    else if (arr.count == 1){
        return 130;
    }
    else if(arr.count >= 3){
        return 170;
    }
    return 0;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ThirdFiveViewController *thirdFive = [[ThirdFiveViewController alloc] init];
    thirdFive.str = [[_arr objectAtIndex:indexPath.row] objectForKey:@"weburl"];
    
    thirdFive.dataTitle = [[_arr objectAtIndex:indexPath.row]objectForKey:@"title"];
    
    thirdFive.dataId =  [[_arr objectAtIndex:indexPath.row]objectForKey:@"pk"];
    
    thirdFive.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:thirdFive animated:YES completion:^{
        
    }];
}

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    return @"sdfsdfsd";
//}

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return 3;
//}

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
