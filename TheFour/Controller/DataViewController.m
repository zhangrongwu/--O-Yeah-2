//
//  DataViewController.m
//  iNews
//
//  Created by 邹建敏 on 14-9-12.
//  Copyright (c) 2014年 test. All rights reserved.
//

#import "DataViewController.h"
#import "DataBaseHandle.h"
#import <sqlite3.h>

@interface DataViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain)UITableView *tableView;
@property (nonatomic, retain)NSMutableArray *arr;
@property (nonatomic, retain)NSMutableArray *arr1;

@end

@implementation DataViewController

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
    
    //   打开数据库，取出其中数据
    DataBaseHandle *dat = [DataBaseHandle shareInstance];
    [dat openDatabase];
    
    self.arr = [dat selectAll];
    self.arr1 = [dat selectAll1];
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    [_tableView release];
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
}

//  系统的编辑按钮触发的方法
- (void)setEditing:(BOOL)editing animated:(BOOL)animated{

    [super setEditing:editing animated:animated];
    [_tableView setEditing:editing animated:YES];
}

//    给每一行设置编辑的样式
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{

    return UITableViewCellEditingStyleDelete;
}


//  点击delete按钮的协议方法
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{

    
    DataBaseHandle *dat = [DataBaseHandle shareInstance];
    [dat dele:[_arr objectAtIndex:indexPath.row]];
    
    [_arr removeObjectAtIndex:indexPath.row];
    
  

    NSArray *deleteArr = [NSArray arrayWithObjects:indexPath, nil];
    //   删除某一行
    //   参数1 ： 需要删除的cell的   indexPath的数组
    [tableView deleteRowsAtIndexPaths:deleteArr withRowAnimation:UITableViewRowAnimationLeft];
    
}


- (void)dealloc
{
    [_tableView release];
    [_arr release];
    [_arr1 release];
    [super dealloc];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    NSLog(@"-------------------%d", _arr.count);
    return _arr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *str = @"111";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (nil == cell) {
        cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:str]autorelease];
    }

    cell.textLabel.text = [_arr objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [_arr1 objectAtIndex:indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    ReadViewController *rea = [[ReadViewController alloc]init];
    rea.str = [_arr1 objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:rea animated:YES];
    [rea release];
    
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
