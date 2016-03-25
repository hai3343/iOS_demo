//
//  LoginView.m
//  iOS_demo
//
//  Created by yik on 16/3/18.
//  Copyright © 2016年 jzg. All rights reserved.
//

#import "APPLoginView.h"
#import "InputHelper.h"
@interface APPLoginView()
{
    UIView *_line;
    BOOL _lineMove;
    UIImageView *_navView;
    UIButton *_logBtn;
    UIButton *_registerBtn;
    UIButton *_loginApp;
}
@end
@implementation APPLoginView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createNav];
        [self createUI];
    }
    return self;
    
}
- (void)createNav
{
    _navView = [UIImageView imageViewWithImage:[UIImage imageNamed:@"nav_icon_bg"]];
    _navView.userInteractionEnabled = YES;
    [self addSubview:_navView];
    [_navView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.and.right.mas_equalTo(self);
        make.height.mas_equalTo(64);
    }];
    _logBtn = [UIButton buttonWithType:UIButtonTypeCustom title:@"登录" titleFont:20 titleColor:[UIColor whiteColor] backgroundColor:[UIColor clearColor] target:self selector:@selector(logBtnClick:)];
    _logBtn.selected = YES;
    
    [_navView addSubview:_logBtn];
    [_logBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_navView).offset(25);
        make.size.mas_equalTo(CGSizeMake(50, 35));
        make.centerX.mas_offset(-25);
    }];
    _line = [UIView new];
    _line.backgroundColor = [UIColor whiteColor];
    _lineMove = NO;
    [_navView addSubview:_line];
    
    [_line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(_navView).offset(-7);
        make.centerX.mas_equalTo(_logBtn);
        make.size.mas_equalTo(CGSizeMake(25, 1.5));
    }];
    _registerBtn = [UIButton buttonWithType:UIButtonTypeCustom title:@"注册" titleFont:20 titleColor:[UIColor whiteColor] backgroundColor:[UIColor clearColor] target:self selector:@selector(registerClick:)];
    [_navView addSubview:_registerBtn];
    [_registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_navView).offset(25);
        make.size.mas_equalTo(_logBtn);
        make.centerX.mas_offset(25);
    }];
    
    
}

