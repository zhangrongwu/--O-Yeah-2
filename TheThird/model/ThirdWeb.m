//
//  ThirdWeb.m
//  iNews
//
//  Created by 顾鸿飞 on 14-9-9.
//  Copyright (c) 2014年 test. All rights reserved.
//

#import "ThirdWeb.h"

@implementation ThirdWeb

- (void)dealloc
{
    [_title release];
    [_stitle release];
    [_large_pic release];
    [_api_url release];
    [_block_color release];
    [super dealloc];
}

-(id)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        self.title = [dic objectForKey:@"title"];
        self.stitle = [dic objectForKey:@"stitle"];
        self.large_pic = [dic objectForKey:@"large_pic"];
        self.api_url = [dic objectForKey:@"api_url"];
        self.block_color = [dic objectForKey:@"block_color"];
    }
    return self;
}


@end
