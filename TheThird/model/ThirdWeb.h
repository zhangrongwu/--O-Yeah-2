//
//  ThirdWeb.h
//  iNews
//
//  Created by 顾鸿飞 on 14-9-9.
//  Copyright (c) 2014年 test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ThirdWeb : NSObject

@property (nonatomic, retain) NSString *title;

@property (nonatomic, retain) NSString *stitle;

@property (nonatomic, retain) NSString *large_pic;

@property (nonatomic, retain) NSString *api_url;

@property (nonatomic, retain) NSString *block_color;

- (id) initWithDic:(NSDictionary *)dic;

@end
