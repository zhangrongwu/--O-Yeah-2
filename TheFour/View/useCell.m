//
//  useCell.m
//  iNews
//
//  Created by 邹建敏 on 14-9-3.
//  Copyright (c) 2014年 test. All rights reserved.
//

#import "useCell.h"

@implementation useCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        self.image = [[UIImageView alloc] init];

        [self.contentView addSubview:_image];
        [_image release];
        self.auther_name = [[UILabel alloc] init];

        [self.contentView addSubview:_auther_name];
        [_auther_name release];
        self.subtitle = [[UILabel alloc] init];
        _subtitle.font = [UIFont boldSystemFontOfSize:12];

        [self.contentView addSubview:_subtitle];
        [_subtitle release];

        
    }
    return self;
}

- (void)dealloc
{
    [_image release];
    [_auther_name release];
    [_subtitle release];
    [super dealloc];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.image.frame = CGRectMake(10, 10, 40, 40);
    self.auther_name.frame = CGRectMake(65, 10, 150, 20);
    self.subtitle.frame = CGRectMake(65, 35, 300, 20);
    
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
