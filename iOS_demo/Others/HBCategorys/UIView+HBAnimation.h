//
//  UIView+HBAnimation.h
//  HBExtension
//
//  Created by yik on 16/1/14.
//  Copyright © 2016年 jzg. All rights reserved.
//




#define kCameraEffectOpen  @"cameraIrisHollowOpen"
#define kCameraEffectClose @"cameraIrisHollowClose"


#import <UIKit/UIKit.h>
#import "QuartzCore/QuartzCore.h"

@interface UIView (Animation)

typedef enum{
    
    HBpageCurl,//
    HBpageUnCurl,
    HBrippleEffect,
    HBsuckEffect,
    HBcube,
    HBoglFlip,
    HBcameraIrisHollowOpen,
    HBcameraIrisHollowClose,
    HBfade,
    HBmovein,
    HBpush
    
}AnimationType;
typedef enum{
    HBleft,
    HBright,
    HBtop,
    HBbottom,
    HBmiddle
    
}Direction;
/*******各种动画组合效果******/
+(void)animationWithView:(UIView*)view animationType:(AnimationType)animationType duration:(float)duration direction:(Direction)direction;
/*****旋转缩放*****/
+ (void)animationRotateAndScaleEffects:(UIView *)view duration:(CGFloat)duration;//各种旋转缩放效果。
/******旋转同时缩小放大效果********/
+ (void)animationRotateAndScaleDownUp:(UIView *)view duration:(CGFloat)duration;//旋转同时缩小放大效果
/******push 右往左*******/
+ (void)animationPush:(UIView *)view duration:(CGFloat)duration;
/****View删除动画 从左往右push***/
+ (void)deleteView:(UIView *)view duration:(CGFloat)duration;
/******逐渐消失动画*****/
+ (void)animationFade:(UIView*)view duration:(CGFloat)duration;
/**********放大缩小动画***************/
+ (void)animationScale:(UIView *)view times:(CGFloat)times duration:(CGFloat)duration;
/*********旋转动画************/
+ (void)rotateanimation:(UIView*)view duration:(CGFloat)duration;
/*********背景颜色的改变动画************/
+ (void)backgroundAnimation:(UIView *)view color:(UIColor*)color duration:(CGFloat)duration;

















@end
