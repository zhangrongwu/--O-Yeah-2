//
//  SecondWeb.h
//  iNews
//
//  Created by 顾鸿飞 on 14-9-3.
//  Copyright (c) 2014年 test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SecondWeb : NSObject

@property (nonatomic, retain)NSString *title;

@property (nonatomic, retain)NSString *auther_name;

@property (nonatomic, retain)NSString *date;

@property (nonatomic, retain)NSString *weburl;

@property (nonatomic, retain)NSString *image;

@property (nonatomic, retain)NSString *pk;

@property (nonatomic, assign)int n;

- (id)initWithTitle:(NSDictionary *)dic;

@end
