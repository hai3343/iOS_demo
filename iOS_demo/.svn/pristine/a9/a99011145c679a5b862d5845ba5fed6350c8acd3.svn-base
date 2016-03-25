//
//  LoginView.m
//  MVPTest
//
//  Created by yik on 16/3/4.
//  Copyright © 2016年 jzg. All rights reserved.
//

#import "LoginView.h"
#import "UserModel.h"
@interface LoginView()
{
    UILabel *namelab;
    UILabel *agelab;
}
@end
@implementation LoginView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;

}

- (NSMutableArray*)_dataArr
{
    if (_dataArr==nil) {
        _dataArr = [[NSMutableArray alloc]init];
    }
    return _dataArr;
}
- (void)layoutSubviews
{
    [namelab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60, 30));
        make.left.mas_offset(40);
        make.top.mas_offset(40);
    }];
    [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(Screen_Width - 140, 40));
        make.left.mas_equalTo(namelab.mas_right);
        make.bottom.mas_equalTo(namelab.mas_bottom);
    }];
    [agelab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60, 30));
        make.left.mas_offset(40);
        make.top.mas_equalTo(namelab.mas_bottom).offset(40);
    }];
    [self.age mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(Screen_Width - 140, 40));
        make.left.mas_equalTo(agelab.mas_right);
        make.bottom.mas_equalTo(agelab.mas_bottom);
    }];
    [self.seatch mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(50);
        make.size.mas_equalTo(CGSizeMake(100, 40));
        make.top.mas_equalTo(self.age.mas_bottom).offset(20);
    }];
    [self.write mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.mas_right).offset(-50);
        make.size.mas_equalTo(CGSizeMake(100, 40));
        make.top.mas_equalTo(self.age.mas_bottom).offset(20);
    }];
    [self.table mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self);
        make.right.mas_equalTo(self);
        make.top.mas_equalTo(self.write.mas_bottom).offset(20);
        make.bottom.mas_equalTo(self.mas_bottom);
    }];
}
- (void)createUI
{
    namelab = [UILabel lableWithTitle:@"姓名" titleColor:[UIColor blackColor] titleFont:[UIFont systemFontOfSize:20] textAlignment:NSTextAlignmentCenter];
    [self addSubview:namelab];
    
    self.name = [UITextField new];
    self.name.borderStyle = UITextBorderStyleRoundedRect;
    [self addSubview:self.name];
    
    
    agelab = [UILabel lableWithTitle:@"年龄" titleColor:[UIColor blackColor] titleFont:[UIFont systemFontOfSize:20] textAlignment:NSTextAlignmentCenter];
    [self addSubview:agelab];
    
    self.age = [UITextField new];
    self.age.borderStyle = UITextBorderStyleRoundedRect;
    [self addSubview:self.age];
    
    
    self.seatch = [UIButton buttonWithType:UIButtonTypeCustom title:@"查找" titleFont:20 titleColor:[UIColor blackColor] backgroundColor:[UIColor yellowColor] target:self selector:@selector(read)];
    [self addSubview:self.seatch];
   
    self.write = [UIButton buttonWithType:UIButtonTypeCustom title:@"写入" titleFont:20 titleColor:[UIColor blackColor] backgroundColor:[UIColor yellowColor] target:self selector:@selector(writeData)];
    [self addSubview:self.write];
    self.seatch.tag = 10;
    self.write.tag = 11;

    self.table = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.table.backgroundColor = RGB(243, 243, 243);
    [self addSubview:self.table];
    

}

- (void)writeData
{
    [self endEditing:YES];
    if (self.writeBlock) {
        self.writeBlock();
    }}
- (void)read
{
    [self endEditing:YES];
    if (self.readBlock) {
        self.readBlock();
    }

}







@end
