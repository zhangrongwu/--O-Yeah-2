//
//  FirthWeb.h
//  iNews
//
//  Created by 顾鸿飞 on 14-9-3.
//  Copyright (c) 2014年 test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FirthWeb : NSObject

//精选

@property (nonatomic, retain)NSString *title;

@property (nonatomic, retain)NSString *stitle;

@property (nonatomic, retain)NSString *pic;

@property (nonatomic, retain)NSString *api_url;

@property (nonatomic, retain)NSString *block_color;

- (id)initWithDictionary:(NSDictionary *)dic;
@end
