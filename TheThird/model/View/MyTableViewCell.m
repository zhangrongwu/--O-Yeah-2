//
//  MyTableViewCell.m
//  iNews
//
//  Created by 顾鸿飞 on 14-9-5.
//  Copyright (c) 2014年 test. All rights reserved.
//

#import "MyTableViewCell.h"

@implementation MyTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        self.myImageView = [[UIImageView alloc] init];
        //        _myImageView.backgroundColor = [UIColor colorWithRed:150.0/255 green:90.0/255 blue:130.0/255 alpha:1];
        
        [self.contentView addSubview:_myImageView];
        [_myImageView release];
        
        self.myLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_myLabel];
        [_myLabel release];
        
        self.myLabel1 = [[UILabel alloc] init];
        [self.contentView addSubview:_myLabel1];
        _myLabel1.font = [UIFont boldSystemFontOfSize:12];
        [_myLabel1 release];
        
    }
    return self;
}
- (void)dealloc
{
    [_myImageView release];
    [_myLabel release];
    [_myLabel1 release];
    [super dealloc];
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat x = self.contentView.frame.size.width;
    CGFloat y = self.contentView.frame.size.height;
    
    _myImageView.frame = CGRectMake(10, 10, y-20, y-20);
    [_myImageView setClipsToBounds:YES];
    [_myImageView.layer setCornerRadius:_myImageView.frame.size.width/2.0];
    _myLabel.frame = CGRectMake(y+20, 0, x-y-20, y/3*2);
    
    _myLabel1.frame = CGRectMake(y+20, y/3*2-10, x-y-20, y/3);
    
}
- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
