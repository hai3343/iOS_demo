//
//  LogUserModel.m
//  iOS_demo
//
//  Created by happyinghu on 16/3/20.
//  Copyright © 2016年 jzg. All rights reserved.
//

#import "LogUserModel.h"
#import "APPLoginView.h"
#import "HYBNetworking.h"
#import "RegisView.h"
#import "ChangPass.h"
@implementation LogUserModel
- (void)loginAction:(id)view
{
    APPLoginView *logView = (APPLoginView*)view;
    _name = logView.nameField.text;
    _passWorld = logView.passField.text;
    
    NSLog(@"%@ %@",_name,_passWorld);
    NSString *deviceId = @"26627875967cddba852c7ee0463f7504";
    
    NSDictionary *paramDict = @{@"id":_name,@"name":_passWorld,@"deviceId":deviceId};
    
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",SEVER_URL,APPlogin];
    [HYBNetworking enableInterfaceDebug:YES];
    [HYBNetworking configRequestType:kHYBRequestTypePlainText];
    [HYBNetworking postWithUrl:urlStr params:paramDict success:^(id response) {
    } fail:^(NSError *error) {
    }];
}
- (void)shopRegistAction:(id)view
{
    RegisView *regist = (RegisView*)view;
    _name = regist.nameField.text;
    _phoneNo = regist.cellPhoneField.text;
    _code = regist.verficodeField.text;
    _passWorld = regist.passWordField.text;
    

}
- (void)memberAction:(id)view
{
    RegisView *regist = (RegisView*)view;
    _phoneNo = regist.cellPhoneField.text;
    _code = regist.verficodeField.text;
    _passWorld = regist.passWordField.text;

}
- (void)shopCode:(id)view{
    RegisView *regist = (RegisView*)view;
    _name = regist.nameField.text;
    _phoneNo = regist.cellPhoneField.text;
    
    
}
- (void)memberCode:(id)view
{
    RegisView *regist = (RegisView*)view;
    _phoneNo = regist.cellPhoneField.text;

}
- (void)changePassWord:(id)view
{
    ChangPass *regist = (ChangPass*)view;
    _phoneNo = regist.cellPhoneField.text;
    _code = regist.verficodeField.text;
    _passWorld = regist.passWordField.text;


}
- (void)WXlogin
{
    static NSInteger i = 0;
    NSLog(@"%ld",i++);

}





@end
