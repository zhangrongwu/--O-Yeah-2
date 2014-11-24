//
//  MainViewController.m
//  iNews
//
//  Created by 邹建敏 on 14-9-2.
//  Copyright (c) 2014年 test. All rights reserved.
//

#import "MainViewController.h"
#import "AutoScrollView.h"

@interface MainViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UIScrollViewDelegate>

@property (nonatomic, retain)UICollectionView *collectionView;
@property (nonatomic, retain)UIScrollView *scrollView;
@property (nonatomic, retain)UIImageView *imageView;
@property (nonatomic, retain)NSMutableArray *arr;         //    首页四张展示图片数组
@property (nonatomic, retain)NSMutableArray *arr1;      //   本地plist文件
@property (nonatomic, retain)NSMutableArray *arrk;
@property (nonatomic, retain)NSMutableArray *dicArr;
@property (nonatomic, retain)NSString *pathToUserCopyOfPlist;


@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.arrk = [NSMutableArray array];
        
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        [manager GET:@"http://iphone.myzaker.com/zaker/follow_promote.php?_appid=iphone&_dev=iPhone%2C7.1.2&_udid=98B54861-5C92-4402-B374-7E73F6CDCA36&_uid=&_version=4.5&m=1409380582" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            self.dicArr = [[responseObject objectForKey:@"data"]objectForKey:@"list"];
 
            for (int i = 0; i < _dicArr.count; i++) {

                NSString *str = [[_dicArr objectAtIndex:i]objectForKey:@"promotion_img"];
                [_arrk addObject:str];
            }

            AutoScrollView *autoView = [[AutoScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, 140)];

            //    传值给轮播图
            autoView.title = _dicArr;
            
            [autoView setTimeInterval:4];
            
            [autoView setImageUrls:_arrk];
            
            [autoView setTarget:self action:@selector(kk:)];
            
            [_collectionView addSubview:autoView];
            
            [autoView release];
            
  
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            NSLog(@"Error: %@", error);
        }];
    }
    return self;
}


- (void)kk:(Tap *)tap{
    
    if (tap.flag == 0) {

        NSDictionary *dic = [_dicArr objectAtIndex:0];
        if ([[dic objectForKey:@"type"] isEqualToString:@"block"]) {
            NSString *str = [[dic objectForKey:@"block_info"]objectForKey:@"api_url"];
            ThirdFourViewController *four = [[ThirdFourViewController alloc] init];
            four.str = str;
            four.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
            [self presentViewController:four animated:YES completion:^{
            }];
        
    }
        else if([[dic objectForKey:@"type"] isEqualToString:@"topic"]){
            MainPushInViewController *mainVC = [[MainPushInViewController alloc] init];
            
            NSString *str = [[dic objectForKey:@"topic"] objectForKey:@"api_url"];
            mainVC.str = str;
            mainVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
            [self presentViewController:mainVC animated:YES completion:^{
                
            }];
        }
        
        else if([[dic objectForKey:@"type"] isEqualToString:@"web"]){
            ThirdFiveViewController *third = [[ThirdFiveViewController alloc] init];
            
            NSString *str = [[dic objectForKey:@"web"] objectForKey:@"url"];
            third.str = str;
            third.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
            [self presentViewController:third animated:YES completion:^{
                
            }];
        }
        else {
            NSLog(@"麻痹 有完没完了");
        }
        
    }
    else if (tap.flag == 1){
        NSDictionary *dic = [_dicArr objectAtIndex:1];
        if ([[dic objectForKey:@"type"] isEqualToString:@"block"]) {
            NSString *str = [[dic objectForKey:@"block_info"]objectForKey:@"api_url"];
            ThirdFourViewController *four = [[ThirdFourViewController alloc] init];
            four.str = str;
            four.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
            [self presentViewController:four animated:YES completion:^{
            }];
            
        } else if([[dic objectForKey:@"type"] isEqualToString:@"topic"]){
            MainPushInViewController *mainVC = [[MainPushInViewController alloc] init];
            NSString *str = [[dic objectForKey:@"topic"] objectForKey:@"api_url"];
            mainVC.str = str;
            mainVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
            [self presentViewController:mainVC animated:YES completion:^{
                
            }];
        } else if([[dic objectForKey:@"type"] isEqualToString:@"web"]){
            ThirdFiveViewController *third = [[ThirdFiveViewController alloc] init];
            
            NSString *str = [[dic objectForKey:@"web"] objectForKey:@"url"];
            third.str = str;
            third.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
            [self presentViewController:third animated:YES completion:^{
                
            }];
        }
        else {
            NSLog(@"麻痹 有完没完了");
        }
    }
    else if (tap.flag == 2){
        
        NSDictionary *dic = [_dicArr objectAtIndex:2];
        if ([[dic objectForKey:@"type"] isEqualToString:@"block"]) {
            NSString *str = [[dic objectForKey:@"block_info"]objectForKey:@"api_url"];
            ThirdFourViewController *four = [[ThirdFourViewController alloc] init];
            four.str = str;
            four.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
            [self presentViewController:four animated:YES completion:^{
            }];
            
        } else if([[dic objectForKey:@"type"] isEqualToString:@"topic"]){
            MainPushInViewController *mainVC = [[MainPushInViewController alloc] init];
            NSString *str = [[dic objectForKey:@"topic"] objectForKey:@"api_url"];
            mainVC.str = str;
            mainVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
            [self presentViewController:mainVC animated:YES completion:^{
                
            }];
        }
        else if([[dic objectForKey:@"type"] isEqualToString:@"web"]){
            ThirdFiveViewController *third = [[ThirdFiveViewController alloc] init];
            
            NSString *str = [[dic objectForKey:@"web"] objectForKey:@"url"];
            third.str = str;
            third.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
            [self presentViewController:third animated:YES completion:^{
                
            }];
        }else {
            NSLog(@"麻痹 有完没完了");
        }
    }
    else if (tap.flag == 3){
        
        NSDictionary *dic = [_dicArr objectAtIndex:3];
        if ([[dic objectForKey:@"type"] isEqualToString:@"block"]) {
            NSString *str = [[dic objectForKey:@"block_info"]objectForKey:@"api_url"];
            ThirdFourViewController *four = [[ThirdFourViewController alloc] init];
            four.str = str;
            four.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
            [self presentViewController:four animated:YES completion:^{
            }];
            
        } else if([[dic objectForKey:@"type"] isEqualToString:@"topic"]){
            MainPushInViewController *mainVC = [[MainPushInViewController alloc] init];
            NSString *str = [[dic objectForKey:@"topic"] objectForKey:@"api_url"];
            mainVC.str = str;
            mainVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
            [self presentViewController:mainVC animated:YES completion:^{
                
            }];
        }
        else if([[dic objectForKey:@"type"] isEqualToString:@"web"]){
            ThirdFiveViewController *third = [[ThirdFiveViewController alloc] init];
            
            NSString *str = [[dic objectForKey:@"web"] objectForKey:@"url"];
            third.str = str;
            third.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
            [self presentViewController:third animated:YES completion:^{
                
            }];
        }
        else {
            NSLog(@"麻痹 有完没完了");
        }
    }

}

