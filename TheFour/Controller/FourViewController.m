//
//  FourViewController.m
//  iNews
//
//  Created by 邹建敏 on 14-9-2.
//  Copyright (c) 2014年 test. All rights reserved.
//

#import "FourViewController.h"
#import "PushViewController.h"
#import "UseViewController.h"
#import "BaseColor.h"
#import <sys/stat.h>
#import <dirent.h>

@interface FourViewController () <UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate>
@property(nonatomic, retain)NSMutableArray *arr;
@property(nonatomic, retain)NSMutableArray *arr2;
@property(nonatomic, retain)NSMutableArray *arr3;
@property(nonatomic ,assign)NSUInteger fileCount;
@property(nonatomic, retain)UILabel *sumMemory;

@property (nonatomic, retain)UIAlertView *all;
@property (nonatomic, retain)UIAlertView *alert;

@property (nonatomic, retain)NSString *name;
@property (nonatomic, retain)NSString *pic;


@end

@implementation FourViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.arr = [NSMutableArray arrayWithObjects:@"推送咨询", @"我的收藏", nil];
        self.arr2 = [NSMutableArray arrayWithObjects:@"清除缓存", @"夜间模式", @"百变主题", nil];
        self.arr3 = [NSMutableArray arrayWithObjects:@"应用推荐",@"关于我们", @"退出登录", nil];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"我的";

    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    
    [self.view addSubview: tableView];
    [tableView release];
    
    UIView *aView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 140)];
    aView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"7.jpg"]];
    [self.view addSubview:aView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap)];
    
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(130, 25, 60, 60)];
    _imageView.image = [UIImage imageNamed:@"1.png"];
    _imageView.userInteractionEnabled = YES;
    
    [self.imageView addGestureRecognizer:tap];
    [_imageView release];
    
    [tap release];
    
    //    图片变圆形
    [_imageView setClipsToBounds:YES];
    [_imageView.layer setCornerRadius:_imageView.frame.size.width/2.0];
    
    [aView addSubview:_imageView];

    tableView.tableHeaderView = aView;
    
    self.label = [[UILabel alloc]initWithFrame:CGRectMake(0, 90, self.view.frame.size.width, 40)];
    _label.textAlignment = 1;
    _label.font = [UIFont boldSystemFontOfSize:17];
    _label.textColor = [UIColor whiteColor];
    _label.text = @"快登陆吧，我还没有名字呢!";
    [aView addSubview:_label];
    [_label release];
    

    //获取通知中心(单例)
    NSNotificationCenter  *center = [NSNotificationCenter defaultCenter];
    
    //参数1: 设置观察者
    //参数2: 触发的响应方法
    //参数3: 事件的标识名
    [center addObserver:self selector:@selector(notificationAction:) name:@"login" object:nil];
    
}


//触发的响应方法
- (void)notificationAction:(NSNotification *)notification
{
    
    [_imageView setImageWithURL:[NSURL URLWithString:[notification.userInfo objectForKey:@"userPic"]]];
    [_label setText: [notification.userInfo objectForKey:@"userName"]];
    NSLog(@"-----------1--2----3--%@", [notification.userInfo objectForKey:@"userName"]);
}

- (void)tap{
    
    [ShareSDK getUserInfoWithType:ShareTypeSinaWeibo
                      authOptions:nil
                           result:^(BOOL result, id<ISSPlatformUser> userInfo, id<ICMErrorInfo> error) {
                               
                               if (result)
                               {
                                   PFQuery *query = [PFQuery queryWithClassName:@"UserInfo"];
                                   [query whereKey:@"uid" equalTo:[userInfo uid]];
                                   [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
                                       
                                       if ([objects count] == 0)
                                       {
                                           PFObject *newUser = [PFObject objectWithClassName:@"UserInfo"];
                                           [newUser setObject:[userInfo uid] forKey:@"uid"];
                                           [newUser setObject:[userInfo nickname] forKey:@"name"];
                                           [newUser setObject:[userInfo profileImage] forKey:@"icon"];
                                           [newUser saveInBackground];
                                           
                                           UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Hello" message:@"欢迎注册" delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles: nil];
                                           [alertView show];
                                           [alertView release];
                                       }
                                       else
                                       {
                                           
                                           self.name = [userInfo nickname];
                                           self.pic = [userInfo profileImage];
                                           
                                           [self login];
                                           
                                           [self dismissViewControllerAnimated:YES completion:^{
                                               
                                           }];
                                           
                                           UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Hello" message:@"欢迎回来" delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles: nil];
                                           [alertView show];
                                           [alertView release];
                                       }
                                   }];
                               }
                               
                           }];


}



//通知中心的方法

