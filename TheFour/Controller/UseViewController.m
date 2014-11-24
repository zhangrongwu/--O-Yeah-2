//
//  UseViewController.m
//  iNews
//
//  Created by 邹建敏 on 14-9-3.
//  Copyright (c) 2014年 test. All rights reserved.
//

#import "UseViewController.h"
#import "useCell.h"
#import "ues.h"
#import "UseInViewController.h"

@interface UseViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, retain)NSMutableArray *arr;
@property (nonatomic, retain)UITableView *tableView;
@property (nonatomic, retain)NSString *str;

@end

@implementation UseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.arr = [NSMutableArray array];
        
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        [manager GET:@"http://iphone.myzaker.com/zaker/appstore.php?app_id=6" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            NSArray *dicarr = [[responseObject objectForKey:@"data"] objectForKey:@"articles"];
            
            
            for (int i = 0 ; i < dicarr.count; i++) {
                ues *kk = [[ues alloc] initWithDictionary:[dicarr objectAtIndex:i]];
                
                [self.arr addObject:kk];
                [kk release];
                [_tableView reloadData];
            }
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"Error: %@", error);
        }];
    }
    return self;
}


- (void)dealloc
{
    [_arr release];
    [_tableView delegate];
    [_str release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate  = self;
    self.title = @"最新应用";
    [self.view addSubview:_tableView];
    [_tableView release];
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _arr.count;
    
}
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *str  = @"111";
    useCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (nil == cell) {
        cell = [[[useCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:str] autorelease];
        
    }
    //箭头
    cell.accessoryType =UITableViewCellAccessoryDisclosureIndicator;
    
    ues *pp = [self.arr objectAtIndex:indexPath.row];
    
    NSURL *url = [NSURL URLWithString:pp.auther_icon];
    [cell.image setImageWithURL:url];
    cell.subtitle.text = pp.content;
    cell.auther_name.text = pp.auther_name;
    return cell;
}
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //取消选中效果
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UseInViewController *uesInView = [[UseInViewController alloc] init];
    ues *ues = [_arr objectAtIndex:indexPath.row];
    uesInView.str = ues.weburl;
    
    [ self.navigationController pushViewController:uesInView animated:YES];
    [uesInView release];
    
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
