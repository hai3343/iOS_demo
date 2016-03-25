//
//  UILabel+HBExtension.h
//  HBExtension
//
//  Created by yik on 16/1/9.
//  Copyright © 2016年 jzg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (HBExtension)
/**
 *  创建Lable
 *
 *  @param frame
 *  @param title
 *  @param titleColor
 *  @param titleFont
 *  @param textAlignment
 *
 *  @return Lable
 */
+ (instancetype)lableWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor*)titleColor titleFont:(UIFont*)titleFont textAlignment:(NSTextAlignment)textAlignment;
/**********无Frame创建Lable***********/
+ (instancetype)lableWithTitle:(NSString *)title titleColor:(UIColor*)titleColor titleFont:(UIFont*)titleFont textAlignment:(NSTextAlignment)textAlignment;
/**********创建Lable***********/
-(instancetype)initWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor*)titleColor titleFont:(UIFont*)titleFont textAlignment:(NSTextAlignment)textAlignment;
/**剪角*/
- (instancetype)lableCornerRadius:(CGFloat)cornerRadius;



@end
