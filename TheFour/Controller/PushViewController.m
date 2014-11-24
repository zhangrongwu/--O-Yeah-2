//
//  PushViewController.m
//  iNews
//
//  Created by 邹建敏 on 14-9-3.
//  Copyright (c) 2014年 test. All rights reserved.
//

#import "PushViewController.h"
#import "pushCell.h"
#import "AFNetworking.h"
#import "push.h"
#import "PushInViewController.h"
#import "MainPushInViewController.h"
#import "ThirdFiveViewController.h"

@interface PushViewController () <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic ,retain)NSMutableArray *arr;
@property (nonatomic, retain)UITableView *tableView;
@property (nonatomic, retain)NSString *str;


@end

@implementation PushViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.arr = [NSMutableArray array];
        
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        [manager GET:@"http://iphone.myzaker.com/zaker/msg_hotspot.php?_appid=iphone&_dev=iPhone%2C7.1.2&_v=4.4.3&_version=4.5" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            //   加密
            manager.securityPolicy.allowInvalidCertificates = YES;
            
            NSArray *dicarr = [[responseObject objectForKey:@"data"] objectForKey:@"list"];
            
            for (int i = 0; i < dicarr.count; i++) {
                
                push *pp = [[push alloc] initWithDictionary:[dicarr objectAtIndex:i]];
                
                [self.arr addObject:pp];
                [pp release];
                //让tableView重新加载一遍数据
                [_tableView reloadData];
            }
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        }];
        
    }
    return self;
}
/*  集成刷新控件
 */
- (void)setupRefresh
{
    // 1.下拉刷新(进入刷新状态就会调用self的headerRereshing)
    [self.tableView addHeaderWithTarget:self action:@selector(headerRereshing)];
    
#pragma mark 自动刷新(一进入程序就下拉刷新)
    
    //[self.tableView headerBeginRefreshing];
    
    // 2.上拉加载更多(进入刷新状态就会调用self的footerRereshing)
    [self.tableView addFooterWithTarget:self action:@selector(footerRereshing)];
    
}

#pragma mark 开始进入刷新状态
- (void)headerRereshing
{
    
    // 2.2秒后刷新表格UI
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        
        //   刷新时  重新请求一次数据
        
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        [manager GET:@"http://iphone.myzaker.com/zaker/msg_hotspot.php?_appid=iphone&_dev=iPhone%2C7.1.1&_v=4.4.3&_version=4.5&nt=1&push_key=1410442696&size=10" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSArray *dicarr = [[responseObject objectForKey:@"data"] objectForKey:@"list"];
            
            for (int i = 0 ; i < dicarr.count; i++) {
                
                push *news = [[push alloc] initWithDictionary:[dicarr objectAtIndex:i]];
                
                
                
                [self.arr addObject:news];
                // [self.arr addObject:[dicarr objectAtIndex:arc4random() % (News.dic.count + 1)]];
                
                //      news release;
                
                [_tableView reloadData];
            }
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            //            NSLog(@"Error: %@", error);
        }];
        
        // 刷新表格
        [self.tableView reloadData];
        // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
        [self.tableView headerEndRefreshing];
    });
}


- (void)dealloc
{
    [_arr release];
    [_tableView release];
    [_str release];
    [super dealloc];
}

- (void)footerRereshing
{
    
    // 2.2秒后刷新表格UI
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        // 刷新表格
        [self.tableView reloadData];
        
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        [manager GET:@"http://iphone.myzaker.com/zaker/msg_hotspot.php?_appid=iphone&_dev=iPhone%2C7.1.1&_v=4.4.3&_version=4.5&nt=1&push_key=1410442696&size=10" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            NSArray *dicarr = [[responseObject objectForKey:@"data"] objectForKey:@"list"];
            
            for (int i = 0 ; i < dicarr.count; i++) {
                
                push *news = [[push alloc] initWithDictionary:[dicarr objectAtIndex:i]];
                
                [self.arr addObject:news];
                
                
                
                [news release];
                
                [_tableView reloadData];
            }
            
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            // NSLog(@"Error: %@", error);
        }];
        // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
        //        [self.tableView footerEndRefreshing];
    });
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    [self setupRefresh];
    
    self.title = @"推送资讯";
    [_tableView release];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _arr.count;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *str = @"1111";
    pushCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (nil == cell) {
        cell = [[[pushCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:str] autorelease];
    }
    push *pp = [self.arr objectAtIndex:indexPath.row];
    //cell.textLabel.text = @"推送";
    cell.label.text = pp.title;
    cell.title.text = pp.subtitle;
    cell.time.text = pp.time;
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //取消选中效果
    //   [tableView deselectRowAtIndexPath:indexPath animated:YES];
    MainPushInViewController *mainPush = [[MainPushInViewController alloc] init];//TheFir
    ThirdFiveViewController *thirdFive = [[ThirdFiveViewController alloc] init];//TheThird
    push *pp = [_arr objectAtIndex:indexPath.row];
    if ([pp.type isEqualToString:@"topic"]) {
        mainPush.str = pp.api_url;
        [self presentViewController:mainPush animated:YES completion:^{
            
        }];
    } else if ([pp.type isEqualToString:@"a"]) {
        thirdFive.str = pp.weburl;
        thirdFive.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentViewController:thirdFive animated:YES completion:^{
            
        }];
    }
    
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
