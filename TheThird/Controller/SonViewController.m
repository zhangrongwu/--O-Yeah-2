//
//  SonViewController.m
//  iNews
//
//  Created by 顾鸿飞 on 14-9-12.
//  Copyright (c) 2014年 test. All rights reserved.
//

#import "SonViewController.h"
#import "UIImageView+WebCache.h"
#import "ThirdFourViewController.h"

@interface SonViewController () <UITableViewDataSource, UITableViewDelegate>

//@property (nonatomic, retain) NSMutableArray *arr;
@property (nonatomic, retain) NSString *str1;

@end

@implementation SonViewController

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
    [_arr release];
    [_str release];
    [_str1 release];
    [_tableView release];
    [super dealloc];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    [_tableView release];
    
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *arr = [[_arr objectAtIndex:section]objectForKey:@"sons"];
    return arr.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *str = @"reuse";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:str]autorelease];
    }
    NSArray *arr = [[_arr objectAtIndex:indexPath.section]objectForKey:@"sons"];
    NSDictionary *dic = [arr objectAtIndex:indexPath.row];
    cell.textLabel.text = [dic objectForKey:@"block_title"];
    
    //    [dic objectForKey:@"pic"];
    //    [cell.imageView setImageWithURL:[dic objectForKey:@"pic"]];
    
    return cell;
}
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ThirdFourViewController *aaa = [[ThirdFourViewController alloc] init];
    NSArray *arr = [[_arr objectAtIndex:indexPath.section]objectForKey:@"sons"];
    NSDictionary *dic = [arr objectAtIndex:indexPath.row];
    self.str = [dic objectForKey:@"api_url"];
    aaa.str = _str;
    [self presentViewController:aaa animated:YES completion:^{
        
    }];
    [aaa release];
    
}
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return _arr.count;
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [[_arr objectAtIndex:section]objectForKey:@"title"];
}
- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
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
