//
//  HBScrollView.h
//  SCroll
//
//  Created by yik on 16/1/8.
//  Copyright © 2016年 yik. All rights reserved.
//

#import <UIKit/UIKit.h>
/****指示器位置***/
typedef NS_ENUM(NSUInteger, PageControlStyle) {
    PageControlAtCenter,
    PageControlAtRight,
};
@interface HBScrollView : UIView
//切换图片时间间隔 默认3s 可选
/****滚动时间***/
@property (nonatomic, assign) CGFloat timeInterval;

//初始化ScrollView 并把需要的图片存在数组里传进来（网络的图片讲url存到数组即可）
/****初始化并传人URL数组****/
- (instancetype)initWithFrame:(CGRect)frame array:(NSArray *)array;
//设置PageControl位置
@property (nonatomic,assign) PageControlStyle style; //default is PageControlAtCenter
/****指示器颜色 默认灰色 可选****/
@property (nonatomic, strong) UIColor *pageControlIndicatorTintColor;
/*********当前页书颜色 默认白色 可选******/
@property (nonatomic, strong) UIColor *currentPageColor;
/***默认图片***/
@property (nonatomic,strong) NSString *placeImage;
/*******图片被点击会调用该block*********/
@property (nonatomic,copy) void(^imageViewDidTapAtIndex)(NSInteger index); //index从0开始
@property (nonatomic,strong) NSArray*array;
@end
