//
//  threeCell.m
//  iNews
//
//  Created by 赵东东 on 14-9-4.
//  Copyright (c) 2014年 test. All rights reserved.
//

#import "threeCell.h"

@implementation threeCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.title = [[UILabel alloc] init];
        //[_title setBackgroundColor:[UIColor blackColor]];
        [self.contentView addSubview:_title];
        _title.numberOfLines = 0;
        [_title release];
        
        self.from = [[UILabel alloc] init];
        [self.contentView addSubview:_from];
        [_from release];
        
        self.time = [[UILabel alloc] init];
        [self.contentView addSubview:_time];
        self.time.textAlignment = 1;
        [_time release];
        
        self.image1 = [[UIImageView alloc] init];
        [self.contentView addSubview:_image1];
        [_image1 release];
        
        self.image2 = [[UIImageView alloc] init];
        [self.contentView addSubview:_image2];
        [_image2 release];
        
        self.image3 = [[UIImageView alloc] init];
        [self.contentView addSubview:_image3];
        [_image3 release];
        
        
    }
    return self;
}
- (void)dealloc
{
    [_title release];
    [_time release];
    [_from release];
    [_image1 release];
    [_image2 release];
    [_image3 release];
    [super dealloc];
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.title.frame = CGRectMake(10, 10, 300, 30);
    self.from.frame = CGRectMake(10, 50, 150, 20);
    self.time.frame = CGRectMake(self.contentView.frame.size.width - 80, 50, 80, 20);
    self.image1.frame = CGRectMake(10, 80, 95, 80);
    self.image2.frame = CGRectMake(115, 80, 95, 80);
    self.image3.frame = CGRectMake(220, 80, 95, 80);
    
    
    
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
