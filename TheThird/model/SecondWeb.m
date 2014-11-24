//
//  SecondWeb.m
//  iNews
//
//  Created by 顾鸿飞 on 14-9-3.
//  Copyright (c) 2014年 test. All rights reserved.
//

#import "SecondWeb.h"

@implementation SecondWeb

- (void)dealloc
{
    [_title release];
    [_date release];
    [_auther_name release];
    [_weburl release];
    [_image release];
    [super dealloc];
}
- (id)initWithTitle:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        self.title = [dic objectForKey:@"title"];
        self.date = [dic objectForKey:@"data"];
        self.auther_name = [dic objectForKey:@"auther_name"];
        self.weburl = [dic objectForKey:@"weburl"];
        self.image = [[[dic objectForKey:@"media"] firstObject]objectForKey:@"url"];
        self.pk = [dic objectForKey:@"pk"];
        
        self.n = arc4random() % 3;
    }
    return self;
}


@end
