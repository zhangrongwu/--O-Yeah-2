//
//  News.h
//  iNews
//
//  Created by 赵东东 on 14-9-4.
//  Copyright (c) 2014年 test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface News : NSObject
@property(nonatomic, retain)NSString *name;//标题
@property(nonatomic, retain)NSString *from ;//来源
@property(nonatomic, retain)NSString *time;//时间
@property(nonatomic, retain)NSMutableArray *picture;//图片
@property(nonatomic, retain)NSString *content;//内容
@property(nonatomic, retain)NSString *pk;

-(id)initWithDictionary:(NSDictionary *) dic;
@end
