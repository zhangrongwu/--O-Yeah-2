//
//  ThirdFourViewController.m
//  iNews
//
//  Created by 顾鸿飞 on 14-9-3.
//  Copyright (c) 2014年 test. All rights reserved.
//

#import "ThirdFourViewController.h"
#import "UIImageView+WebCache.h"
#import "SecondWeb.h"
#import "MyCollectionViewCell.h"
#import "ThirdFiveViewController.h"
#import "MyTwoCollectionViewCell.h"
#import "MyThreeCollectionViewCell.h"

@interface ThirdFourViewController ()

@end

@implementation ThirdFourViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.str = [[NSString alloc] init];
        self.str1 = [[NSString alloc] init];
        self.str2 = [[NSString alloc] init];
        self.arr = [NSMutableArray array];
        self.arr1 = [NSMutableArray array];
    }
    return self;
}
- (void)dealloc
{
    [_str release];
    [_str1 release];
    [_str2 release];
    [_arr release];
    [_arr1 release];
    [_collectionView release];
    [super dealloc];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(0, self.view.frame.size.height - 35, self.view.frame.size.width, 33);
    [button setTitle:@"返回上一页" forState:0];
    button.backgroundColor = [UIColor whiteColor];
    button.tintColor = [UIColor blueColor];
    [button addTarget:self action:@selector(tapAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:self.str parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *dic = [responseObject objectForKey:@"data"];
        self.str1 = [[[[[dic objectForKey:@"ipadconfig"] objectForKey:@"pages"] firstObject] objectForKey:@"diy"]objectForKey:@"bgimage_url"];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20, 320, 64)];
        NSURL *url = [NSURL URLWithString:_str1];
        [imageView setImageWithURL:url];
        [self.view addSubview: imageView];
        [imageView release];

        NSArray *arr = [[responseObject objectForKey:@"data"] objectForKey:@"articles"];
        
        for (int j = 0 ; j < arr.count / 6; j++) {
            NSMutableArray *arr1 = [NSMutableArray array];
            for (int i = 0 + j * 6; i < 6 + j * 6; i++) {
                NSDictionary *dic1 = [arr objectAtIndex:i];
                SecondWeb *secondWeb = [[SecondWeb alloc] initWithTitle:dic1];
                [arr1 addObject:secondWeb];
            }
            [_arr addObject:arr1];
        }
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height - 80 - 35);
        layout.minimumInteritemSpacing = 0;
        layout.minimumLineSpacing = 0;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        
        
        self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 74, self.view.frame.size.width, self.view.frame.size.height - 80 - 35) collectionViewLayout:layout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        
 
        _collectionView.pagingEnabled = YES;
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerClass:[MyCollectionViewCell class] forCellWithReuseIdentifier:@"reuse"];
        [_collectionView registerClass:[MyTwoCollectionViewCell class] forCellWithReuseIdentifier:@"reuse2"];
        [_collectionView registerClass:[MyThreeCollectionViewCell class] forCellWithReuseIdentifier:@"reuse3"];
        
        [_collectionView reloadData];
        
        [self.view addSubview:_collectionView];
        [_collectionView release];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    }];
    
}

