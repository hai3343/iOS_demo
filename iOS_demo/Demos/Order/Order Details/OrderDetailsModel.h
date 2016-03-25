//
//  OrderDetailsModel.h
//  iOS_demo
//
//  Created by 金中国 on 16/3/19.
//  Copyright © 2016年 jzg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OrderDetailsModel : NSObject

/**
 *  订单金额
 */
@property (nonatomic, strong)NSString *amountOrders;
/**
 *  运费金额
 */
@property (nonatomic, strong)NSString *freightAmount;
/**
 *  物流公司
 */
@property (nonatomic, strong)NSString *logisticsCompany;
/**
 *  物流单号
 */
@property (nonatomic, strong)NSString *logisticsNumber;
/**
 *  收货人
 */
@property (nonatomic, strong)NSString *consignee;
/**
 *  联系电话
 */
@property (nonatomic, strong)NSString *telephone;
/**
 *  收货地址
 */
@property (nonatomic, strong)NSString *shippingAddress;

/**
 图片链接
 */
@property (nonatomic, strong)NSString *imageurl;
/**
 货品 名字
 */
@property (nonatomic, strong)NSString *orderName;
/**
 *  单价
 */
@property (nonatomic, strong)NSString *unitPrice;
/**
 *  订单数量
 */
@property (nonatomic, strong)NSString *number;
/**
 *  规格      自动拼接   -- 规格:
 */
@property (nonatomic, strong)NSString *specs;
/**
 *  按钮
 */
@property (nonatomic, strong)NSString *refundBut;
/**
 *  订单号
 */
@property (nonatomic, strong)NSString *orderNumber;
/**
 *  预定时间
 */
@property (nonatomic, strong)NSString *scheduledTime;
/**
 *  付款时间
 */
@property (nonatomic, strong)NSString *paymentTime;
/**
 *  发货时间
 */
@property (nonatomic, strong)NSString *deliverytime;
/**
 *  收货时间
 */
@property (nonatomic, strong)NSString *receivingTime;
/**
 *  商家备注
 */
@property (nonatomic, strong)NSString *merchantRemarks;


@end
