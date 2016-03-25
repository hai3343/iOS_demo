//
//  UIView+HBAnimation.m
//  HBExtension
//
//  Created by yik on 16/1/14.
//  Copyright © 2016年 jzg. All rights reserved.
//

#import "UIView+HBAnimation.h"



@implementation UIView (Animation)
+(void)animationWithView:(UIView*)view animationType:(AnimationType)animationType duration:(float)duration direction:(Direction)direction
{
    CATransition*ani=[CATransition animation];
    
    ani.duration = direction;
    switch (direction) {
        case HBleft:
            ani.subtype = kCATransitionFromLeft;
            break;
        case HBright:
            ani.subtype = kCATransitionFromRight;
            break;
        case HBtop:
            ani.subtype = kCATransitionFromTop;
            break;
        case HBbottom:
            ani.subtype = kCATransitionFromBottom;
            break;
            
        case HBmiddle:
            ani.subtype = kCATruncationMiddle;
            break;
        default:
            break;
    }
    switch (animationType) {
        case HBpageCurl:
        {
            ani.type = @"pageCurl";
        }
            break;
        case HBpageUnCurl:
        {
            ani.type = @"pageUnCurl";
        }
            break;
        case HBrippleEffect:
        {
            ani.type = @"rippleEffect";
        }
            break;
        case HBsuckEffect:
        {
            ani.type = @"suckEffect";
        }
            break;
        case HBcube:
        {
            ani.type = @"cube";
        }
            break;
        case HBcameraIrisHollowOpen:
        {
            ani.type = @"cameraIrisHollowOpen";
        }
            break;
        case HBoglFlip:
        {
            ani.type = @"oglFlip";
        }
            break;
        case HBcameraIrisHollowClose:
        {
            ani.type = @"cameraIrisHollowClose";
            
        }break;
        case HBmovein:
            ani.type = kCATransitionMoveIn;
            break;
        case HBpush:
            ani.type = kCATransitionPush;
            break;
        case HBfade:
            ani.type = kCATransitionFade;
            break;
            
        default:
            break;
    }
    [view.layer addAnimation:ani forKey:nil];
    
    
}

+ (void)animationPush:(UIView *)view duration:(CGFloat)duration
{
    CATransition *animation = [CATransition animation];
    
    animation.duration = duration;
    
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    
    animation.fillMode = kCAFillModeForwards;
    //各种动画效果
    
    /*
     
     KCATransitionFade;
     
     KCATransitionMoveIn;
     
     KCATransitionPush;
     
     KCATransitionReveal;
     
     */
    
    /*
     
     KCATransitionFromeRight;
     
     KCATransitionFromLeft;
     
     KCATransitionFormTop;
     
     kCATransitionFromButtons;
     
     */
    animation.type = kCATransitionPush;
    
    animation.subtype = kCATransitionFromRight;
    
    [view.layer addAnimation:animation forKey:@"animation"];
}


+ (void)animationRotateAndScaleDownUp:(UIView *)view duration:(CGFloat)duration
{
    CABasicAnimation* rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat:(2 * M_PI) * 2];
    rotationAnimation.duration = duration;
    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.toValue = [NSNumber numberWithFloat:0.0];
    scaleAnimation.duration = 0.75f;
    scaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.duration = 0.75f;
    animationGroup.autoreverses = YES;
    animationGroup.repeatCount = 1;//HUGE_VALF;
    [animationGroup setAnimations:[NSArray arrayWithObjects:rotationAnimation, scaleAnimation, nil]];
    
    [view.layer addAnimation:animationGroup forKey:@"animationGroup"];
}




+(void)animationRotateAndScaleEffects:(UIView *)view duration:(CGFloat)duration
{
    [UIView animateWithDuration:0.75
                     animations:^
     {
         view.transform = CGAffineTransformMakeScale(0.001, 0.001);
         
         CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
         animation.toValue = [ NSValue valueWithCATransform3D: CATransform3DMakeRotation(M_PI, 0.70, 0.40, 0.80) ];//旋转形成一道闪电。
         //animation.toValue = [ NSValue valueWithCATransform3D: CATransform3DMakeRotation(M_PI, 0.0, 1.0, 0.0) ];//y轴居中对折番。
         //animation.toValue = [ NSValue valueWithCATransform3D: CATransform3DMakeRotation(M_PI, 1.0, 0.0, 0.0) ];//沿X轴对折翻转。
         //animation.toValue = [ NSValue valueWithCATransform3D: CATransform3DMakeRotation(M_PI, 0.50, -0.50, 0.50) ];
         //animation.toValue = [ NSValue valueWithCATransform3D: CATransform3DMakeRotation(M_PI, 0.1, 0.2, 0.2) ];
         
         animation.duration = duration;
         animation.repeatCount = 1;
         [view.layer addAnimation:animation forKey:nil];
         
     }
                     completion:^(BOOL finished)
     {
         [UIView animateWithDuration:0.75 animations:^
          {
              view.transform = CGAffineTransformMakeScale(1.0, 1.0);
          }
          ];
         
     }
     ];
}


