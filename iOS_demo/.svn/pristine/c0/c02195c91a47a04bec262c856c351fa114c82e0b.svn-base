//
//  DeadClosesController.m
//  iOS_demo
//
//  Created by 金中国 on 16/3/19.
//  Copyright © 2016年 jzg. All rights reserved.
//

#import "DeadClosesController.h"
#import "DeadClosesView.h"
#import "DeadClosesModel.h"
#import "DeadClosesModel.h"
@interface DeadClosesController ()

@end

@implementation DeadClosesController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    DeadClosesView *view = [[[NSBundle mainBundle]loadNibNamed:@"DeadClosesView" owner:nil options:nil] lastObject ];
    DeadClosesModel *model = [[DeadClosesModel alloc]init];
    model.amountOrders = @"10000000";
    model.freightAmount = @"100";
    model.consignee = @"战五渣";
    model.telephone = @"15581104730";
    model.shippingAddress = @"深圳市罗湖区东晓街道翠竹北路1号(原冠丰珠宝)";
    model.actualPayment = @"999999999999";
    
    view.model = model;
    view.block = ^(DeadClosesModel *model){
        NSLog(@"     渣渣  去详情   %@",model);
    };
    
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
