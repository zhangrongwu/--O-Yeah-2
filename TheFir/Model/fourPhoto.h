//
//  fourPhoto.h
//  iNews
//
//  Created by 邹建敏 on 14-9-2.
//  Copyright (c) 2014年 test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface fourPhoto : NSObject


@property (nonatomic, retain)NSString *title;
@property (nonatomic, retain)NSString *image;


- (id)initWithDictionary:(NSDictionary *)dic;

@end
