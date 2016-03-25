//
//  ScreenLabView.h
//  iOS_demo
//
//  Created by 金中国 on 16/3/16.
//  Copyright © 2016年 jzg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScreenModel.h"
@protocol ScreenLabViewdelegate <NSObject>
- (void)returnSelectedCondition:(NSArray *)dict;
- (void)dissMissView;
@end
@interface ScreenLabView : UIView
@property (nonatomic, strong)id<ScreenLabViewdelegate>delegate;

/**
 *  基本框架不变   只需要传入 2组 所需要的 按钮 显示字串
 *  目前，只实现 款式、价格
 *  @param frame   坐标
 *  @param dataAry 数据
 */
- (instancetype)initWithFrame:(CGRect)frame andDataAry:(NSArray *)dataAry;
@end
