//
//  UIButton+TZBTools.h
//  iOS_demo
//
//  Created by yik on 16/3/19.
//  Copyright © 2016年 jzg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (TZBTools)
#undef	NAV_BUTTON_MIN_WIDTH
#define	NAV_BUTTON_MIN_WIDTH	(30.0f)

#undef	NAV_BUTTON_MIN_HEIGHT
#define	NAV_BUTTON_MIN_HEIGHT	(30.0f)

#undef	NAV_BAR_HEIGHT
#define	NAV_BAR_HEIGHT	(44.0f)

/** 扩大按钮点击范围 from:http://stackoverflow.com/questions/808503/uibutton-making-the-hit-area-larger-than-the-default-hit-area**/
@property (assign, nonatomic) UIEdgeInsets hitTestEdgeInsets;

//from EasyiOS
-(UIButton *)initNavigationButton:(UIImage *)image;
-(UIButton *)initNavigationButtonWithTitle:(NSString *)str color:(UIColor *)color;


@end
