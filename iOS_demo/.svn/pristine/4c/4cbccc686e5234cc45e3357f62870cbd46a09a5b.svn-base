//
//  UserModel.m
//  MVPTest
//
//  Created by yik on 16/3/4.
//  Copyright © 2016年 jzg. All rights reserved.
//

#import "UserModel.h"
#import "DatabaseMamger.h"
#import <SVProgressHUD.h>
#import "LoginView.h"
@implementation UserModel

- (void)readData:(id)views
{
    LoginView *viewsss = (LoginView *)views;
    _name = viewsss.name.text;
    _age = viewsss.age.text;
    if (_name.length == 0&&_age.length == 0) {
        [SVProgressHUD showErrorWithStatus:@"请至少输入一个查询条件"];
        return;
    }
    viewsss.dataArr = nil;
    if (viewsss.dataArr == nil) {
        [viewsss.table reloadData];
        
    }
    if (_name.length != 0&&_age.length == 0) {
        viewsss.dataArr  =  [[DatabaseMamger shareInstance] search:_name];
        [viewsss.table reloadData];
        return;
    }
    if (_age.length != 0&&_name.length == 0) {
        viewsss.dataArr  =  [[DatabaseMamger shareInstance] searchAge:_age];
        [viewsss.table reloadData];
        return;
    }
    if (_age.length != 0&&_name.length != 0) {
        viewsss.dataArr = [[DatabaseMamger shareInstance] searchName:_name andAge:_age];
        [viewsss.table reloadData];
    }
    
}

-(void)writeData:(id)views{
    LoginView *viewsss = (LoginView *)views;
    _name = viewsss.name.text;
    _age = viewsss.age.text;
    
    if (_name.length == 0||_age.length == 0) {
        [SVProgressHUD showErrorWithStatus:@"请输入名字或年龄"];
        return;
    }
    
    [[DatabaseMamger shareInstance] insertData:self];
    viewsss.dataArr = nil;
    [viewsss.table reloadData];
    [SVProgressHUD showSuccessWithStatus:@"写入成功"];
}




@end
