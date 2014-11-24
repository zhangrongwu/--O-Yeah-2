//
//  pushCell.m
//  iNews
//
//  Created by 邹建敏 on 14-9-3.
//  Copyright (c) 2014年 test. All rights reserved.
//

#import "pushCell.h"

@implementation pushCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        self.title = [[UILabel alloc]init];
        //[_title setBackgroundColor:[UIColor greenColor]];
        [self.contentView addSubview:_title];
        _title.font = [UIFont boldSystemFontOfSize:17];
        _title.textColor = [UIColor redColor];
        [_title release];
        
        self.time = [[UILabel alloc] init];
        [_time setBackgroundColor:[UIColor clearColor]];
        _time.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:_time];
        [_time release];
        
        
        self.label = [[UILabel alloc]init];
        _label.numberOfLines = 3;
        _label.font = [UIFont fontWithName:nil size:14];
        [self.contentView addSubview:_label];
        [_label release];
        
        
    }
    return self;
}

- (void)dealloc
{
    [_title release];
    [_time release];
    [_label release];
    [super dealloc];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.title.frame = CGRectMake(10, 10, 150, 20);
    self.time.frame = CGRectMake(self.contentView.frame.size.width - 90, 10, 80, 20);
    self.time.textAlignment = 1;
    self.label.frame = CGRectMake(10, 30, 300, 60);
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
