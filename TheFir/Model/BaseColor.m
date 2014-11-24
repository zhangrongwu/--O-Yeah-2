//
//  BaseColor.m
//  iNews
//
//  Created by 邹建敏 on 14-9-3.
//  Copyright (c) 2014年 test. All rights reserved.
//

#import "BaseColor.h"

static BaseColor *manager = nil;

@implementation BaseColor

+(BaseColor *)baseColor{
    if (!manager) {
        manager = [[BaseColor alloc]init];
    }
    return manager;
}

@end
