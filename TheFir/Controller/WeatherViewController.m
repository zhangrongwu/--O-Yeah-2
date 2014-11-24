//
//  WeatherViewController.m
//  iNews
//
//  Created by 邹建敏 on 14-9-4.
//  Copyright (c) 2014年 test. All rights reserved.
//

#import "WeatherViewController.h"

@interface WeatherViewController ()

@property (nonatomic, retain)NSMutableDictionary *dic;
@property (nonatomic, retain)UILabel *lab;

@end

@implementation WeatherViewController

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
 
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    
    NSString *str = [NSString stringWithFormat:@"http://www.weather.com.cn/data/cityinfo/%@.html", self.city];
    
    [manager GET:str parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        self.dic = [responseObject objectForKey:@"weatherinfo"];

        
        //  城市
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 100, 300, 60)];
        label.textAlignment = 1;
        label.textColor = [UIColor whiteColor];
        label.text = [_dic objectForKey:@"city"];
        //字体大小
        label.font = [UIFont boldSystemFontOfSize:40];
        [self.view addSubview:label];
        [label release];
        
        // 天气
        self.lab = [[UILabel alloc]initWithFrame:CGRectMake(10, 170, 300, 40)];
        _lab.text = [_dic objectForKey:@"weather"];
        _lab.textColor = [UIColor whiteColor];
        _lab.textAlignment = 1;
        _lab.font  = [UIFont boldSystemFontOfSize:30];
        [self.view addSubview:_lab];
        [_lab release];

        //  最低温度
        UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(20, 205, 125, 100)];
        label1.text = [_dic objectForKey:@"temp2"];
        label1.textAlignment = 2;
        label1.textColor = [UIColor whiteColor];
        label1.font  = [UIFont boldSystemFontOfSize:30];
        [self.view addSubview:label1];
        [label1 release];
        
        UILabel *la = [[UILabel alloc]initWithFrame:CGRectMake(20, 205, 280, 100)];
        la.text = @" - ";
        la.textAlignment = 1;
        la.textColor = [UIColor whiteColor];
        la.font  = [UIFont boldSystemFontOfSize:30];
        [self.view addSubview:la];
        [la release];
        
        //   最高温度
        UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(180, 205, 140, 100)];
        label2.text = [_dic objectForKey:@"temp1"];
        label2.textColor = [UIColor whiteColor];
        label2.font  = [UIFont boldSystemFontOfSize:30];
        [self.view addSubview:label2];
        [label2 release];
        
        
        UILabel *label3 = [[UILabel alloc]initWithFrame:CGRectMake(10, self.view.frame.size.height - 80, self.view.frame.size.width - 20, 40)];
        label3.textAlignment = 2;
        label3.textColor  = [UIColor whiteColor];
        label3.text = [NSString stringWithFormat:@"更新时间:   %@", [_dic objectForKey:@"ptime"]];
        label3.font = [UIFont boldSystemFontOfSize:17];
        [self.view addSubview:label3];
        [label3 release];
        
        
        UILabel *label4 = [[UILabel alloc]initWithFrame:CGRectMake(10, self.view.frame.size.height - 50, self.view.frame.size.width - 20, 40)];
        label4.textAlignment = 2;
        label4.text = @"数据来源：中央气象台";
           label4.textColor = [UIColor whiteColor];
        label4.font = [UIFont boldSystemFontOfSize:17];
        [self.view addSubview:label4];
        [label4 release];
        
        //   设置天气图标
        
        if ([_lab.text isEqualToString:@"阴转多云"]) {
                  self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"yin.jpg"]];
              }
        
        else if([_lab.text isEqualToString:@"小雨转多云"]){
             self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"yunyu.jpg"]];
        }
        
        else if([_lab.text isEqualToString:@"阴转中雨"]){
             self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"yu.jpg"]];
            
        }
        
        else if([_lab.text isEqualToString:@"阵雨转中雨"]){
            self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"yu.jpg"]];
            
        }

        else if([_lab.text isEqualToString:@"阴"]){
            self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"yin.jpg"]];
            
        }
        
        else if([_lab.text isEqualToString:@"晴"]){
           self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"qing.jpg"]];
            
        }
        else if([_lab.text isEqualToString:@"多云转晴"]){
            self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tai.jpg"]];
            
        }
        else if([_lab.text isEqualToString:@"多云"]){
            self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"yin.jpg"]];
        }
        else if([_lab.text isEqualToString:@"多云转阵雨"]){
            self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"yunyu.jpg"]];
            
        }
        
        else if([_lab.text isEqualToString:@"小雨"]){
            self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"yu.jpg"]];
            
        }
        else if([_lab.text isEqualToString:@"阵雨"]){
           self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"yu.jpg"]];
            
        }
        else if([_lab.text isEqualToString:@"中雨转小雨"]){
            self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"yu.jpg"]];
            
        }
        
        else if([_lab.text isEqualToString:@"多云转小雨"]){
            self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"yunyu.jpg"]];
            
        }
        else if([_lab.text isEqualToString:@"雷阵雨转多云"]){
           self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"le.jpg"]];
        }
        
        else if([_lab.text isEqualToString:@"雷阵雨"]){
            self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"le.jpg"]];
            
        }
        else if([_lab.text isEqualToString:@"中雨转多云"]){
            self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"yunyu.jpg"]];
            
        }
        
        else if([_lab.text isEqualToString:@"小雨转中雨"]){
            self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"yu.jpg"]];
            
        }
        
        else if([_lab.text isEqualToString:@"小雨转阴"]){
            self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"yunyu.jpg"]];
            
        }
        
        else if([_lab.text isEqualToString:@"阵雨转小雨"]){
            self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"yu.jpg"]];
            
        }
        
        else if([_lab.text isEqualToString:@"多云转阴"]){
            self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"yu.jpg"]];
            
        }
        else if([_lab.text isEqualToString:@"晴转多云"]){
            self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tai.jpg"]];
            
        }
        
        else if([_lab.text isEqualToString:@"中雨"]){
            self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"yu.jpg"]];
            
        }
        
        else if([_lab.text isEqualToString:@"小到中雨"]){
            self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"yu.jpg"]];
            
        }
        
        else if([_lab.text isEqualToString:@"雷阵雨转小雨"]){
            self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"yu.jpg"]];
            
        }
        else if([_lab.text isEqualToString:@"阵雨转阴"]){
            self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"yunyu.jpg"]];
            
        }
        
        else if([_lab.text isEqualToString:@"晴转多云"]){
            self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tai.jpg"]];
            
        }
        
        else if([_lab.text isEqualToString:@"大雨转中雨"]){
            self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"yu.jpg"]];
            
        }
        
        else if([_lab.text isEqualToString:@"中雨转阴"]){
            self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"yunyu.jpg"]];
            
        }
        else{
          self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"7.jpg"]];        }

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];

    //UITapGestureRecognizer 什么JB东西
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap)];
    //加图片
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"7.jpg"]];
    [self.view addGestureRecognizer:tap];
    // 手势 用户交互
    self.view.userInteractionEnabled = YES;
    [tap release];

}


- (void)tap{

    MainViewController *main = [[MainViewController alloc]init];
    [self.navigationController pushViewController:main animated:YES];
    
    
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
