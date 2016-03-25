//
//  UIImageView+HBExtension.h
//  HBExtension
//
//  Created by yik on 16/1/9.
//  Copyright © 2016年 jzg. All rights reserved.
//

#import <UIKit/UIKit.h>






@interface UIImageView (HBExtension)
/**
 *  创建本地图片
 *
 *  @param frame
 *  @param image
 *
 *  @return imageView
 */
+ (instancetype)imageViewWithFrame:(CGRect)frame image:(UIImage *)image;
/*******无Frame图片************/
+ (instancetype)imageViewWithImage:(UIImage *)image;

/******创建图片******/
- (instancetype)initWithFrame:(CGRect)frame image:(UIImage *)image;
/**
 *  带点击事件的本地图片
 *
 *  @param frame
 *  @param imageName
 *  @param tapGes
 *
 *  @return imageView
 */
+ (instancetype)imageViewWithFrame:(CGRect)frame image:(UIImage *)image action:(void(^)(UIImageView*imageView))action;
/*******带点击事件的本地图片*******/
-(instancetype)initWithFrame:(CGRect)frame image:(UIImage *)image action:(void(^)(UIImageView*imageView))action;
/******剪圆角******/
- (UIImageView*)imageCornerRadius:(CGFloat)cornerRadius;














@end
