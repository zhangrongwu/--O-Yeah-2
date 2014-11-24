//
//  push.h
//  iNews
//
//  Created by 邹建敏 on 14-9-3.
//  Copyright (c) 2014年 test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface push : NSObject

@property(nonatomic, retain)NSString *subtitle;//小标题
@property(nonatomic, retain)NSString *title;//大标题
@property(nonatomic, retain)NSString *pk;//ID
@property(nonatomic, retain)NSString *time;//时间
@property(nonatomic, retain)NSString *type;//判断推出哪个页面
@property(nonatomic, retain)NSString *weburl;//推出weburl
@property(nonatomic, retain)NSString *api_url;//推出MainPushInVC
-(id)initWithDictionary:(NSDictionary *) dic;

@end
