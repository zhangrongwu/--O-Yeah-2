//
//  MyTwoCollectionViewCell.m
//  iNews
//
//  Created by 顾鸿飞 on 14-9-10.
//  Copyright (c) 2014年 test. All rights reserved.
//

#import "MyTwoCollectionViewCell.h"

@implementation MyTwoCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.myImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_myImageView];
        [_myImageView release];
        self.myLabel = [[UILabel alloc] init];
        _myLabel.backgroundColor = [UIColor clearColor];
        _myLabel.font = [UIFont boldSystemFontOfSize:15];
        [_myImageView addSubview:_myLabel];
        _myLabel.textColor = [UIColor whiteColor];
        [_myLabel release];
        
        self.myLabel1 = [[UILabel alloc] init];
        [self.contentView addSubview:_myLabel1];
        _myLabel1.font = [UIFont boldSystemFontOfSize:15];
        _myLabel1.textAlignment = 1;
        _myLabel1.numberOfLines = 2;
        
        _myLabel1.layer.borderWidth = 1;
        _myLabel1.layer.borderColor = [[UIColor blackColor]CGColor];
        [_myLabel1 release];
        
        self.myLabel2 = [[UILabel alloc]init];
        [_myLabel1 addSubview:_myLabel2];
        _myLabel2.textAlignment = 1;
        _myLabel2.font = [UIFont boldSystemFontOfSize:10];
        
        [_myLabel2 release];
        
        self.myLabel3 = [[UILabel alloc] init];
        [self.contentView addSubview:_myLabel3];
        _myLabel3.font = [UIFont boldSystemFontOfSize:15];
        _myLabel3.textAlignment = 1;
        _myLabel3.numberOfLines = 2;
        _myLabel3.layer.borderWidth = 1;
        _myLabel3.layer.borderColor = [[UIColor blackColor]CGColor];
        [_myLabel3 release];
        
        
        self.myLabel4 = [[UILabel alloc]init];
        _myLabel4.font = [UIFont boldSystemFontOfSize:10];
        _myLabel4.textAlignment = 1;
        [_myLabel3 addSubview:_myLabel4];
        [_myLabel4 release];
        
        self.myLabel5 = [[UILabel alloc] init];
        [self.contentView addSubview:_myLabel5];
        _myLabel5.font = [UIFont boldSystemFontOfSize:15];
        _myLabel5.textAlignment = 1;
        _myLabel5.numberOfLines = 2;
        _myLabel5.layer.borderWidth = 1;
        _myLabel5.layer.borderColor = [[UIColor blackColor]CGColor];
        [_myLabel5 release];
        
        
        self.myLabel6 = [[UILabel alloc]init];
        [_myLabel5 addSubview:_myLabel6];
        _myLabel6.textAlignment = 1;
        _myLabel6.font = [UIFont boldSystemFontOfSize:10];
        [_myLabel6 release];
        
        
        self.myLabel7 = [[UILabel alloc] init];
        [self.contentView addSubview:_myLabel7];
        _myLabel7.font = [UIFont boldSystemFontOfSize:15];
        _myLabel7.textAlignment = 1;
        _myLabel7.numberOfLines = 2;
        _myLabel7.layer.borderWidth = 1;
        _myLabel7.layer.borderColor = [[UIColor blackColor]CGColor];
        
        [_myLabel7 release];
        
        
        
        self.myLabel8 = [[UILabel alloc]init];
        [_myLabel7 addSubview:_myLabel8];
        _myLabel8.textAlignment = 1;
        _myLabel8.font = [UIFont boldSystemFontOfSize:10];
        [_myLabel8 release];
        
        self.myLabel9 = [[UILabel alloc] init];
        _myLabel9.font = [UIFont boldSystemFontOfSize:15];
        [self.contentView addSubview:_myLabel9];
        _myLabel9.textAlignment = 1;
        _myLabel9.numberOfLines = 2;
        _myLabel9.layer.borderWidth = 1;
        _myLabel9.layer.borderColor = [[UIColor blackColor]CGColor];
        [_myLabel9 release];
        
        
        self.myLabel10 = [[UILabel alloc]init];
        [_myLabel9 addSubview:_myLabel10];
        _myLabel10.textAlignment = 1;
        _myLabel10.font = [UIFont boldSystemFontOfSize:10];
        [_myLabel10 release];
    }
    return self;
}

- (void)dealloc
{
    [_myImageView release];
    [_myLabel release];
    [_myLabel1 release];
    [_myLabel10 release];
    [_myLabel2 release];
    [_myLabel3 release];
    [_myLabel4 release];
    [_myLabel5 release];
    [_myLabel6 release];
    [_myLabel7 release];
    [_myLabel8 release];
    [_myLabel9 release];
    [super dealloc];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat x = self.contentView.frame.size.width;
    CGFloat y = self.contentView.frame.size.height;
    
    _myImageView.frame = CGRectMake(0, 0, x, y*2/5);
    _myLabel.frame = CGRectMake(0, y*2/5-20, x, 20);
    
    
    _myLabel1.frame = CGRectMake(0, y*2/5, x/2+ 0.5, y*1/5);
    _myLabel2.frame = CGRectMake(0, y*1/5-20, x/2+ 0.5, 20);
    
    _myLabel3.frame = CGRectMake(x/2+1, y*2/5, x/2+ 0.5, y*1/5);
    _myLabel4.frame = CGRectMake(0, y*1/5-20, x/2+ 0.5, 20);
    
    _myLabel5.frame = CGRectMake(0, y*4/5, x/2+ 0.5, y*1/5);
    _myLabel6.frame = CGRectMake(0, y*1/5-20, x/2+ 0.5, 20);
    
    _myLabel7.frame = CGRectMake(x/2+1, y*4/5, x/2+ 0.5, y*1/5);
    _myLabel8.frame = CGRectMake(0, y*1/5-20, x/2+ 0.5, 20);
    
    _myLabel9.frame = CGRectMake(0, y*3/5, x, y*1/5);
    _myLabel10.frame = CGRectMake(0, y*1/5-20, x, 20);
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end