- (void)createUI
{
    _nameField = [UITextField new];
    _nameField.backgroundColor = [UIColor whiteColor];
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    _nameField.leftView = paddingView;
    _nameField.leftViewMode = UITextFieldViewModeAlways;
    _nameField.placeholder = @"用户名或手机号";
    _nameField.clearButtonMode = YES;
    [self addSubview:_nameField];
    
    UIView *paddingView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    
    _passField = [UITextField new];
    _passField.backgroundColor = [UIColor whiteColor];
    _passField.leftView = paddingView1;
    _passField.leftViewMode = UITextFieldViewModeAlways;
    _passField.placeholder = @"密码";
    _passField.secureTextEntry = YES;
    _passField.clearButtonMode = YES;
    
    _passField.keyboardType = UIKeyboardTypeASCIICapable;
    [self addSubview:_passField];
    
    [_nameField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(44);
        make.top.mas_equalTo(_navView.mas_bottom).offset(20);
        make.left.mas_equalTo(5);
        make.right.mas_equalTo(-5);
    }];
    [_passField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(44);
        make.top.mas_equalTo(_nameField.mas_bottom).offset(1);
        make.left.mas_equalTo(5);
        make.right.mas_equalTo(-5);
    }];
    
    _loginApp = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [_loginApp setBackgroundImage:[UIImage imageNamed:@"nav_icon_bg"] forState:UIControlStateNormal];
    [_loginApp setTintColor:[UIColor redColor]];
    [_loginApp setTitle:@"登录" forState:UIControlStateNormal];
    _loginApp.cornerRadius = 5;
    [_loginApp addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_loginApp];
    [_loginApp mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_passField.mas_bottom).offset(20);
        make.left.mas_equalTo(self).offset(20);
        make.right.mas_equalTo(self).offset(-20);
        make.height.mas_equalTo(54);
    }];
    //监控textField的改变
    [_passField addTarget:self action:@selector(textFieldChanged:) forControlEvents:UIControlEventEditingChanged];
    UIButton *forgetPass = [UIButton buttonWithType:UIButtonTypeCustom title:@"忘记密码?" titleFont:14 titleColor:[UIColor grayColor] backgroundColor:[UIColor clearColor] target:self selector:@selector(forgetPass:)];
    [self addSubview:forgetPass];
    [forgetPass mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(_loginApp);
        make.top.mas_equalTo(_loginApp.mas_bottom).offset(10);
        make.size.mas_equalTo(CGSizeMake(70, 30));
    }];
    UILabel *lab = [UILabel lableWithTitle:@"一键登陆" titleColor:[UIColor grayColor] titleFont:[UIFont systemFontOfSize:14] textAlignment:NSTextAlignmentCenter];
    [self addSubview:lab];
    [lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(forgetPass.mas_bottom).offset(30);
        make.size.mas_equalTo(CGSizeMake(80, 30));
    }];
    UIView *leftline = [UIView new];
    leftline.backgroundColor = RGB(223, 223, 223);
    [self addSubview:leftline];
    [leftline mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_loginApp);
        make.right.mas_equalTo(lab.mas_left).offset(-5);
        make.height.mas_equalTo(1.5);
        make.centerY.mas_equalTo(lab);
    }];
    UIView *rightline = [UIView new];
    rightline.backgroundColor = RGB(223, 223, 223);
    [self addSubview:rightline];
    [rightline mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(_loginApp);
        make.left.mas_equalTo(lab.mas_right).offset(5);
        make.height.mas_equalTo(1.5);
        make.centerY.mas_equalTo(lab);
    }];
    
    UIButton *wxlogin = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [wxlogin setBackgroundImage:[UIImage imageNamed:@"a_sns_icon_22"] forState:0];
    [wxlogin setBackgroundImage:[UIImage imageNamed:@"a_sns_icon_22"] forState:UIControlStateHighlighted];
    wxlogin.cornerRadius = 25;
    [wxlogin addTarget:self action:@selector(wxlogin:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:wxlogin];
    [wxlogin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(lab.mas_bottom).offset(15);
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    
    UIImageView *logoimg = [UIImageView imageViewWithImage:[UIImage imageNamed:@"footerlogo"]];
    [self addSubview:logoimg];
    [logoimg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(wxlogin.mas_bottom).offset(10);
        make.size.mas_equalTo(CGSizeMake(Screen_Width, 50));
    }];
    
    
    
}
//监控密码输入框
- (void)textFieldChanged:(UITextField *)textField
{
    if (textField.text.length) {
        _loginApp.enabled = YES;
        
    }else{
        _loginApp.enabled = NO;
    }
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self endEditing:YES];
    
}
//忘记密码
- (void)forgetPass:(UIButton*)button
{
    [self endEditing:YES];
    if (self.forgetPassBlock) {
        self.forgetPassBlock();
    }
}
//登陆APP
- (void)login:(UIButton*)btn
{
    [self endEditing:YES];
    if (_nameField.text.length == 0||_passField.text.length == 0) {
        [SVProgressHUD showErrorWithStatus:@"请输入用户名或密码"];
        return;
    }
    if (self.loginAppBlock) {
        self.loginAppBlock();
    }
    
}



//注册
- (void)registerClick:(UIButton*)btn
{
    [self endEditing:YES];
    if (_lineMove) {
        return;
    }
    
    [_line mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(_navView).offset(-7);
        make.centerX.mas_equalTo(_registerBtn);
        make.size.mas_equalTo(CGSizeMake(25, 1.5));
    }];
    [UIView animationWithView:_line animationType:HBmovein duration:0.5 direction:HBleft];
    _lineMove = YES;
    if (self.registerBlock) {
        self.registerBlock();
    }
}
//登录页面
- (void)logBtnClick:(UIButton*)btn
{
   [self endEditing:YES];
    if (!_lineMove) {
        return;
    }
    _lineMove = NO;
    [UIView animationPush:_line duration:0.3];
    [_line mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(_navView).offset(-7);
        make.centerX.mas_equalTo(_logBtn);
        make.size.mas_equalTo(CGSizeMake(25, 1.5));
    }];
    if (self.loginBlock) {
        self.loginBlock();
    }
}
//微信登陆
- (void)wxlogin:(UIButton*)button
{
    [self endEditing:YES];
    if (self.wxloginBlock) {
        self.wxloginBlock();
    }
}












@end
