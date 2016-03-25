//
//  LoginView.h
//  MVPTest
//
//  Created by yik on 16/3/4.
//  Copyright © 2016年 jzg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ActionProtocol.h"
@interface LoginView : UIView
/***姓名***/
@property (nonatomic,strong) UITextField *name;
/***年纪***/
@property (nonatomic,strong) UITextField *age;
/***性别***/
@property (nonatomic,strong) UITextField *sex;
@property (nonatomic,strong) UITableView *table;
@property (nonatomic,strong) UIButton *seatch;
@property (nonatomic,strong) UIButton * write;
/***读取数据的Block***/
@property(nonatomic,copy) void(^readBlock)(void);
/***存数据的Block***/
@property(nonatomic,copy) void(^writeBlock)(void);
@property(nonatomic,strong) NSMutableArray *dataArr;
@end
