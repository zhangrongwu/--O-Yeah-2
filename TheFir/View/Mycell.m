//
//  Mycell.m
//  iNews
//
//  Created by 邹建敏 on 14-9-2.
//  Copyright (c) 2014年 test. All rights reserved.
//

#import "Mycell.h"

@implementation Mycell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.myImage = [[UIImageView alloc]initWithFrame:self.contentView.bounds];
        _myImage.backgroundColor = [UIColor magentaColor];
        [self.contentView addSubview:_myImage];
        [_myImage release];
        
        self.myLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 80, 106, 26)];
        _myLabel.textAlignment = 1;
        _myLabel.font = [UIFont boldSystemFontOfSize:15];
        [self.contentView addSubview:_myLabel];
        [_myLabel release];
        
    }
    return self;
}

- (void)dealloc
{
    [_myImage release];
    [_myLabel release];
    [super dealloc];
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
