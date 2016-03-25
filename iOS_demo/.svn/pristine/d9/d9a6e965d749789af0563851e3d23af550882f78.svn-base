//
//  UIButton+HBExtension.h
//  HBExtension
//
//  Created by yik on 16/1/8.
//  Copyright © 2016年 jzg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (HBExtension)
/**
 *  创建文字button
 *
 *  @param frame
 *  @param title
 *  @param titleColor
 *  @param backgroundColor
 *  @param buttonTarget 点击事件
 *
 */
+ (instancetype)buttonWithFrame:(CGRect)frame type:(UIButtonType)buttonType title:(NSString *)title titleFont:(CGFloat)titleFont titleColor:(UIColor *)titleColor backgroundColor:(UIColor *)backgroundColor target:(id)targ selector:(SEL)selector;
/*********创建无Frame文字button******/

+ (instancetype)buttonWithType:(UIButtonType)buttonType title:(NSString *)title titleFont:(CGFloat)titleFont titleColor:(UIColor *)titleColor backgroundColor:(UIColor *)backgroundColor target:(id)targ selector:(SEL)selector;
/*********创建文字button******/
- (instancetype)initWithFrame:(CGRect)frame type:(UIButtonType)buttonType title:(NSString *)title titleFont:(CGFloat)titleFont titleColor:(UIColor *)titleColor backgroundColor:(UIColor *)backgroundColor target:(id)targ selector:(SEL)selector;
/**
 *  创建图片button
 *
 *  @param frame
 *  @param title
 *  @param titleColor
 *  @param backgroundImage
 *  @param selector
 *
 */
+ (instancetype)buttonWithFrame:(CGRect)frame type:(UIButtonType)buttonType title:(NSString *)title titleFont:(CGFloat)titleFont titleColor:(UIColor *)titleColor backgroundImage:(NSString *)backgroundImage target:(id)targ selector:(SEL)selector;
/************创建图片button*********/
- (instancetype)initWithFrame:(CGRect)frame type:(UIButtonType)buttonType title:(NSString *)title titleFont:(CGFloat)titleFont titleColor:(UIColor *)titleColor backgroundImage:(NSString *)backgroundImage target:(id)targ selector:(SEL)selector;

/**
 *  剪圆角
 *
 *
 */
- (UIButton*)buttonCornerRadius:(CGFloat)cornerRadius;








@end