#pragma mark --- 第三方刷新方法

- (void)addHeader
{
    __unsafe_unretained typeof(self) vc = self;
    // 添加下拉刷新头部控件
    [self.collectionView addHeaderWithCallback:^{
        // 进入刷新状态就会回调这个Block
        
        // 模拟延迟加载数据，因此0.05秒后才调用）
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.05 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

            [vc.collectionView reloadData];
            // 结束刷新
            [vc.collectionView headerEndRefreshing];

            //    跳转到首页图片
            ShowViewController *show = [[ShowViewController alloc]init];
            [self presentViewController:show animated:YES completion:^{
                
            }];
        });
    }];
    
#pragma mark 自动刷新(一进入程序就下拉刷新)
    //    [self.collectionView headerBeginRefreshing];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBarHidden = NO;
    self.tabBarController.tabBar.hidden = NO;
    
    self.title = @"订阅";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"5.png"] style:UIBarButtonItemStyleBordered target:self action:@selector(getMap)];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"6.png"] style:UIBarButtonItemStyleBordered target:self action:@selector(getWeather)];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(106, 106);
    layout.minimumInteritemSpacing = 1;
    layout.minimumLineSpacing = 1;
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    //   collectionView上面空出一段，用来加一个scrollView
    layout.sectionInset = UIEdgeInsetsMake(140, 0, 0, 0);
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_collectionView];

    // 2.集成刷新控件
    [self addHeader];
    
    [_collectionView release];
    
    [_collectionView registerClass:[Mycell class] forCellWithReuseIdentifier:@"re"];
    
    //   取得字典
    NSString *path = [[NSBundle mainBundle]pathForResource:@"rootBlocks" ofType:@"plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];

    //  将字典存入本地
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    self.pathToUserCopyOfPlist = [documentsDirectory stringByAppendingPathComponent:@"rootBlocks.plist"];
    
    [dic writeToFile:_pathToUserCopyOfPlist atomically:YES];
    
    //   从本地读取字典数据
//    NSDictionary *dicLocal = [NSDictionary dictionaryWithContentsOfFile:_pathToUserCopyOfPlist];

    //    取得字典中的数组源，增删改的时候，只需要将该数组重新载入本地即可
    self.arr1 = [dic objectForKey:@"blocksData"];
    
}

- (void)dealloc
{
    [_scroll release];
    [_arrCity release];
    [super dealloc];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _arr1.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    Mycell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"re" forIndexPath:indexPath];
    
    cell.contentView.backgroundColor = [UIColor whiteColor];
    
    cell.myLabel.text = [[_arr1 objectAtIndex:indexPath.row]objectForKey:@"block_title"];
    
    NSURL *url = [NSURL URLWithString:[[_arr1 objectAtIndex:indexPath.row]objectForKey:@"pic"]];
    
    //   第三方颜色类  改变图标颜色
    
    cell.myImage.backgroundColor = [UIColor colorFromHexCode:[[_arr1 objectAtIndex:indexPath.row]objectForKey:@"block_color"]];
    
    [cell.myImage setImageWithURL:url];

    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ThirdFourViewController *thf = [[ThirdFourViewController alloc]init];
    
    thf.str = [[_arr1 objectAtIndex:indexPath.row]objectForKey:@"api_url"];
    
    thf.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:thf animated:YES completion:^{
        
    }];
    

}


- (void)getMap{
    CityViewController *city = [[CityViewController alloc]init];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:city animated:YES];
    self.hidesBottomBarWhenPushed = NO;
    [city release];
    
}



- (void)getWeather{

    SearchViewController *search = [[SearchViewController alloc]init];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:search animated:YES];
    self.hidesBottomBarWhenPushed = NO;
    [search release];

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
