//
//  ChangPass.m
//  iOS_demo
//
//  Created by yik on 16/3/21.
//  Copyright © 2016年 jzg. All rights reserved.
//
#define labTextColor [UIColor grayColor]
#define labFont [UIFont systemFontOfSize:18]
#import "ChangPass.h"
@interface ChangPass()
{
    CGFloat lableft ;
    CGFloat labWith ;
    CGFloat labHeight ;
    CGFloat textleft ;
    CGFloat textHeight ;
    CGFloat textRight ;
    CGFloat textTop ;
    CGFloat textOfset ;
    NSInteger count;
}

@property (nonatomic,strong) UIButton *getCodeBtn;
@property (nonatomic,strong) UILabel *phoneLab;
@property (nonatomic,strong) UILabel *codeLab;
@property (nonatomic,strong) UILabel *passwLab;
@property (nonatomic,strong) UIButton *regisBtn;

@end
@implementation ChangPass

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];

    }
    return self;
}
- (void)layoutSubviews
{

    [self.cellPhoneField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).offset(textTop);
        make.left.mas_equalTo(self).offset(textleft);
        make.height.mas_equalTo(textHeight);
        make.right.mas_equalTo(self).offset(textRight);
    }];
    [self.verficodeField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.cellPhoneField.mas_bottom).offset(textOfset);
        make.left.mas_equalTo(self).offset(textleft);
        make.height.mas_equalTo(textHeight);
        make.right.mas_equalTo(self.cellPhoneField.mas_centerX).offset(-4);
    }];
    [self.getCodeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(textRight);
        make.top.mas_equalTo(self.verficodeField);
        make.height.mas_equalTo(textHeight);
        make.width.mas_equalTo(self.verficodeField);
    }];
    [self.passWordField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.verficodeField.mas_bottom).offset(textOfset);
        make.left.mas_equalTo(self).offset(textleft);
        make.height.mas_equalTo(textHeight);
        make.right.mas_equalTo(self).offset(textRight);
    }];
    
    
    [_phoneLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(lableft);
        make.centerY.mas_equalTo(self.cellPhoneField);
        make.size.mas_equalTo(CGSizeMake(labWith, labHeight));
    }];
    [_codeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(lableft);
        make.centerY.mas_equalTo(self.verficodeField);
        make.size.mas_equalTo(CGSizeMake(labWith, labHeight));
    }];
    [_passwLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(lableft);
        make.centerY.mas_equalTo(self.passWordField);
        make.size.mas_equalTo(CGSizeMake(labWith, labHeight));
    }];
    
    [_regisBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_passWordField.mas_bottom).offset(30);
        make.left.mas_equalTo(self).offset(20);
        make.right.mas_equalTo(self).offset(-20);
        make.height.mas_equalTo(50);
    }];
    
}
- (void)createUI
{
     lableft = 20;
     labWith = 80;
     labHeight = 40;
     textleft = 100;
     textHeight = 45;
     textRight = -20;
     textTop = 20;
     textOfset = 10;
    self.cellPhoneField = [[UITextField alloc]init];
    [self textFild:self.cellPhoneField text:@"请输入手机号"];
    _cellPhoneField.keyboardType = UIKeyboardTypeASCIICapable;
//    [_cellPhoneField addTarget:self action:@selector(cellPhoneFieldChange:) forControlEvents:UIControlEventEditingChanged];

    [self addSubview:self.cellPhoneField];
    
    self.verficodeField = [[UITextField alloc]init];
    _verficodeField.keyboardType = UIKeyboardTypeASCIICapable;

    [self textFild:self.verficodeField text:@"请输入验证码"];
    [self addSubview:self.verficodeField];
    
    self.passWordField = [[UITextField alloc]init];
    [self textFild:self.passWordField text:@"请设置账号密码"];
    _passWordField.keyboardType = UIKeyboardTypeASCIICapable;
    _passWordField.secureTextEntry = YES;
    [self addSubview:self.passWordField];
    
    [_passWordField addTarget:self action:@selector(textFieldChanged:) forControlEvents:UIControlEventEditingChanged];

    //button
    self.getCodeBtn = [UIButton buttonWithType:UIButtonTypeCustom title:@"获取验证码" titleFont:18 titleColor:RGB(233, 233, 233) backgroundColor:[UIColor whiteColor] target:self selector:@selector(getCode:)];
    self.getCodeBtn.cornerRadius = 5;
    [_getCodeBtn setBackgroundImage:[UIImage imageNamed:@"nav_icon_bg"] forState:UIControlStateNormal];
    [self addSubview:self.getCodeBtn];
    
    
    
    
    _phoneLab = [UILabel lableWithTitle:@"手机号:" titleColor:labTextColor titleFont:labFont textAlignment:NSTextAlignmentLeft];
    [self addSubview:_phoneLab];
    
    
    _codeLab = [UILabel lableWithTitle:@"验证码:" titleColor:labTextColor titleFont:labFont textAlignment:NSTextAlignmentLeft];
    [self addSubview:_codeLab];
    
    
    _passwLab = [UILabel lableWithTitle:@"新密码:" titleColor:labTextColor titleFont:labFont textAlignment:NSTextAlignmentLeft];
    [self addSubview:_passwLab];

    
    _regisBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_regisBtn setTintColor:[UIColor whiteColor]];
    [_regisBtn setTitle:@"确认重置" forState:UIControlStateNormal];
    _regisBtn.cornerRadius = 5;
    _regisBtn.enabled = NO;
    [_regisBtn setBackgroundImage:[UIImage imageNamed:@"nav_icon_bg"] forState:UIControlStateNormal];
    [_regisBtn addTarget:self action:@selector(changePassBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_regisBtn];
    
    
    UIImageView *footimage = [UIImageView imageViewWithImage:[UIImage imageNamed:@"footerlogo"]];
    [self addSubview:footimage];
    [footimage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self);
        make.top.mas_equalTo(_regisBtn.mas_bottom).offset(60);
        make.height.mas_equalTo(50);
    }];
}

