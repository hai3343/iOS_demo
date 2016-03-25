//
//  DatabaseMamger.m
//  MVPTest
//
//  Created by yik on 16/3/4.
//  Copyright © 2016年 jzg. All rights reserved.
//

#import "DatabaseMamger.h"
#import "FMDatabase.h"
#import "UserModel.h"
#import <SVProgressHUD.h>
@interface DatabaseMamger()<NSCopying>

@end
@implementation DatabaseMamger
- (instancetype)init
{
    if (self = [super init]) {
        queue = [[FMDatabaseQueue alloc] initWithPath:[self path]];
        [self createTable];
    }
    return self;

}
- (NSString*)path
{

    return [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"UserList.db"];

}
static DatabaseMamger* _mamger = nil;
+ (DatabaseMamger*)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _mamger = [[DatabaseMamger alloc]init];
    });
    return _mamger;
    
}
+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _mamger = [super allocWithZone:zone];
    });
    return _mamger;
}
- (instancetype)copyWithZone:(NSZone *)zone
{
    return [DatabaseMamger shareInstance];

}







- (void)createTable
{
    NSString *sql = @"create table if not exists UserList(user_id integer primary key autoincrement,name text,age text)";
    [queue inDatabase:^(FMDatabase *db) {
        if (![db executeUpdate:sql]) {
            NSLog(@"数据库创建失败");

        }
    }];
    
}

- (void)insertData:(UserModel *)model
{
NSString *sql = @"insert into UserList (name,age) values(?,?)";
    
    [queue inDatabase:^(FMDatabase *db) {
        if (![db executeUpdate:sql,model.name,model.age]) {
            NSLog(@"数据插入失败");
        }
    }];



}

- (NSMutableArray*)search:(NSString *)name 
{
    NSMutableArray *arr = [NSMutableArray array];
    NSString *sql = [NSString stringWithFormat:@"select * from UserList where name = '%@'",name];
    [queue inDatabase:^(FMDatabase *db) {
        FMResultSet *results = [db executeQuery:sql];
        
        while (results.next) {
            NSString *name = [results stringForColumn:@"name"];
            NSString *age = [results stringForColumn:@"age"];
            
            UserModel *model = [[UserModel alloc] init];
            model.name = name;
            model.age = age;
            [arr addObject:model];
            [SVProgressHUD showSuccessWithStatus:@"查询成功"];

        }
    }];
    if (arr.count==0) {
        [SVProgressHUD showErrorWithStatus:@"数据不存在"];

    }
    return arr;
}
- (NSMutableArray*)searchAge:(NSString *)age
{
    NSMutableArray *arr = [NSMutableArray array];
    NSString *sql = [NSString stringWithFormat:@"select * from UserList where age = '%@'",age];
    [queue inDatabase:^(FMDatabase *db) {
        FMResultSet *results = [db executeQuery:sql];
        
        while (results.next) {
            NSString *name = [results stringForColumn:@"name"];
            NSString *age = [results stringForColumn:@"age"];
            
            UserModel *model = [[UserModel alloc] init];
            model.name = name;
            model.age = age;
            [arr addObject:model];
            [SVProgressHUD showSuccessWithStatus:@"查询成功"];
            
        }
    }];
    if (arr.count==0) {
        [SVProgressHUD showErrorWithStatus:@"数据不存在"];
        
    }
    return arr;
}
- (NSMutableArray*)searchName:(NSString *)name andAge:(NSString*)age
{
    NSMutableArray *arr = [NSMutableArray array];
    NSString *sql = [NSString stringWithFormat:@"select * from UserList where name = '%@' and age = '%@'",name,age];
    [queue inDatabase:^(FMDatabase *db) {
        FMResultSet *results = [db executeQuery:sql];
        
        while (results.next) {
            NSString *name = [results stringForColumn:@"name"];
            NSString *age = [results stringForColumn:@"age"];
            
            UserModel *model = [[UserModel alloc] init];
            model.name = name;
            model.age = age;
            [arr addObject:model];
            [SVProgressHUD showSuccessWithStatus:@"查询成功"];
            
        }
    }];
    if (arr.count==0) {
        [SVProgressHUD showErrorWithStatus:@"数据不存在"];
        
    }
    return arr;

}

-(void)deleteData:(NSString*)name age:(NSString*)age
{
    NSString *sql = [NSString stringWithFormat:@"delete from UserList where name= '%@' and age = '%@'",name,age];
    
    [queue inDatabase:^(FMDatabase *db)
     {
         [db executeUpdate:sql];
     }];
    
}
- (void)changeAge:(NSString*)age  name:(NSString*)name{
    
    NSString *sql = [NSString stringWithFormat:
                     @"UPDATE UserList SET age = '%@' WHERE name = '%@' ",age,name
                     ];
    
    [queue inDatabase:^(FMDatabase *db)
     {
         [db executeUpdate:sql];
     }];
    
}



@end

