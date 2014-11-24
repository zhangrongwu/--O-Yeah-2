//
//  ThirdOneViewController.m
//  iNews
//
//  Created by 顾鸿飞 on 14-9-3.
//  Copyright (c) 2014年 test. All rights reserved.
//

#import "ThirdOneViewController.h"
#import "MyTableViewCell.h"
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"
#import "ThirdWeb.h"
#import "ThirdFourViewController.h"
#import "UIColor+AddColor.h"
@interface ThirdOneViewController ()

@end

@implementation ThirdOneViewController

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
    //    [_str release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:self.str parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *arr = [[responseObject objectForKey:@"data"] objectForKey:@"list"];
        
        for (NSDictionary *dic in arr) {
            
            ThirdWeb *aa = [[ThirdWeb alloc] initWithDic:dic];
            [self.arr addObject:aa];
            [aa release];
        }
        
        
        NSDictionary *dic = [[responseObject objectForKey:@"data"] objectForKey:@"head"];
        NSURL *url = [NSURL URLWithString:[dic objectForKey:@"img"]];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 280, 80)];
        imageView.backgroundColor = [UIColor blackColor];
        [imageView setImageWithURL:url];
        
        self.navigationItem.title = [dic objectForKey:@"title"];
        
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 49 - 63) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = imageView;
        [self.view addSubview:_tableView];
        
        [imageView release];
        [_tableView release];
        [_tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    }];
    
    
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _arr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *str = @"rer";
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (nil == cell) {
        cell = [[[MyTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:str]autorelease];
    }
    //    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    ThirdWeb *bb = [_arr objectAtIndex:indexPath.row];
    cell.myLabel.text = bb.title;
    cell.myLabel1.text = bb.stitle;
    NSURL *url = [NSURL URLWithString:bb.large_pic];
    [cell.myImageView setImageWithURL:url];
    cell.myImageView.backgroundColor = [UIColor colorFromHexCode:[[self.arr objectAtIndex:indexPath.row] block_color]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 69;
    
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ThirdFourViewController *asd = [[ThirdFourViewController alloc] init];
    ThirdWeb *bb = [_arr objectAtIndex:indexPath.row];
    asd.str = bb.api_url;
    asd.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:asd animated:YES completion:^{
        
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
