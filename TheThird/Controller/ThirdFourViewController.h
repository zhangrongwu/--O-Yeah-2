//
//  ThirdFourViewController.h
//  iNews
//
//  Created by 顾鸿飞 on 14-9-3.
//  Copyright (c) 2014年 test. All rights reserved.
//

#import "BaseViewController.h"

@interface ThirdFourViewController : BaseViewController <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, retain)NSString *str;

@property (nonatomic, retain)NSString *str1;

@property (nonatomic, retain)NSString *str2;

@property (nonatomic, retain)NSMutableArray *arr;

@property (nonatomic, retain)NSMutableArray *arr1;

@property (nonatomic, retain)UICollectionView *collectionView;

//@property (nonatomic, retain)UICollectionView *collectionView1;

@property (nonatomic, retain)UITapGestureRecognizer *tap;

@property (nonatomic, retain)UITapGestureRecognizer *tap1;

@property (nonatomic, retain)UITapGestureRecognizer *tap2;

@property (nonatomic, retain)UITapGestureRecognizer *tap3;

@property (nonatomic, retain)UITapGestureRecognizer *tap4;

@property (nonatomic, retain)UITapGestureRecognizer *tap5;
@end
