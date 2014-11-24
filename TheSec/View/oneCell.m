//
//  oneCell.m
//  iNews
//
//  Created by 赵东东 on 14-9-4.
//  Copyright (c) 2014年 test. All rights reserved.
//

#import "oneCell.h"

@implementation oneCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.title = [[UILabel alloc] init];
        [self.contentView addSubview:_title];
        _title.numberOfLines = 0;
        [_title release];
        
        self.time = [[UILabel alloc] init];
        [self.contentView addSubview:_time];
        self.time.textAlignment = 1;
        [_time release];
        
        self.from = [[UILabel alloc] init];
        [self.contentView addSubview:_from];
        [_from release];
        
        self.image = [[UIImageView alloc] init];
        [self.contentView addSubview:_image];
        [_image release];
        
    }
    return self;
}
- (void)dealloc
{
    [_title release];
    [_time release];
    [_from release];
    [_image release];
    [super dealloc];
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.title.frame = CGRectMake(10, 10, 200, 60);
    self.from.frame = CGRectMake(10, 80, 150, 20);
    self.time.frame = CGRectMake(self.contentView.frame.size.width - 200, 80, 80, 20);
    self.image.frame = CGRectMake(210, 15, 100, 100);
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
