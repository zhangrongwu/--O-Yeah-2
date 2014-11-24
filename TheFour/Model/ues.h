//
//  ues.h
//  iNews
//
//  Created by 邹建敏 on 14-9-3.
//  Copyright (c) 2014年 test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ues : NSObject

@property(nonatomic, retain)NSString *pk;//Id
@property(nonatomic, retain)NSString *auther_name;//title
@property(nonatomic, retain)NSString *content;//lable
@property(nonatomic, retain)NSString *auther_icon;//图片
@property(nonatomic, retain)NSString *weburl;
-(id)initWithDictionary:(NSDictionary *) dic;

@end
