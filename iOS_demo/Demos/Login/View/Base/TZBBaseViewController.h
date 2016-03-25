//
//  TZBBaseViewController.h
//  iOS_demo
//
//  Created by yik on 16/3/19.
//  Copyright © 2016年 jzg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TZBBaseViewController : UIViewController
typedef NS_ENUM(NSInteger, NavigationBarButtonPosition) {
    NavigationBarButtonPositionLeft = 0,
    NavigationBarButtonPositionRight = 1,
};
/**背景颜色**/
- (void)configSubviews;
/**设置标题颜色**/
- (void)setTitle:(NSString *)title color:(UIColor*)color;
/**设置NavBarButton标题颜色**/
- (void)showBarButton:(NavigationBarButtonPosition)position title:(NSString *)title fontColor:(UIColor *)color;
//- (void)showBarButton:(NavigationBarButtonPosition)position image:(UIImage *)image;
/**设置Button**/
- (void)showBarButton:(NavigationBarButtonPosition)position button:(UIButton *)button;
/***control***/
- (void)showBarButton:(NavigationBarButtonPosition)position control:(UIControl *)control;
/***左边点击事件***/
- (void)leftButtonTouch;
/**右边点击事件**/
- (void)rightButtonTouch;
/**设置BarButton图片**/
- (void)setBarButton:(NavigationBarButtonPosition)position image:(UIImage*)normal hilight:(UIImage*)hilight;
@end