+ (void)deleteView:(UIView *)view duration:(CGFloat)duration
{
    CATransition * animation = [CATransition animation];
//    animation.delegate = self;
    animation.duration = duration;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.type = @"push";
    animation.subtype = kCATransitionFromLeft;
    [view.superview.layer addAnimation:animation forKey:@"animation"];
    [view removeFromSuperview];

}

- (void)test
{
    //使用CABasicAnimation创建基础动画
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"position"];
    //移动的起点
    anima.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, Screen_Height/2-75)];
    //移动的终点
    anima.toValue = [NSValue valueWithCGPoint:CGPointMake(Screen_Width, Screen_Height/2 - 75)];
    anima.duration = 3.0f;
    //如果fillMode=kCAFillModeForwards和removedOnComletion=NO，那么在动画执行完毕后，图层会保持显示动画执行后的状态。但在实质上，图层的属性值还是动画执行前的初始值，并没有真正被改变。
    anima.fillMode = kCAFillModeForwards;
    anima.removedOnCompletion = NO;
    anima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [self.layer addAnimation:anima forKey:@"positionAnimation"];
    
    
    //使用UIView Animation 代码块调用
    //    _demoView.frame = CGRectMake(0, SCREEN_HEIGHT/2-50, 50, 50);
    //    [UIView animateWithDuration:1.0f animations:^{
    //        _demoView.frame = CGRectMake(SCREEN_WIDTH, SCREEN_HEIGHT/2-50, 50, 50);
    //    } completion:^(BOOL finished) {
    //        _demoView.frame = CGRectMake(SCREEN_WIDTH/2-25, SCREEN_HEIGHT/2-50, 50, 50);
    //    }];
    //
    //使用UIView [begin,commit]模式
    //    _demoView.frame = CGRectMake(0, SCREEN_HEIGHT/2-50, 50, 50);
    //    [UIView beginAnimations:nil context:nil];
    //    [UIView setAnimationDuration:1.0f];
    //    _demoView.frame = CGRectMake(SCREEN_WIDTH, SCREEN_HEIGHT/2-50, 50, 50);
    //    [UIView commitAnimations];


}

+ (void)animationFade:(UIView*)view duration:(CGFloat)duration
{
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"opacity"];
    anima.fromValue = [NSNumber numberWithFloat:1.0f];
    anima.toValue = [NSNumber numberWithFloat:0.0f];
    anima.duration = duration;
    anima.fillMode = kCAFillModeForwards;
    anima.removedOnCompletion = NO;
    [view.layer addAnimation:anima forKey:@"opacityAniamtion"];

}

+ (void)animationScale:(UIView *)view times:(CGFloat)times duration:(CGFloat)duration
{
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform.scale"];//同上
    anima.toValue = [NSNumber numberWithFloat:times];//放大倍数
    anima.duration = duration;
    anima.fillMode = kCAFillModeForwards;
    anima.removedOnCompletion = NO;
    [view.layer addAnimation:anima forKey:@"scaleAnimation"];
}
+ (void)rotateanimation:(UIView*)view duration:(CGFloat)duration
{
//        CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform"];
//        anima.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 0, 0, 1)];//绕着矢量（x,y,z）旋转
//        anima.duration = duration;
//        //anima.repeatCount = MAXFLOAT;
//        [view.layer addAnimation:anima forKey:@"rotateAnimation"];

    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];//绕着z轴为矢量，进行旋转(@"transform.rotation.z"==@@"transform.rotation")
    anima.toValue = [NSNumber numberWithFloat:M_PI];
    anima.duration = duration;
    [view.layer addAnimation:anima forKey:@"rotateAnimation"];

}

+ (void)backgroundAnimation:(UIView *)view color:(UIColor*)color duration:(CGFloat)duration
{
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    anima.toValue =(id) color.CGColor;
    anima.duration = duration;
    anima.fillMode = kCAFillModeForwards;
    anima.removedOnCompletion = NO;
    [view.layer addAnimation:anima forKey:@"backgroundAnimation"];
}









@end
