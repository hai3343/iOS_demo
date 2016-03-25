//
//  UIButton+HBExtension.m
//  HBExtension
//
//  Created by yik on 16/1/8.
//  Copyright © 2016年 jzg. All rights reserved.
//

#import "UIButton+HBExtension.h"

@implementation UIButton (HBExtension)
+ (void)load
{

}
//  创建文字按钮
+ (instancetype)buttonWithFrame:(CGRect)frame type:(UIButtonType)buttonType title:(NSString *)title titleFont:(CGFloat)titleFont titleColor:(UIColor *)titleColor backgroundColor:(UIColor *)backgroundColor target:(id)targ selector:(SEL)selector{
    
    //创建自定义类型button
         UIButton *btn = [self buttonWithType:buttonType];
        [btn setFrame:frame];
        [btn setTitle:title forState:UIControlStateNormal];
        if (!titleFont) {
        titleFont = 18;
        }
        btn.titleLabel.font = [UIFont systemFontOfSize:titleFont];
        [btn setTitleColor:titleColor forState:UIControlStateNormal];
        
        [btn setBackgroundColor:backgroundColor];
        [btn addTarget:targ action:selector forControlEvents:UIControlEventTouchDown];
        return btn;
}
+ (instancetype)buttonWithType:(UIButtonType)buttonType title:(NSString *)title titleFont:(CGFloat)titleFont titleColor:(UIColor *)titleColor backgroundColor:(UIColor *)backgroundColor target:(id)targ selector:(SEL)selector
{
    //创建自定义类型button
    UIButton *btn = [self buttonWithType:buttonType];
    [btn setTitle:title forState:UIControlStateNormal];
    if (!titleFont) {
        titleFont = 18;
    }
    btn.titleLabel.font = [UIFont systemFontOfSize:titleFont];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    
    [btn setBackgroundColor:backgroundColor];
    [btn addTarget:targ action:selector forControlEvents:UIControlEventTouchDown];
    return btn;



}
- (instancetype)initWithFrame:(CGRect)frame type:(UIButtonType)buttonType title:(NSString *)title titleFont:(CGFloat)titleFont titleColor:(UIColor *)titleColor backgroundColor:(UIColor *)backgroundColor target:(id)targ selector:(SEL)selector
{
    return [[self class] buttonWithFrame:frame type:buttonType title:title titleFont:titleFont titleColor:titleColor backgroundColor:backgroundColor target:targ selector:selector];
}
//创建图片按钮
+ (instancetype)buttonWithFrame:(CGRect)frame type:(UIButtonType)buttonType title:(NSString *)title titleFont:(CGFloat)titleFont titleColor:(UIColor *)titleColor backgroundImage:(NSString *)backgroundImage target:(id)targ selector:(SEL)selector
{
    UIButton *btn = [self buttonWithType:buttonType];
    [btn setFrame:frame];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:titleColor forState:0];
    if (!titleFont) {
        titleFont = 18;
    }
    btn.titleLabel.font = [UIFont systemFontOfSize:titleFont];
    [btn setBackgroundImage:[UIImage imageNamed:backgroundImage] forState:0];
    [btn addTarget:targ action:selector forControlEvents:UIControlEventTouchDown];
    
    return btn;

}
- (instancetype)initWithFrame:(CGRect)frame type:(UIButtonType)buttonType title:(NSString *)title titleFont:(CGFloat)titleFont titleColor:(UIColor *)titleColor backgroundImage:(NSString *)backgroundImage target:(id)targ selector:(SEL)selector
{
   return [[self class] buttonWithFrame:frame type:buttonType title:title titleFont:titleFont titleColor:titleColor backgroundImage:backgroundImage target:targ selector:selector];

}
//剪圆角
- (UIButton*)buttonCornerRadius:(CGFloat)cornerRadius
{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = cornerRadius;
    return self;

}








@end