- (void)textFild:(UITextField*)textFild text:(NSString*)text
{
    textFild.placeholder = text;
    textFild.borderStyle = UITextBorderStyleRoundedRect;
    textFild.cornerRadius = 5;
    textFild.layer.borderWidth = 1;
    textFild.layer.borderColor = [UIColor whiteColor].CGColor;
    textFild.font = [UIFont systemFontOfSize:18];
    textFild.clearButtonMode = YES;
    textFild.backgroundColor = [UIColor whiteColor];
    
}
//确认重置密码
- (void)changePassBtn:(UIButton*)button
{

    if (_verficodeField.text.length == 0) {
        [SVProgressHUD showErrorWithStatus:@"请输入验证码"];

        return;
    }
    if (![Helper justMobile:_cellPhoneField.text]) {
        [SVProgressHUD showErrorWithStatus:@"请输入正确手机号"];
        return;
    }
    if (self.changePassBlock) {
        self.changePassBlock();
    }
    
}


//获取验证码
- (void)getCode:(UIButton*)button
{
    if ([Helper justMobile:_cellPhoneField.text]) {
        [SVProgressHUD showSuccessWithStatus:@"已经发送"];
        _getCodeBtn.enabled = NO;
        count = 59;
        [_getCodeBtn setTitle:@"60秒" forState:UIControlStateDisabled];
        
        [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timer:) userInfo:nil repeats:YES];
    }else{
    
        [SVProgressHUD showErrorWithStatus:@"请输入正确手机号码"];
    }
    
    
    
}
- (void)timer:(NSTimer*)time
{
    
    if (count > 0) {
        [_getCodeBtn setTitle:[NSString stringWithFormat:@"%ld秒",count--] forState:UIControlStateDisabled];
    }
    else
    {
        [time invalidate];
        _getCodeBtn.enabled = YES;
        [_getCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    }
}


//- (void)cellPhoneFieldChange:(UITextField*)textField
//{
//
//}
- (void)textFieldChanged:(UITextField*)textField
{
    if (textField.text.length >= 6) {
        _regisBtn.enabled = YES;

    }else{
        _regisBtn.enabled = NO;

    }
    

}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self endEditing:YES];
    
}






@end
