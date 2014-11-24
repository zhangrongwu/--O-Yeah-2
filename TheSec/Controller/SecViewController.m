//
//  SecViewController.m
//  iNews
//
//  Created by 邹建敏 on 14-9-2.
//  Copyright (c) 2014年 test. All rights reserved.
//

#import "SecViewController.h"
#import "recommendCell.h"
#import "oneCell.h"
#import "threeCell.h"
#import "News.h"
#import "NewsViewController.h"
@interface SecViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic ,retain)NSMutableArray *arr;
@property (nonatomic, retain)UITableView *tableView;
@property(nonatomic, retain)NSString *str;
@end

@implementation SecViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.arr = [NSMutableArray array];
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        [manager GET:@"http://hotphone.myzaker.com/daily_hot_new.php?_appid=iphone&_bsize=2048_1536&_udid=AC9B2F2F-3C18-41C5-8FB8-689962317CB5&_uid=&_utoken=&_v=4.4.3&_version=4.5&clean_local_cache=Y" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            NSArray *dicarr = [[responseObject objectForKey:@"data"] objectForKey:@"articles"];
            
            for (int i = 0 ; i < dicarr.count; i++) {
                
                News *news = [[News alloc] initWithDictionary:[dicarr objectAtIndex:i]];
                
                [self.arr addObject:news];
                
                [news release];
                
                [_tableView reloadData];
            }
            
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            }];
        
    }
    return self;
}

/**
 *  集成刷新控件
 */
- (void)setupRefresh
{
        // 1.下拉刷新(进入刷新状态就会调用self的headerRereshing)
        [self.tableView addHeaderWithTarget:self action:@selector(headerRereshing)];
    
#pragma mark 自动刷新(一进入程序就下拉刷新)
    
    [self.tableView headerBeginRefreshing];
    
    // 2.上拉加载更多(进入刷新状态就会调用self的footerRereshing)
    [self.tableView addFooterWithTarget:self action:@selector(footerRereshing)];
    
}

#pragma mark 开始进入刷新状态
- (void)headerRereshing
{

    // 2.2秒后刷新表格UI
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

        // 刷新表格
        [self.tableView reloadData];
        // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
        [self.tableView headerEndRefreshing];
    });
}

- (void)footerRereshing
{
    
    // 2.2秒后刷新表格UI
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        // 刷新表格
        [self.tableView reloadData];
        
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        [manager GET:@"http://hotphone.myzaker.com/daily_hot_new.php?_appid=iphone&_bsize=640_1136&_udid=73B0A04B-C65A-405C-A596-663E354C59B1&_uid=&_utoken=&_v=4.4.3&_version=4.5&act=next&last_time=1410505029&rank=44997" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            NSArray *dicarr = [[responseObject objectForKey:@"data"] objectForKey:@"articles"];
            
            for (int i = 0 ; i < dicarr.count; i++) {
                
                News *news = [[News alloc] initWithDictionary:[dicarr objectAtIndex:i]];
                
                [self.arr addObject:news];

                [news release];
                
                [_tableView reloadData];
            }
            
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            // NSLog(@"Error: %@", error);
        }];
        // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
        [self.tableView footerEndRefreshing];
    });
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.separatorColor = [UIColor cyanColor];
    
    self.title = @"推荐";
    
    [self setupRefresh];
    
    [self.view addSubview:_tableView];
    [_tableView release];
}

//滑动效果
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if (scrollView.contentOffset.y > 850) {
        self.navigationController.navigationBarHidden = YES;
    }
    
    else{
        
        self.navigationController.navigationBarHidden = NO;
    }
    
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _arr.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    News *news = [_arr objectAtIndex:indexPath.row];
    
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    

    if (news.picture == nil) {
        
        static NSString *str = @"11";
        recommendCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
        if (nil == cell) {
            cell = [[[recommendCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:str] autorelease];
        }
        
        cell.title.text = news.name;
        cell.from.text = news.from;
        cell.time.text = news.time;
        return cell;
        
    }
    else if (news.picture.count == 1){
        static NSString *str = @"22";
        oneCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
        if (nil == cell) {
            cell = [[[oneCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:str] autorelease];
        }
    
        cell.title.text = news.name;
        cell.from.text = news.from;
        
        cell.time.text = news.time;
        NSURL *url = [NSURL URLWithString:[[news.picture objectAtIndex:0]objectForKey:@"url"]];
        [cell.image setImageWithURL:url];
        return cell;
        
        
    }
    else if(news.picture.count == 3){
        static NSString *str = @"33";
        threeCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
        if (nil == cell) {
            cell = [[[threeCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:str]autorelease];
        }
        cell.title.text = news.name;
        cell.from.text = news.from;
        cell.time.text = news.time;
        NSURL *url = [NSURL URLWithString:[[news.picture objectAtIndex:0]objectForKey:@"url"]];
        [cell.image1 setImageWithURL:url];
        NSURL *url1 = [NSURL URLWithString:[[news.picture objectAtIndex:1]objectForKey:@"m_url"]];
        [cell.image2 setImageWithURL:url1];
        NSURL *url2 = [NSURL URLWithString:[[news.picture objectAtIndex:2]objectForKey:@"raw_url"]];
        [cell.image3 setImageWithURL:url2];
        return cell;
    }
    
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    News *news = [_arr objectAtIndex:indexPath.row];
    
    if (news.picture == nil) {
        return 80;
    }
    else if (news.picture.count == 1){
        return 130;
    }
    else if(news.picture.count == 3){
        return 170;
    }
    return 0;
    
    
    
}
//点击
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //取消选中效果
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NewsViewController *newsView = [[NewsViewController alloc] init];
    News *news = [_arr objectAtIndex:indexPath.row];
    newsView.str = news.content;
    newsView.dataTitle = news.name;
    newsView.dataId = news.pk;
    newsView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;//翻转效果
    [self presentViewController:newsView animated:YES completion:^{
        
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