- (void)tapAction:(UITapGestureRecognizer *)tap
{
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return _arr.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SecondWeb *arc4random = [[self.arr objectAtIndex:indexPath.row] objectAtIndex:0];
    
    if (arc4random.n == 0) {
        MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"reuse" forIndexPath:indexPath];
        
        self.arr1 = [_arr objectAtIndex:indexPath.row];
        NSArray *arr = [_arr objectAtIndex:indexPath.row];
        
        
        
        SecondWeb *sec0 = [arr objectAtIndex:0];
        NSURL *url = [NSURL URLWithString:sec0.image];
        [cell.myImageView setImageWithURL:url];
        cell.myLabel.text = sec0.title;
        self.tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction1:)];
        [cell.myImageView addGestureRecognizer:self.tap];
        //打开imageView的用户交互
        [cell.myImageView setUserInteractionEnabled:YES];
        
        
        
        SecondWeb *sec1 = [arr objectAtIndex:1];
        cell.myLabel1.text = sec1.title;
        cell.myLabel2.text = sec1.auther_name;
        self.tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction1:)];
        [cell.myLabel1 addGestureRecognizer:self.tap1];
        //打开imageView的用户交互
        [cell.myLabel1 setUserInteractionEnabled:YES];
        
        
        SecondWeb *sec2 = [arr objectAtIndex:2];
        cell.myLabel3.text = sec2.title;
        cell.myLabel4.text = sec2.auther_name;
        self.tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction1:)];
        [cell.myLabel3 addGestureRecognizer:self.tap2];
        //打开imageView的用户交互
        [cell.myLabel3 setUserInteractionEnabled:YES];
        
        SecondWeb *sec3 = [arr objectAtIndex:3];
        cell.myLabel5.text = sec3.title;
        cell.myLabel6.text = sec3.auther_name;
        self.tap3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction1:)];
        [cell.myLabel5 addGestureRecognizer:self.tap3];
        //打开imageView的用户交互
        [cell.myLabel5 setUserInteractionEnabled:YES];
        
        
        
        SecondWeb *sec4 = [arr objectAtIndex:4];
        cell.myLabel7.text = sec4.title;
        cell.myLabel8.text = sec4.auther_name;
        self.tap4 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction1:)];
        [cell.myLabel7 addGestureRecognizer:self.tap4];
        //打开imageView的用户交互
        [cell.myLabel7 setUserInteractionEnabled:YES];
        
        
        SecondWeb *sec5 = [arr objectAtIndex:5];
        cell.myLabel9.text = sec5.title;
        cell.myLabel10.text = sec5.auther_name;
        self.tap5 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction1:)];
        [cell.myLabel9 addGestureRecognizer:self.tap5];
        //打开imageView的用户交互
        [cell.myLabel9 setUserInteractionEnabled:YES];
        
        return cell;
    } else if (arc4random.n == 1) {
        MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"reuse2" forIndexPath:indexPath];
        
        self.arr1 = [_arr objectAtIndex:indexPath.row];
        NSArray *arr = [_arr objectAtIndex:indexPath.row];
        SecondWeb *sec0 = [arr objectAtIndex:0];
        NSURL *url = [NSURL URLWithString:sec0.image];
        [cell.myImageView setImageWithURL:url];
        cell.myLabel.text = sec0.title;
        self.tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction1:)];
        [cell.myImageView addGestureRecognizer:self.tap];
        //打开imageView的用户交互
        [cell.myImageView setUserInteractionEnabled:YES];
        
        
        
        SecondWeb *sec1 = [arr objectAtIndex:1];
        cell.myLabel1.text = sec1.title;
        cell.myLabel2.text = sec1.auther_name;
        self.tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction1:)];
        [cell.myLabel1 addGestureRecognizer:self.tap1];
        //打开imageView的用户交互
        [cell.myLabel1 setUserInteractionEnabled:YES];
        
        
        SecondWeb *sec2 = [arr objectAtIndex:2];
        cell.myLabel3.text = sec2.title;
        cell.myLabel4.text = sec2.auther_name;
        self.tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction1:)];
        [cell.myLabel3 addGestureRecognizer:self.tap2];
        //打开imageView的用户交互
        [cell.myLabel3 setUserInteractionEnabled:YES];
        
        SecondWeb *sec3 = [arr objectAtIndex:3];
        cell.myLabel5.text = sec3.title;
        cell.myLabel6.text = sec3.auther_name;
        self.tap3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction1:)];
        [cell.myLabel5 addGestureRecognizer:self.tap3];
        //打开imageView的用户交互
        [cell.myLabel5 setUserInteractionEnabled:YES];
        
        
        
        SecondWeb *sec4 = [arr objectAtIndex:4];
        cell.myLabel7.text = sec4.title;
        cell.myLabel8.text = sec4.auther_name;
        self.tap4 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction1:)];
        [cell.myLabel7 addGestureRecognizer:self.tap4];
        //打开imageView的用户交互
        [cell.myLabel7 setUserInteractionEnabled:YES];
        
        
        SecondWeb *sec5 = [arr objectAtIndex:5];
        cell.myLabel9.text = sec5.title;
        cell.myLabel10.text = sec5.auther_name;
        self.tap5 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction1:)];
        [cell.myLabel9 addGestureRecognizer:self.tap5];
        //打开imageView的用户交互
        [cell.myLabel9 setUserInteractionEnabled:YES];
        
        return cell;
    } else if (arc4random.n == 2) {
        MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"reuse3" forIndexPath:indexPath];
        
        self.arr1 = [_arr objectAtIndex:indexPath.row];
        NSArray *arr = [_arr objectAtIndex:indexPath.row];
        SecondWeb *sec0 = [arr objectAtIndex:0];
        NSURL *url = [NSURL URLWithString:sec0.image];
        [cell.myImageView setImageWithURL:url];
        cell.myLabel.text = sec0.title;
        self.tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction1:)];
        [cell.myImageView addGestureRecognizer:self.tap];
        //打开imageView的用户交互
        [cell.myImageView setUserInteractionEnabled:YES];
        
        
        
        SecondWeb *sec1 = [arr objectAtIndex:1];
        cell.myLabel1.text = sec1.title;
        cell.myLabel2.text = sec1.auther_name;
        self.tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction1:)];
        [cell.myLabel1 addGestureRecognizer:self.tap1];
        //打开imageView的用户交互
        [cell.myLabel1 setUserInteractionEnabled:YES];
        
        
        SecondWeb *sec2 = [arr objectAtIndex:2];
        cell.myLabel3.text = sec2.title;
        cell.myLabel4.text = sec2.auther_name;
        self.tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction1:)];
        [cell.myLabel3 addGestureRecognizer:self.tap2];
        //打开imageView的用户交互
        [cell.myLabel3 setUserInteractionEnabled:YES];
        
        SecondWeb *sec3 = [arr objectAtIndex:3];
        cell.myLabel5.text = sec3.title;
        cell.myLabel6.text = sec3.auther_name;
        self.tap3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction1:)];
        [cell.myLabel5 addGestureRecognizer:self.tap3];
        //打开imageView的用户交互
        [cell.myLabel5 setUserInteractionEnabled:YES];
        
        
        
        SecondWeb *sec4 = [arr objectAtIndex:4];
        cell.myLabel7.text = sec4.title;
        cell.myLabel8.text = sec4.auther_name;
        self.tap4 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction1:)];
        [cell.myLabel7 addGestureRecognizer:self.tap4];
        //打开imageView的用户交互
        [cell.myLabel7 setUserInteractionEnabled:YES];
        
        
        SecondWeb *sec5 = [arr objectAtIndex:5];
        cell.myLabel9.text = sec5.title;
        cell.myLabel10.text = sec5.auther_name;
        self.tap5 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction1:)];
        [cell.myLabel9 addGestureRecognizer:self.tap5];
        //打开imageView的用户交互
        [cell.myLabel9 setUserInteractionEnabled:YES];
        
        return cell;
    }
    return nil;
    
}

