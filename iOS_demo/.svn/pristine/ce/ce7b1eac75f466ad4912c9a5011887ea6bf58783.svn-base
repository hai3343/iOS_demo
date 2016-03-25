//
//  ChangePsswordVC.m
//  iOS_demo
//
//  Created by happyinghu on 16/3/18.
//  Copyright © 2016年 jzg. All rights reserved.
//

#import "ChangePsswordVC.h"
#import "ChangPass.h"
#import "LogUserModel.h"
@interface ChangePsswordVC ()
@property (nonatomic,strong) ChangPass *changePassView;
@property (nonatomic,strong) LogUserModel *model;

@end

@implementation ChangePsswordVC
- (LogUserModel*)logModel
{
    if (_model == nil) {
        _model = [[LogUserModel alloc] init];
    }
    return _model;
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
}
- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:RGB(233, 233, 233)];
    
    _changePassView = [[ChangPass alloc] initWithFrame:CGRectZero];
    [self.view addSubview:_changePassView];
    [_changePassView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self.view);
        make.top.mas_equalTo(self.view).offset(64);
    }];

    [self setTitle:@"找回密码" color:[UIColor whiteColor]];

    [self setBarButton:0 image:[UIImage imageNamed:@"nav_back"] hilight:[UIImage imageNamed:@"nav_back"]];
    //Block块
    [self ChangPassBlocks];

}
- (void)ChangPassBlocks
{
    __weak typeof(self) weak = self;
    [_changePassView setChangePassBlock:^{
        [weak.model changePassWord:weak.changePassView];
        
    }];



}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
