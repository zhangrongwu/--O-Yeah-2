//
//  DataBaseHandle.h
//  Ui婚礼纪
//
//  Created by dlios on 14-8-28.
//  Copyright (c) 2014年 lanou3g.com 蓝鸥科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
@interface DataBaseHandle : NSObject{
    sqlite3 *dbPoint;
}

@property (nonatomic, assign)NSInteger result;

+(DataBaseHandle *)shareInstance;
-(void)openDatabase;
-(void)closeDatabase;
-(void)createTable;
-(void)insertTab:(NSString *)img idd:(NSString *)idd name:(NSString *)name;
-(void)dele:(NSString *)img;
-(NSMutableArray *)selectAll;
-(NSMutableArray *)selectAll1;

@end
