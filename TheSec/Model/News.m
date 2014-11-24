//
//  News.m
//  iNews
//
//  Created by 赵东东 on 14-9-4.
//  Copyright (c) 2014年 test. All rights reserved.
//

#import "News.h"

@implementation News
- (void)dealloc
{
    [_name release];
    [_time release];
    [_from release];
    [_picture release];
    [_content release];
    [_pk release];
    
    [super dealloc];
}
-(id)initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        //系统当前时间
//        NSDate *localeDate = [NSDate date];
        NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        //  NSString *localeTime = [formatter stringFromDate:localeDate];
        
        //新闻发布时间
        NSString *newsTime = [dic objectForKey:@"date"];
        
        
        //获取时间差
        NSDate *requestDate = [formatter dateFromString:newsTime];
        NSString *str = [News compareCurrentTime:requestDate];
        
        self.name = [dic objectForKey:@"title"];
        self.time = str;
        self.from = [dic objectForKey:@"auther_name"];
        self.picture = [dic objectForKey:@"thumbnail_medias"];
        self.content = [dic objectForKey:@"weburl"];
        
        self.pk = [dic objectForKey:@"pk"];
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


