//
//  LoginCell.m
//  iNews
//
//  Created by 邹建敏 on 14-9-11.
//  Copyright (c) 2014年 test. All rights reserved.
//

#import "LoginCell.h"

@implementation LoginCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        self.myView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 50, 50)];
        [self.contentView addSubview:self.myView];
        [_myView release];
        
        self.label1 = [[UILabel alloc]initWithFrame:CGRectMake(70, 10, 160, 50)];
        [self.contentView addSubview:_label1];
        [_label1 release];
        
        self.button = [UIButton buttonWithType:UIButtonTypeSystem];
        _button.frame = CGRectMake(260, 10, 50, 50);
        [self.contentView addSubview:_button];
        
        
        
    }
    return self;
}


- (void)dealloc
{
    [_myView release];
    [_label1 release];
    [_button release];
    [super dealloc];
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
