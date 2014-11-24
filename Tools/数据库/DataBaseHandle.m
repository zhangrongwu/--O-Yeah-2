//
//  DataBaseHandle.m
//  Ui婚礼纪
//
//  Created by dlios on 14-8-28.
//  Copyright (c) 2014年 lanou3g.com 蓝鸥科技. All rights reserved.
//

#import "DataBaseHandle.h"

@implementation DataBaseHandle
+(DataBaseHandle *)shareInstance{
    static DataBaseHandle *dataBase = nil;
    if(dataBase == nil){
        dataBase = [[DataBaseHandle alloc]init];
    }
    return dataBase;
}
-(void)openDatabase{
    NSString *docpath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    NSString *dbpath = [docpath stringByAppendingPathComponent:@"image.db"];
    NSLog(@"%@", dbpath);
    int result = sqlite3_open([dbpath UTF8String], &dbPoint);
    NSLog(@"%d", result);
}
-(void)closeDatabase{
    int result = sqlite3_close(dbPoint);
    NSLog(@"%d",result);
}
-(void)createTable{
    NSString *sql = @"create table image(name text, id text primary key,  pid text)";
    int result = sqlite3_exec(dbPoint, [sql UTF8String], NULL, NULL, NULL);
    NSLog(@"%d", result);
}

-(void)insertTab:(NSString *)img idd:(NSString *)idd name:(NSString *)name{
    NSString *ins = [NSString stringWithFormat:@"insert into image values('%@', '%@', '%@')",img, idd, name];
    self.result = sqlite3_exec(dbPoint, [ins UTF8String], NULL, NULL, NULL);
    NSLog(@"%d", self.result);
    
}

-(void)dele:(NSString *)img{
    NSString *del = [NSString stringWithFormat:@"delete from image where name = '%@'", img];
    int result = sqlite3_exec(dbPoint, [del UTF8String], NULL, NULL, NULL);
    NSLog(@"%d",result);
}

- (NSMutableArray *)selectAll{
    NSMutableArray *allimg = [NSMutableArray array];
    NSString *sql = @"select * from image";
    sqlite3_stmt *stmt = nil;
    int result = sqlite3_prepare_v2(dbPoint, [sql UTF8String], -1, &stmt, nil);
    if(result == SQLITE_OK){
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            const unsigned char *namechar = sqlite3_column_text(stmt, 0);
            NSString *name = [NSString stringWithUTF8String:(const char *)namechar];
            [allimg addObject:name];
        }
    }
    sqlite3_finalize(stmt);
    return allimg;
}

- (NSMutableArray *)selectAll1{
    NSMutableArray *allimg = [NSMutableArray array];
    NSString *sql = @"select * from image";
    sqlite3_stmt *stmt = nil;
    int result = sqlite3_prepare_v2(dbPoint, [sql UTF8String], -1, &stmt, nil);
    if(result == SQLITE_OK){
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            const unsigned char *namechar = sqlite3_column_text(stmt, 2);
            NSString *pp = [NSString stringWithUTF8String:(const char *)namechar];
            [allimg addObject:pp];
        }
    }
    sqlite3_finalize(stmt);
    return allimg;
}

@end
