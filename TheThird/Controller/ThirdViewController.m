//
//  ThirdViewController.m
//  iNews
//
//  Created by 邹建敏 on 14-9-3.
//  Copyright (c) 2014年 test. All rights reserved.
//

#import "ThirdViewController.h"
#import "ThirdOneViewController.h"
#import "ThirdThreeViewController.h"
#import "UIImageView+WebCache.h"
#import "AFNetworking.h"
#import "FirthWeb.h"
#import "ThirdFourViewController.h"
#import "MyTableViewCell.h"
#import "UIColor+AddColor.h"

@interface ThirdViewController () <UITextFieldDelegate>

@property (nonatomic, retain)UITextField *field;

@end

@implementation ThirdViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.arr = [NSMutableArray array];
        self.dic = [[NSMutableDictionary alloc] init];
        self.arr1 = [NSMutableArray array];
        self.arr2 = [NSMutableArray array];
      
      
        
        //精选网址
        
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        [manager GET:@"http://iphone.myzaker.com/zaker/find.php?_appid=iphone" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSArray *arr = [[responseObject objectForKey:@"data"] objectForKey:@"list"];
            
            for (NSDictionary *dic in arr) {
                FirthWeb *firthWeb = [[FirthWeb alloc] initWithDictionary:dic];
                [_arr addObject:firthWeb];
                [firthWeb release];
            }
            
            
            [_tableView reloadData];
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        }];
        
        //精品三个图片地址
        NSString *path1 = @"http://iphone.myzaker.com/zaker/find_promotion.php?_appid=iphone";
        
        NSURL *url1 = [NSURL URLWithString:path1];
        NSMutableURLRequest *request1 = [NSMutableURLRequest requestWithURL:url1 cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:120];
        request1.HTTPMethod = @"get";
        
        [NSURLConnection sendAsynchronousRequest:request1 queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            
            id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            
            
            self.arr2 = [[result objectForKey:@"data"] objectForKey:@"list"];
            NSString *str = [[[_arr2 firstObject] firstObject] objectForKey:@"promotion_img"];
            
            self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, 300, 55)];
           // _imageView.backgroundColor = [UIColor greenColor];
            NSURL *url = [NSURL URLWithString:str];
            [_imageView setImageWithURL:url];
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
            [_imageView addGestureRecognizer:tap];
            _imageView.userInteractionEnabled = YES;
            [_imageView release];
            
            NSDictionary *dic = [[_arr2 lastObject] firstObject];
            self.imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(10, 65, 295/2, 50)];
            [_imageView1 setImageWithURL:[NSURL URLWithString:[dic objectForKey:@"promotion_img"]]];
            self.str = [[dic objectForKey:@"block_info"] objectForKey:@"api_url"];
            UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap1)];
            [_imageView1 addGestureRecognizer:tap1];
            _imageView1.userInteractionEnabled = YES;
            [_imageView1 release];
            
            NSDictionary *dic1 = [[_arr2 lastObject] lastObject];
            self.imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(163, 65, 295/2, 50)];
            [_imageView2 setImageWithURL:[NSURL URLWithString:[dic1 objectForKey:@"promotion_img"]]];
            self.str1 = [[dic1 objectForKey:@"block_info"] objectForKey:@"api_url"];
            UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap2)];
            [_imageView2 addGestureRecognizer:tap2];
            _imageView2.userInteractionEnabled = YES;
            [_imageView2 release];
            
            [_tableView reloadData];
        }];
        
          }
    return self;
}
- (void)dealloc
{
    [_dic release];
    [_imageView release];
    [_imageView1 release];
    [_imageView2 release];
    [_arr release];
    [_arr1 release];
    [_scrollView release];
    [_tableView release];
    [_tableView1 release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"sou.png"] style:UIBarButtonItemStyleBordered target:self action:@selector(sou)];
    
    self.title = @"发现";
  //apiBlockSorts plist获取路径
    NSArray *arr = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSLog(@"11111111111111111%@", arr);
    //本地
    NSString *path = [[NSBundle mainBundle]pathForResource:@"apiBlockSorts" ofType:@"plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];

    self.arr1 = [dic objectForKey:@"_root"];
    
    // 下面铺scrollview
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0,35+64, self.view.frame.size.width, self.view.frame.size.height)];
    _scrollView.contentSize = CGSizeMake(640, 0);
    _scrollView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_scrollView];
    _scrollView.pagingEnabled = YES;
    _scrollView.scrollEnabled = NO;
    [_scrollView release];

    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitleColor:[UIColor redColor] forState:0];
    button.frame = CGRectMake(0, 64, 160, 40);
    button.backgroundColor = [UIColor whiteColor];
    [button setTitle:@"精品" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    [button1 setTitleColor:[UIColor redColor] forState:0];
    button1.backgroundColor = [UIColor whiteColor];
    button1.frame = CGRectMake(160, 64, 160, 40);
    [button1 setTitle:@"内容库" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(buttonClicked1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    //scrollView不会乱跑
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-60-64-19) style:UITableViewStylePlain];
    
    //加3张图片
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 120)];
    [view addSubview:_imageView];
    [view addSubview:_imageView1];
    [view addSubview:_imageView2];
    _tableView.tableHeaderView = view;
    [view release];
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_scrollView addSubview:_tableView];
    [_tableView release];
    
    self.tableView1 = [[UITableView alloc] initWithFrame:CGRectMake(self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height-60-64-19) style:UITableViewStylePlain];
    _tableView1.dataSource = self;
    _tableView1.delegate = self;
    [_scrollView addSubview:_tableView1];
    [_tableView1 release];
    
    
    
}

