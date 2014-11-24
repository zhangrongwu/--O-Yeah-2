//
//  fourPhoto.m
//  iNews
//
//  Created by 邹建敏 on 14-9-2.
//  Copyright (c) 2014年 test. All rights reserved.
//

#import "fourPhoto.h"

@implementation fourPhoto

- (void)dealloc
{
    [_image release];
    [_title release];
    [super dealloc];
}

- (id)initWithDictionary:(NSDictionary *)dic{
    
    self = [super init];
    if (self) {
        self.title = [dic objectForKey:@"title"];
        self.image = [dic objectForKey:@"promotion_img"];
    }
    
    return self;

}

@end
