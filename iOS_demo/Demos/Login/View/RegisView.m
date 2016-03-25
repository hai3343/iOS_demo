//
//  regisView.m
//  iOS_demo
//
//  Created by yik on 16/3/18.
//  Copyright © 2016年 jzg. All rights reserved.
//
#define labTextColor [UIColor grayColor]
#define labFont [UIFont systemFontOfSize:18]
#import "RegisView.h"
#import "UITextField+Shake.h"
@interface RegisView()
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
@property (nonatomic,strong) UILabel *shopNameLab;
@property (nonatomic,strong) UIButton *getCodeBtn;
@property (nonatomic,strong) UILabel *phoneLab;
@property (nonatomic,strong) UILabel *codeLab;
@property (nonatomic,strong) UILabel *passwLab;
@property (nonatomic,strong) UIButton *chickBtn;
@property (nonatomic,strong) UILabel *agreeLab;
@property (nonatomic,strong) UIButton *protocolBtn;
@property (nonatomic,strong) UIButton *regisBtn;
@property (nonatomic,strong) UIButton *shopRegistBtn;

@end
@implementation RegisView

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


    [self.nameField mas_makeConstraints:^(MASConstraintMaker *make) {
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
    
    
    
    [_shopNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(lableft);
        make.centerY.mas_equalTo(self.nameField);
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
    [_chickBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_passWordField.mas_bottom).offset(textOfset);
        make.left.mas_equalTo(_passwLab);
        make.size.mas_equalTo(CGSizeMake(25, 25));
    }];
    [_agreeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_chickBtn.mas_right).offset(5);
        make.centerY.mas_equalTo(_chickBtn);
        make.size.mas_equalTo(CGSizeMake(30, 20));
    }];
    [_protocolBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_agreeLab.mas_right).offset(5);
        make.centerY.height.mas_equalTo(_agreeLab);
        make.width.mas_equalTo(130);
    }];
    [_regisBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_chickBtn.mas_bottom).offset(15);
        make.left.mas_equalTo(60);
        make.right.mas_equalTo(-60);
        make.height.mas_equalTo(textHeight);
    }];
    [_shopRegistBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_regisBtn.mas_bottom).offset(5);
        make.right.mas_equalTo(_regisBtn);
        make.size.mas_equalTo(CGSizeMake(70, 25));
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
    self.nameField = [[UITextField alloc]init];
    [self textFild:self.nameField text:@"请输入店铺名称"];
//    self.nameField.tag = 100;

    [self addSubview:self.nameField];
//    [self.nameField addTarget:self action:@selector(tapCodeBtn:) forControlEvents:UIControlEventEditingChanged];
    
    self.cellPhoneField = [[UITextField alloc]init];
    [self textFild:self.cellPhoneField text:@"请输入手机号"];
//    self.cellPhoneField.tag =  101;
    _cellPhoneField.keyboardType = UIKeyboardTypeASCIICapable;
    [self addSubview:self.cellPhoneField];
//    [self.cellPhoneField addTarget:self action:@selector(tapCodeBtn:) forControlEvents:UIControlEventEditingChanged];
    [self.cellPhoneField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).offset(textOfset+textHeight+textTop);
        make.left.mas_equalTo(self).offset(textleft);
        make.height.mas_equalTo(textHeight);
        make.right.mas_equalTo(self).offset(textRight);
    }];
        self.verficodeField = [[UITextField alloc]init];
    [self textFild:self.verficodeField text:@"请输入验证码"];
    _verficodeField.keyboardType = UIKeyboardTypeASCIICapable;
    [self addSubview:self.verficodeField];
    
    self.passWordField = [[UITextField alloc]init];
    [self textFild:self.passWordField text:@"请设置账号密码"];
    _passWordField.keyboardType = UIKeyboardTypeASCIICapable;
    _passWordField.secureTextEntry = YES;
    [self addSubview:self.passWordField];
    
    
    //button
    self.getCodeBtn = [UIButton buttonWithType:UIButtonTypeCustom title:@"获取验证码" titleFont:18 titleColor:RGB(233, 233, 233) backgroundColor:[UIColor whiteColor] target:self selector:@selector(getCode:)];
    self.getCodeBtn.cornerRadius = 5;
    [_getCodeBtn setBackgroundImage:[UIImage imageNamed:@"nav_icon_bg"] forState:UIControlStateNormal];
    [self addSubview:self.getCodeBtn];
   
    //lable
    _shopNameLab = [UILabel lableWithTitle:@"店铺名称:" titleColor:labTextColor titleFont:labFont textAlignment:NSTextAlignmentLeft];
    [self addSubview:_shopNameLab];

    
    _phoneLab = [UILabel lableWithTitle:@"手机号:" titleColor:labTextColor titleFont:labFont textAlignment:NSTextAlignmentLeft];
    [self addSubview:_phoneLab];
    [_phoneLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(lableft);
        make.centerY.mas_equalTo(self.cellPhoneField);
        make.size.mas_equalTo(CGSizeMake(labWith, labHeight));
    }];
    
    _codeLab = [UILabel lableWithTitle:@"验证码:" titleColor:labTextColor titleFont:labFont textAlignment:NSTextAlignmentLeft];
    [self addSubview:_codeLab];
    
    
    _passwLab = [UILabel lableWithTitle:@"密码:" titleColor:labTextColor titleFont:labFont textAlignment:NSTextAlignmentLeft];
    [self addSubview:_passwLab];
    
    _chickBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_chickBtn setBackgroundImage:[UIImage imageNamed:@"checkbox_pic"] forState:UIControlStateSelected];
    [_chickBtn setBackgroundImage:[UIImage imageNamed:@"checkbox_pic_non"] forState:0];
    [self addSubview:_chickBtn];
    [_chickBtn addTarget:self action:@selector(chickBtn:) forControlEvents:UIControlEventTouchUpInside];
    _agreeLab = [UILabel lableWithTitle:@"同意" titleColor:labTextColor titleFont:[UIFont systemFontOfSize:14] textAlignment:NSTextAlignmentLeft];
    [self addSubview:_agreeLab];
    _protocolBtn = [UIButton buttonWithType:UIButtonTypeCustom title:@"淘猪宝注册服务协议" titleFont:14 titleColor:labTextColor backgroundColor:[UIColor clearColor] target:self selector:@selector(protocolBtn:)];
    [self addSubview:_protocolBtn];
    _regisBtn = [UIButton buttonWithType:UIButtonTypeCustom title:@"注册" titleFont:18 titleColor:[UIColor whiteColor] backgroundColor:[UIColor whiteColor] target:self selector:@selector(regisBtn:)];;
    _regisBtn.cornerRadius = 5;
    [_regisBtn setBackgroundImage:[UIImage imageNamed:@"nav_icon_bg"] forState:UIControlStateNormal];

    [self addSubview:_regisBtn];
    _shopRegistBtn = [UIButton buttonWithType:UIButtonTypeCustom title:@"创客注册" titleFont:16 titleColor:labTextColor backgroundColor:[UIColor clearColor] target:self selector:@selector(shopRegist:)];
    [self addSubview:_shopRegistBtn];
    
    UIImageView *footimage = [UIImageView imageViewWithImage:[UIImage imageNamed:@"footerlogo"]];
    [self addSubview:footimage];
    [footimage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self);
        make.top.mas_equalTo(_shopRegistBtn.mas_bottom).offset(40);
        make.height.mas_equalTo(50);
    }];
}

