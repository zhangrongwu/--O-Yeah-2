//
//  push.m
//  iNews
//
//  Created by 邹建敏 on 14-9-3.
//  Copyright (c) 2014年 test. All rights reserved.
//

#import "push.h"

@implementation push

- (void)dealloc
{
    [_time release];
    [_subtitle release];
    [_title release];
    [_pk release];
    [_weburl release];
    [super dealloc];
}
-(id)initWithDictionary:(NSDictionary *) dic
{
    self = [super init];
    if (self) {
        //系统当前时间
        //        NSDate *localeDate = [NSDate date];
        NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        // NSString *localeTime = [formatter stringFromDate:localeDate];
        // NSLog(@"enddate=%@",localeTime);
        
        //新闻发布时间
        NSString *newsTime = [dic objectForKey:@"time"];
        //NSLog(@"newsTime=%@",newsTime);
        
        //获取时间差
        NSDate *requestDate = [formatter dateFromString:newsTime];
        NSString *str = [push compareCurrentTime:requestDate];
        
        self.subtitle = [dic objectForKey:@"subtitle"];
        self.title = [dic objectForKey:@"title"];
        self.time = str;
        self.pk = [dic objectForKey:@"pk"];
        self.type = [dic objectForKey:@"type"];
        self.weburl = [[dic objectForKey:@"article"]objectForKey:@"weburl"];
        self.api_url = [[dic objectForKey:@"topic"] objectForKey:@"api_url"];
        [formatter release];
    }
    
    return self;
}
+(NSString *) compareCurrentTime:(NSDate*) compareDate
{
    NSTimeInterval  timeInterval = [compareDate timeIntervalSinceNow];
    timeInterval = -timeInterval;
    //NSLog(@"time == %f", timeInterval);
    long temp = 0;
    NSString *result;
    if (timeInterval < 60) {
        result = [NSString stringWithFormat:@"刚刚"];
    }
    else if((temp = timeInterval/60) <60){
        result = [NSString stringWithFormat:@"%ld分钟前",temp];
    }
    
    else if((temp = temp/60) <24){
        result = [NSString stringWithFormat:@"%ld小时前",temp];
    }
    
    else if((temp = temp/24) <30){
        result = [NSString stringWithFormat:@"%ld天前",temp];
    }
    
    else if((temp = temp/30) <12){
        result = [NSString stringWithFormat:@"%ld月前",temp];
    }
    else{
        temp = temp/12;
        result = [NSString stringWithFormat:@"%ld年前",temp];
    }
    
    return  result;
}


@end
