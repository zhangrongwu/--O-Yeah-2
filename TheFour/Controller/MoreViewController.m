//
//  MoreViewController.m
//  iNews
//
//  Created by 邹建敏 on 14-9-4.
//  Copyright (c) 2014年 test. All rights reserved.
//

#import "MoreViewController.h"

@interface MoreViewController ()

@property (nonatomic, retain)UILabel *label1;
@property (nonatomic, retain)UILabel *label2;
@property (nonatomic, retain)UILabel *label3;

@end

@implementation MoreViewController

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
    
    self.title = @"高级设置";
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 480) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    [_tableView release];
}

- (void)dealloc
{
    [_tableView release];
    [_segment release];
    [_label1 release];
    [_label2 release];
    [_label3 release];
    [super dealloc];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 3;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    else if (section == 1){
        
        return 2;
    }
    
    else{
        return 3;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *str = @"11";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (nil == cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:str];
    }
    
    if (indexPath.section == 0) {
        cell.textLabel.text = @"分享设置";
        cell.detailTextLabel.text = @"第三方分享账号绑定";
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"要闻推送";
            cell.detailTextLabel.text = @"实时推送重大新闻";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        else{
            cell.textLabel.text = @"双击关闭文章";
            
            
            UISwitch *swi = [[UISwitch alloc]initWithFrame:CGRectMake(260, 10, 100, 34)];
            [swi addTarget:self action:@selector(swiChange:) forControlEvents:UIControlEventValueChanged];
            [cell.contentView addSubview:swi];
            [swi release];
            
        }
    }
    
    else if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"主题选择";
            
            NSArray *arr = [NSArray arrayWithObjects:@"红色", @"青色", @"橙色", @"绿色", nil];
            self.segment = [[UISegmentedControl alloc] initWithItems:arr];
            // 可以设置大小
            self.segment.frame = CGRectMake(160, 10, 150, 30);
            // 设置填充色
            self.segment.tintColor = [UIColor whiteColor];
            // 设置背景色
            self.segment.backgroundColor = [UIColor orangeColor];
            // 给segment绑定一个触发方法
            [self.segment addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
            
            // 默认选择哪个位置
            //            self.segment.selectedSegmentIndex = 1;
            
            // 添加到view
            [cell.contentView addSubview:self.segment];
            [_segment release];
            
        }
        else if (indexPath.row == 1){
            cell.textLabel.text = @"彩色图标";
            
            UISwitch *swi = [[UISwitch alloc]initWithFrame:CGRectMake(260, 10, 100, 34)];
            [swi addTarget:self action:@selector(swiChange:) forControlEvents:UIControlEventValueChanged];
            [cell.contentView addSubview:swi];
            [swi release];
            
        }
        else{
            
            cell.textLabel.text = @"加载图片";
            
            UISegmentedControl *seg = [[UISegmentedControl alloc]initWithItems:@[@"所有网络", @"仅wifi", @"不下载"]];
            seg.frame = CGRectMake(130, 10, 180, 30);
            seg.backgroundColor = [UIColor cyanColor];
            [cell.contentView addSubview:seg];
            [seg release];
            
        }
    }
    return cell;
    
}

- (void)segmentAction:(UISegmentedControl *)seg
{
    NSLog(@"selected index: %d", seg.selectedSegmentIndex);
    
    // switch的写法
    switch (seg.selectedSegmentIndex) {
        case 0:
        {
            NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
            [center postNotificationName:@"changeColor" object:@"红"];
            BaseColor *manager = [BaseColor baseColor];
            manager.baseColor = [UIColor redColor];
        }
            
            break;
        case 1:
        {
            NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
            [center postNotificationName:@"changeColor" object:@"青"];
            BaseColor *manager = [BaseColor baseColor];
            manager.baseColor = [UIColor cyanColor];
        }
            
            break;
        case 2:
        {
            NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
            [center postNotificationName:@"changeColor" object:@"橙"];
            BaseColor *manager = [BaseColor baseColor];
            manager.baseColor = [UIColor orangeColor];
        }
            
            break;
        case 3:
            
        {
            NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
            [center postNotificationName:@"changeColor" object:@"绿"];
            BaseColor *manager = [BaseColor baseColor];
            manager.baseColor = [UIColor greenColor];
        }
            
            break;
        default:
            break;
    }
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //   取消选中效果
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}


//   UISwitch的方法

- (void)swiChange:(UISwitch *)swi{
    
    if (swi.on) {
        NSLog(@"打开");
    }
    
    else{
        NSLog(@"关闭");
        
    }
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 13;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50;
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
