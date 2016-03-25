//
//  OrderDetailsController.m
//  iOS_demo
//
//  Created by 金中国 on 16/3/19.
//  Copyright © 2016年 jzg. All rights reserved.
//

#import "OrderDetailsController.h"
#import "OrderDetailsModel.h"
#import "OrderDatailsView.h"
@interface OrderDetailsController ()

@end

@implementation OrderDetailsController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    OrderDetailsModel *model = [[OrderDetailsModel alloc]init];
    
    model.amountOrders = @"1000000000";
    model.freightAmount = @"100";
    model.logisticsCompany = @"东风快递";
    model.logisticsNumber = @"66666666666666666";
    model.consignee = @"王二狗";
    model.telephone = @"99999111222";
    model.shippingAddress = @"深圳市罗湖区东晓街道翠竹北路1号(原冠丰珠宝)";
    model.imageurl = @"xxx";
    model.orderName = @"骚年来一发罐子吧，绝对不是空的";
    model.unitPrice = @"1000000";
    model.number = @"10";
    model.specs = @"搞活动了，速度来抢啊。免费送了，只有一天哦，快过来选一下吧，速度滴干活";
    model.refundBut = @"退款";
    model.orderNumber = @"xxx9988001122211";
    model.scheduledTime = @"1016-1-1 10:20";
    model.paymentTime = @"2016-2-1 10:20";
    model.deliverytime = @"2016-3-1 10:20";
    model.receivingTime = @"2016-4-1 10:20";
    model.merchantRemarks = @"这是啥？过了这个村就没了这个店了，快来买啊! 女王的桂冠，你值得拥有，还在等什么，马上来购买吧，啊啊啊啊!  三位一体的首饰套件，你值得拥右哦，快来";
    
    OrderDatailsView *view = [[[NSBundle mainBundle]loadNibNamed:@"OrderDatailsView" owner:nil options:nil] lastObject ];
    view.model = model;
    view.block = ^(OrderDetailsModel *model){
        NSLog(@"  退款吧   %@",model);
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
