//
//  DatabaseMamger.h
//  MVPTest
//
//  Created by yik on 16/3/4.
//  Copyright © 2016年 jzg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FMDB.h>
#import "UserModel.h"
@interface DatabaseMamger : NSObject
{
    FMDatabaseQueue *queue;
}

+ (DatabaseMamger*)shareInstance;
/***插入数据***/
- (void)insertData:(UserModel *)model;
- (NSMutableArray*)search:(NSString *)name ;
- (NSMutableArray*)searchAge:(NSString *)age ;
- (NSMutableArray*)searchName:(NSString *)name andAge:(NSString*)age ;
/**按条件删除**/
-(void)deleteData:(NSString*)name age:(NSString*)age;
/**修改数据**/
- (void)changeAge:(NSString*)age  name:(NSString*)name;
@end
