
//
//  ViewController.m
//  MVPTest
//
//  Created by yik on 16/3/4.
//  Copyright © 2016年 jzg. All rights reserved.
//

#import "DatabaseController.h"
#import "LoginView.h"
#import "UserModel.h"
#import <SVProgressHUD.h>
#import "DatabaseMamger.h"
@interface DatabaseController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UserModel*model;
@property (nonatomic,strong) LoginView *logview;
@end

@implementation DatabaseController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

}
- (UserModel *)model
{
    if (_model == nil) {
        _model = [[UserModel alloc] init];
    }
    return _model;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _logview = [[LoginView alloc]init];
    _logview.table.delegate = self;
    _logview.table.dataSource = self;
    [self.view addSubview:_logview];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom title:@"返回" titleFont:20 titleColor:[UIColor blackColor] backgroundColor:[UIColor whiteColor] target:self selector:@selector(back:)];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(20);
        make.size.mas_equalTo(CGSizeMake(54, 44));
        make.left.mas_equalTo(self.view).offset(20);
    }];
    __weak DatabaseController *weakse = self;
    [_logview setReadBlock:^{
        [weakse.model readData:weakse.logview];
        
    }];
    [_logview setWriteBlock:^{
        [weakse.model writeData:weakse.logview];

    }];

}
- (void)back:(UIButton*)btn
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)viewDidLayoutSubviews
{
    
[_logview mas_makeConstraints:^(MASConstraintMaker *make) {
    make.left.mas_equalTo(self.view);
    make.right.mas_equalTo(self.view);
    make.top.mas_equalTo(self.view.mas_top).offset(64);
    make.bottom.mas_equalTo(self.view.mas_bottom).offset(-20);
}];

}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

#pragma mark - tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _logview.dataArr.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
        _model = _logview.dataArr[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"姓名:     %@",_model.name];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"年龄:        %@",_model.age];
    return cell;
    
}
- (NSString*)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
return @"删除";
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    _model = _logview.dataArr[indexPath.row];
    [_logview.dataArr removeObjectAtIndex:indexPath.row];

    [[DatabaseMamger shareInstance] deleteData:_model.name age:_model.age];
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];


}




@end
