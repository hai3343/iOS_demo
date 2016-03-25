//
//  LoginVC.m
//  iOS_demo
//
//  Created by yik on 16/3/18.
//  Copyright © 2016年 jzg. All rights reserved.
//

#import "LoginVC.h"
#import "APPLoginView.h"
#import "RegisView.h"
#import "ChangePsswordVC.h"
#import "LogUserModel.h"
@interface LoginVC ()
@property (nonatomic,strong) RegisView *regisView;
@property (nonatomic,strong) APPLoginView *loginView;
@property (nonatomic,strong) LogUserModel *model;

@end

@implementation LoginVC

- (LogUserModel*)model
{
    if (_model == nil) {
        _model = [[LogUserModel alloc] init];
    }
    return _model;
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.loginView = [[APPLoginView alloc] initWithFrame:self.view.bounds];
    self.loginView.backgroundColor = RGB(243, 243, 243);
    [self.view addSubview:self.loginView];

    [self.loginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(self.view);
    }];

    //loginViewBlock代码块
    [self loginViewBlocks];

}
- (void)RegisViewBlocks
{

#pragma mark - 店铺注册回调
    __weak typeof(self) weak = self;
    //获取验证码
    [self.regisView setGetCodeBlock:^(BOOL isMemb) {
        if (isMemb) {
           NSLog(@"会员");
            [weak.model memberCode:weak.regisView];
            
        }else{
            
            NSLog(@"店铺");
            [weak.model shopCode:weak.regisView];
        }
    }];
    //提交注册
    [self.regisView setRegistBlock:^(BOOL isMemb) {
        if (isMemb) {
            NSLog(@"会员");
            [weak.model memberAction:weak.regisView];
        }else{
            [weak.model shopRegistAction:weak.regisView];
            NSLog(@"店铺");
        }
    }];

}
- (void)loginViewBlocks
{
    __weak typeof(self) weak = self;
    [self.loginView setLoginBlock:^{
        weak.regisView.hidden = YES;
        [weak.regisView endEditing:YES];
        [UIView animationWithView:weak.regisView animationType:HBpush duration:1.0 direction:HBleft];
    }];
    
    //点击注册初始化注册界面
    [self.loginView setRegisterBlock:^{
        if (weak.regisView == nil) {
            weak.regisView = [[RegisView alloc] initWithFrame:CGRectMake(0, 64, Screen_Width, Screen_Height - 64)];
            weak.regisView.hidden = YES;
            weak.regisView.backgroundColor = RGB(243, 243, 243);
            [weak.view addSubview:weak.regisView];
            [weak.regisView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(weak.view).offset(64);
                make.width.mas_equalTo(weak.view);
                make.bottom.mas_equalTo(weak.view);
                make.left.mas_equalTo(weak.view);
            }];
            _regisView = weak.regisView;
        }
        
        //RegisViewBlocks代码块
        [weak RegisViewBlocks];
        weak.regisView.hidden = NO;
        [weak.loginView endEditing:YES];
        [UIView animationPush:weak.regisView duration:.5];
    }];
   
    [self.loginView setLoginAppBlock:^{
        [weak dismissViewControllerAnimated:YES completion:nil];
        //回调到model里处理网络请求
        [weak.model loginAction:weak.loginView];
    }];
    [self.loginView setForgetPassBlock:^{
        ChangePsswordVC *vc = [[ChangePsswordVC alloc] init];
        [weak.navigationController pushViewController:vc animated:YES];
    }];
    [self.loginView setWxloginBlock:^{

        [weak.model WXlogin];
    }];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
