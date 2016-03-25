//
//  OrderModel.h
//  iOS_demo
//
//  Created by 金中国 on 16/3/18.
//  Copyright © 2016年 jzg. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  订单 模型
 */
@interface OrderModel : NSObject
/**
    订单号
 */
@property (nonatomic, strong)NSString *orderNumber;
/**
    订单状态
 */
@property (nonatomic, strong)NSString *orderState;
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
 *  总金额 
 */
@property (nonatomic, strong)NSString *totalAmount;
@end
