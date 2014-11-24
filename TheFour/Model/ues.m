//
//  ues.m
//  iNews
//
//  Created by 邹建敏 on 14-9-3.
//  Copyright (c) 2014年 test. All rights reserved.
//

#import "ues.h"

@implementation ues

- (void)dealloc
{
    [_pk release];
    [_auther_icon release];
    [_auther_name release];
    [_content release];
    [_weburl release];
    [super dealloc];
}
-(id)initWithDictionary:(NSDictionary *) dic
{
    self = [super init];
    if (self) {
        self.auther_icon = [dic objectForKey:@"auther_icon"];
        self.auther_name = [dic objectForKey:@"auther_name"];
        self.content = [dic objectForKey:@"content"];
        self.pk = [dic objectForKey:@"pk"];
        self.weburl = [dic objectForKey:@"weburl"];
    }
    return self;
    
    
}

@end