- (void)sou{
    SouViewController *sou = [[SouViewController alloc]init];
    [self.navigationController pushViewController: sou animated:YES];
    [sou release];

}


- (void)tap
{
    ThirdOneViewController *thirdOne = [[ThirdOneViewController alloc] init];
    thirdOne.str = [[[[_arr2 firstObject] firstObject] objectForKey:@"block_topic"]objectForKey:@"api_url"];
    [self.navigationController pushViewController:thirdOne animated:YES];
    [thirdOne release];

}
//3张图片
- (void)tap1
{

    ThirdFourViewController *thirdFour = [[ThirdFourViewController alloc] init];
    thirdFour.str = _str;
    thirdFour.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:thirdFour animated:YES completion:^{
        
    }];
    [thirdFour release];
}
- (void)tap2
{
    ThirdFourViewController *thirdFour = [[ThirdFourViewController alloc] init];
    thirdFour.str = _str1;
    thirdFour.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:thirdFour animated:YES completion:^{
        
    }];
    [thirdFour release];
}

//tableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == _tableView) {
        return _arr.count;
    }
    else {
        return _arr1.count-4;
    }
}
//tableView
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (tableView == _tableView) {
       static NSString *str = @"reuse";
        MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
        if (cell == nil) {
            cell = [[[MyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str]autorelease];
        }
        
        FirthWeb *firthWeb = [_arr objectAtIndex:indexPath.row];
        cell.myLabel.text = firthWeb.title;
        cell.myLabel1.text = firthWeb.stitle;
        //            cell.detailTextLabel.text = firthWeb.stitle;
        cell.myImageView.backgroundColor = [UIColor colorFromHexCode:[[self.arr objectAtIndex:indexPath.row] block_color]];
        NSURL *url = [NSURL URLWithString:firthWeb.pic];
        [cell.myImageView setImageWithURL:url];
        return cell;
    }
    
    else if (tableView == _tableView1) {
        NSString *str = @"reuse1";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
        if (cell == nil) {
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:str]autorelease];
        }
        NSDictionary *dic = [_arr1 objectAtIndex:indexPath.row];
        
        cell.textLabel.text = [dic objectForKey:@"block_title"];
        NSURL *url = [NSURL URLWithString:[dic objectForKey:@"list_icon"]];
        //cell右部的标记
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        [cell.imageView setImageWithURL:url];
        return cell;
    }
    return 0;
}
//tavleView 点击方法
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //取消选中效果
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
 
    if (tableView == _tableView) {

        ThirdFourViewController *sss = [[ThirdFourViewController alloc] init];
        FirthWeb *aaa = [_arr objectAtIndex:indexPath.row];
        sss.str = aaa.api_url;
        sss.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentViewController:sss animated:YES completion:^{
            
        }];
    } else if (tableView == _tableView1) {
        NSDictionary *dic = [_arr1 objectAtIndex:indexPath.row];
        NSString *string = [dic objectForKey:@"block_title"];
        if (![string isEqualToString:@"视觉"]) {
            
            ThirdThreeViewController *thir3dVC = [[ThirdThreeViewController alloc] init];
            thir3dVC.str = [dic objectForKey:@"block_title"];
            thir3dVC.arr = [dic objectForKey:@"sons"];
            [self.navigationController pushViewController:thir3dVC animated:YES];
            [thir3dVC release];
        } else {
            SonViewController *sonVC = [[SonViewController alloc] init];
            NSArray *arr = [[self.arr1 objectAtIndex:10]objectForKey:@"sons"];
            sonVC.arr = [arr copy];
            NSString *string = [[self.arr1 objectAtIndex:10]objectForKey:@"block_title"];
            sonVC.str = string;
            [self.navigationController pushViewController:sonVC animated:YES];
            [sonVC release];
        }
    }
}

//tableViewCell 高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == _tableView) {
        return 80;
    } else {
        return 50;
    }
    return 0;
}
//section高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 2;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (tableView == _tableView) {
        return @"精选";
    }
    return nil;
}
//section个数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
//button方法
- (void) buttonClicked
{
    _scrollView.contentOffset = CGPointMake(0, 0);
}
//button方法
- (void) buttonClicked1:(UIButton *)button
{
    _scrollView.contentOffset = CGPointMake(self.view.frame.size.width, 0);
    
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