- (void)tapAction1:(UITapGestureRecognizer *)tap
{
    if (tap == _tap) {
        ThirdFiveViewController *thirdFive = [[ThirdFiveViewController alloc] init];
        SecondWeb  *secondWeb = [_arr1 objectAtIndex:0];
        thirdFive.str = secondWeb.weburl;
        thirdFive.dataTitle = secondWeb.title;
        thirdFive.dataId = secondWeb.pk;
        thirdFive.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentViewController:thirdFive animated:YES completion:^{
        }];
    } else if (tap == _tap1) {
        ThirdFiveViewController *thirdFive = [[ThirdFiveViewController alloc] init];
        SecondWeb  *secondWeb = [_arr1 objectAtIndex:1];
        thirdFive.str = secondWeb.weburl;
        thirdFive.dataTitle = secondWeb.title;
        thirdFive.dataId = secondWeb.pk;
        thirdFive.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentViewController:thirdFive animated:YES completion:^{
        }];
    } else if (tap == _tap2) {
        ThirdFiveViewController *thirdFive = [[ThirdFiveViewController alloc] init];
        SecondWeb  *secondWeb = [_arr1 objectAtIndex:2];
        thirdFive.str = secondWeb.weburl;
        thirdFive.dataTitle = secondWeb.title;
        thirdFive.dataId = secondWeb.pk;
        thirdFive.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentViewController:thirdFive animated:YES completion:^{
        }];
    }  else if (tap == _tap3) {
        ThirdFiveViewController *thirdFive = [[ThirdFiveViewController alloc] init];
        SecondWeb  *secondWeb = [_arr1 objectAtIndex:3];
        thirdFive.str = secondWeb.weburl;
        thirdFive.dataTitle = secondWeb.title;
        thirdFive.dataId = secondWeb.pk;
        thirdFive.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentViewController:thirdFive animated:YES completion:^{
        }];
    }  else if (tap == _tap4) {
        ThirdFiveViewController *thirdFive = [[ThirdFiveViewController alloc] init];
        SecondWeb  *secondWeb = [_arr1 objectAtIndex:4];
        thirdFive.str = secondWeb.weburl;
        thirdFive.dataTitle = secondWeb.title;
        thirdFive.dataId = secondWeb.pk;
        thirdFive.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentViewController:thirdFive animated:YES completion:^{
        }];
    }  else if (tap == _tap5) {
        ThirdFiveViewController *thirdFive = [[ThirdFiveViewController alloc] init];
        SecondWeb  *secondWeb = [_arr1 objectAtIndex:5];
        thirdFive.str = secondWeb.weburl;
        thirdFive.dataTitle = secondWeb.title;
        thirdFive.dataId = secondWeb.pk;
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
