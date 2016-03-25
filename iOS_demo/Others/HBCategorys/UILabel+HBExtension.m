//
//  UILabel+HBExtension.m
//  HBExtension
//
//  Created by yik on 16/1/9.
//  Copyright © 2016年 jzg. All rights reserved.
//

#import "UILabel+HBExtension.h"

@implementation UILabel (HBExtension)

+ (instancetype)lableWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor*)titleColor titleFont:(UIFont*)titleFont textAlignment:(NSTextAlignment)textAlignment
{
    UILabel *lab =  [[UILabel alloc] initWithFrame:frame];
    lab.text = title;
    lab.textColor = titleColor;
    lab.font = titleFont;
    lab.textAlignment = textAlignment;
    return lab;


}
+ (instancetype)lableWithTitle:(NSString *)title titleColor:(UIColor*)titleColor titleFont:(UIFont*)titleFont textAlignment:(NSTextAlignment)textAlignment
{
    UILabel *lab =  [[UILabel alloc] init];
    lab.text = title;
    lab.textColor = titleColor;
    lab.font = titleFont;
    lab.textAlignment = textAlignment;
    return lab;

}
/******************创建Lable******************/
-(instancetype)initWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor*)titleColor titleFont:(UIFont*)titleFont textAlignment:(NSTextAlignment)textAlignment
{

    return [[self class] lableWithFrame:frame title:title titleColor:titleColor titleFont:titleFont textAlignment:textAlignment];

}

- (instancetype)lableCornerRadius:(CGFloat)cornerRadius
{
    self.clipsToBounds = YES;
    self.layer.cornerRadius = cornerRadius;
    return self;
}






















@end
