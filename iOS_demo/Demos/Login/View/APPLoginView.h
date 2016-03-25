//
//  LoginView.h
//  iOS_demo
//
//  Created by yik on 16/3/18.
//  Copyright © 2016年 jzg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface APPLoginView : UIView
/**登录点击事件**/
@property (nonatomic,strong) void(^loginBlock)(void);
/**注册点击事件**/
@property (nonatomic,strong) void(^registerBlock)(void);
/**登录App**/
@property (nonatomic,strong) void(^loginAppBlock)(void);
/**修改密码**/
@property (nonatomic,strong) void(^forgetPassBlock)(void);
/**微信登陆**/
@property (nonatomic,strong) void(^wxloginBlock)(void);
@property (nonatomic,strong) UITextField *nameField;
@property (nonatomic,strong) UITextField *passField;

@end
