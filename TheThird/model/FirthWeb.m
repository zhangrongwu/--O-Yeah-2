//
//  FirthWeb.m
//  iNews
//
//  Created by 顾鸿飞 on 14-9-3.
//  Copyright (c) 2014年 test. All rights reserved.
//

#import "FirthWeb.h"

@implementation FirthWeb

- (void)dealloc
{
    [_stitle release];
    [_title release];
    [_pic release];
    [_api_url release];
    [_block_color release];
    
    [super dealloc];
}
-(id)initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        
        self.title = [[dic objectForKey:@"block_info"]objectForKey:@"title"];
        self.stitle = [[dic objectForKey:@"block_info"]objectForKey:@"stitle"];
        self.pic = [[dic objectForKey:@"block_info"] objectForKey:@"large_pic"];
        self.api_url = [[dic objectForKey:@"block_info"] objectForKey:@"api_url"];
        self.block_color = [[dic objectForKey:@"block_info"] objectForKey:@"block_color"];
    }
    return self;
}
@end