- (void)textFild:(UITextField*)textFild text:(NSString*)text
{
    textFild.placeholder = text;
    textFild.borderStyle = UITextBorderStyleRoundedRect;
    textFild.cornerRadius = 5;
    textFild.font = [UIFont systemFontOfSize:18];
    textFild.clearButtonMode = YES;
    textFild.backgroundColor = [UIColor whiteColor];

}
//店铺注册或创客注册
- (void)shopRegist:(UIButton*)button
{
    self.shopNameLab.hidden = !self.shopNameLab.hidden;
    self.nameField.hidden = !self.nameField.hidden;
    //更新frame
    if (self.nameField.hidden) {
        [_shopRegistBtn setTitle:@"店铺注册" forState:0];
        [_cellPhoneField mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self).offset(textTop);
            make.left.mas_equalTo(self).offset(textleft);
            make.height.mas_equalTo(textHeight);
            make.right.mas_equalTo(self).offset(textRight);

        }];
    }else{
        [_shopRegistBtn setTitle:@"创客注册" forState:0];

        [_cellPhoneField mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self).offset(textOfset+textHeight+textTop);
            make.left.mas_equalTo(self).offset(textleft);
            make.height.mas_equalTo(textHeight);
            make.right.mas_equalTo(self).offset(textRight);
        }];
    }

}
//提交注册
- (void)regisBtn:(UIButton*)button
{
    if (![Helper justMobile:_cellPhoneField.text]){
    [SVProgressHUD showErrorWithStatus:@"请输入正确手机号"];
    return;
    }
    if (_verficodeField.text.length == 0) {
        [SVProgressHUD showErrorWithStatus:@"请输入验证码"];
        return;
    }
    if (_passWordField.text.length == 0) {
        [SVProgressHUD showErrorWithStatus:@"请输入密码"];
        return;
    }
    
    if (!_chickBtn.selected) {
        [SVProgressHUD showErrorWithStatus:@"请阅读注册协议"];
        return;
    }
    if (_passWordField.text.length<6) {
        [SVProgressHUD showErrorWithStatus:@"密码必须大于6位数"];
    }
    
    BOOL isMember = self.shopNameLab.hidden;
    if (self.registBlock) {
        self.registBlock(isMember);
    }
    

}
//阅读条约
- (void)protocolBtn:(UIButton*)button
{


}
//是否阅读条约
- (void)chickBtn:(UIButton*)button
{
    _chickBtn.selected = !_chickBtn.selected;

}

//获取验证码
- (void)getCode:(UIButton*)button
{
    if (![Helper justMobile:_cellPhoneField.text]) {
        [_cellPhoneField shake];
//        [SVProgressHUD showErrorWithStatus:@"请输入电话号码"];
        return;
    }
    
        [SVProgressHUD showSuccessWithStatus:@"已经发送"];
        _getCodeBtn.enabled = NO;
        count = 59;
        [_getCodeBtn setTitle:@"60秒" forState:UIControlStateDisabled];
        
        [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timer:) userInfo:nil repeats:YES];
        
        BOOL isMember = self.shopNameLab.hidden;
        
        if (self.getCodeBlock) {
            self.getCodeBlock(isMember);
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


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self endEditing:YES];

}




@end