- (void)login
{
    
    //获取通知中心
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    
    //创建一个多个参数的字典
    NSDictionary *dic = @{@"userName": _name, @"userPic" : _pic};
    //参数1:告诉通知中心 给哪个事件的对象观察者发出通知
    //参数2:传递一个参数
    //参数3:传递多个参数 (创建一个字典)
    [center postNotificationName:@"login" object:@"111" userInfo:dic];
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

//每组有几个
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (section == 0) {
        return 2;
    } else if (section == 1)
    {
        return 3;
    }
    else if(section == 2)
    {
        return 3;
    }
    return 0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *str = @"111";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (nil == cell) {
        cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:str] autorelease];
    }
    
    //开关
    UISwitch *switchView = [[UISwitch alloc] initWithFrame:CGRectMake(250, 7, 90, 28)];
    
    [switchView addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
    
    if (indexPath.section == 1 && indexPath.row == 1) {
        
        [cell.contentView addSubview:switchView];
    }
    
    
    
   
    
    //     cell上添加一个label   (清除缓存)
    
    if ((indexPath.section == 1 && indexPath.row == 0)) {

        [self.sumMemory removeFromSuperview];

        self.sumMemory = [[UILabel alloc] initWithFrame:CGRectMake(210, 8, 100, 30)];
        _sumMemory.textAlignment = 2;
        
        [_sumMemory setFont:[UIFont boldSystemFontOfSize:14]];
        [_sumMemory setTextColor:[UIColor grayColor]];
        
        [cell.contentView addSubview:_sumMemory];
        [_sumMemory release];
    }


    //箭头
    
    if (!((indexPath.section == 1 && indexPath.row == 0) || (indexPath.section == 1 && indexPath.row == 1)))
    {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    if ( indexPath.section == 0) {
        cell.textLabel.text = [self.arr objectAtIndex:indexPath.row];
    }
    else if (indexPath.section == 1) {
        cell.textLabel.text = [self.arr2 objectAtIndex:indexPath.row];
    }
    else if( indexPath.section == 2)
    {
        cell.textLabel.text = [self.arr3 objectAtIndex:indexPath.row];
    }
    return cell;
}


-(void)switchAction:(UISwitch *)swi
{
    
    if ((swi.on == YES)) {
        
        NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
        [center postNotificationName:@"changeSink" object:@"YES"];
        
    } else {
        
        NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
        [center postNotificationName:@"changeSink" object:@"NO"];
        
    }
    
}


//一个几组

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

//点击事件


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    if (indexPath.section == 0 && indexPath.row == 0) {
        PushViewController *firstVC = [[PushViewController alloc] init];
        [self.navigationController pushViewController:firstVC animated:YES];
        [firstVC release];
    }
  
    #pragma mark 清空缓存事件
    if (indexPath.section == 1 && indexPath.row == 0) {

        self.all = [[UIAlertView alloc]initWithTitle:@"确定清除缓存？" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [_all show];
        [self.view addSubview:_all];
    
    }
    
    
        if (indexPath.section == 2 && indexPath.row == 0) {
            
        UseViewController *thirdVC = [[UseViewController alloc] init];
        [self.navigationController pushViewController:thirdVC animated:YES];
        [thirdVC release];
    }
    
    if (indexPath.section == 2 && indexPath.row == 1) {
        AboutViewController *about = [[AboutViewController alloc]init];
        [self.navigationController pushViewController:about animated:YES];
        [about release];
    
    }
    
    
    if (indexPath.section == 1 && indexPath.row == 2) {

        RightViewController *right = [[RightViewController alloc]init];
        self.rightSemiViewController = right;
   
    }
    
    
    if (indexPath.section == 2 && indexPath.row == 2) {

            self.alert = [[UIAlertView alloc]initWithTitle:@"您确定要退出账号？" message:@"君，请三思啊！" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
            
            _alert.delegate = self;
            [_alert show];
            [_alert release];
        }
    
    if (indexPath.section == 0 && indexPath.row == 1) {
        
        DataViewController *data = [[DataViewController alloc]init];
        
        [self.navigationController pushViewController:data animated:YES];
        [data release];
        
    }
    
    }


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    
    if (alertView == _alert) {
        
        if (buttonIndex == 1) {
            [ShareSDK cancelAuthWithType:ShareTypeSinaWeibo];
            
            self.imageView.image = [UIImage imageNamed:@"1.png"];
            self.label.text = @"用户名";
            
        }
    }
    
    
    else if (alertView == _all) {
        
        if (buttonIndex == 1) {
            
            // 缓存
            SDImageCache *sdimage = [[[SDImageCache alloc] init] autorelease];
            [sdimage clearMemory];
            [sdimage clearDisk];
            float clean = [sdimage checkTmpSize];
            // NSLog(@"-----%f",clean);
            // [self.but1 setTitle:[NSString stringWithFormat:@"缓存:%.2fM", clean] forState:UIControlStateNormal];
            self.sumMemory.text = [NSString stringWithFormat:@"缓存:%.2fM", clean];



//            dispatch_async(
//                           dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
//                           , ^{
//                               NSString *cachPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask, YES) objectAtIndex:0];//查找沙盒 在沙盒中取第一个元素的路径
//                               
//                               NSArray *files = [[NSFileManager defaultManager] subpathsAtPath:cachPath];//NSFileManager 文件
//                               self.fileCount = files.count;//将文件内文件 放进一个自定义数组中
//                               
//                               for (NSString *p in files) {
//                                   NSError *error;
//                                   NSString *path = [cachPath stringByAppendingPathComponent:p];//拼接
//                                   if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
//                                       [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
//                                   }
//                               }
//                               //给显示方法
//                               [self performSelectorOnMainThread:@selector(clearCacheSuccess) withObject:nil waitUntilDone:YES];});
            
       
        }


    }
    
    

}

//清除缓存------------------------------------------

//-(void)clearCacheSuccess
//{
//    if (self.fileCount == 0) {
//        [self.sumMemory setText:@"当前缓存已清空"];
//    }
//    
//    else {
//        [self.sumMemory setText:[NSString stringWithFormat:@"清除%d个文件", _fileCount]];
//    }
//    
//    NSLog(@"清空缓存");
//
//}

- (void)dealloc
{
    [_arr release];
    [_arr2 release];
    [_arr3 release];
    [_sumMemory release];
    [_imageView release];
    [_label release];    
    [super dealloc];
}

// 第三方删除缓存
- (void)viewWillAppear:(BOOL)animated
{
    SDImageCache *sdimage = [[[SDImageCache alloc] init] autorelease];
    float clean = [sdimage checkTmpSize];
   
    self.sumMemory.text = [NSString stringWithFormat:@"缓存:%.2fM", clean];
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
