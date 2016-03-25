//
//  UIImageView+HBExtension.m
//  HBExtension
//
//  Created by yik on 16/1/9.
//  Copyright © 2016年 jzg. All rights reserved.
//

#import "UIImageView+HBExtension.h"
#pragma mark 内部类
@interface HBExImageView : UIImageView
@property (copy,nonatomic) void (^action)(UIImageView *imageView);
@end
@implementation HBExImageView

- (void)tapImageBtnClick{
    if (self.action) {
        self.action(self);
    }

}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImageBtnClick)];
        [self addGestureRecognizer:tapGes];
    }
    return self;

}

- (instancetype)init
{
    if (self = [super init]) {
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImageBtnClick)];
        [self addGestureRecognizer:tapGes];
    }
    return self;

    
}
@end









@implementation UIImageView (HBExtension)
+ (instancetype)imageViewWithFrame:(CGRect)frame image:(UIImage *)image
{
    UIImageView *imgView = [[self  alloc] initWithFrame:frame];
    imgView.image = image;
    
    return imgView;
}
+ (instancetype)imageViewWithImage:(UIImage *)image
{
    UIImageView *imgView = [[UIImageView alloc] init];
    imgView.image = image;

    return imgView;
}

- (instancetype)initWithFrame:(CGRect)frame image:(UIImage *)image
{
    return [[self class] imageViewWithFrame:frame image:image];


}

+(instancetype)imageViewWithFrame:(CGRect)frame image:(UIImage *)image action:(void(^)(UIImageView*imageView))action
{
    HBExImageView *imageview = [[HBExImageView alloc] initWithFrame:frame];
    imageview.image = image;
    imageview.action = action;
    return imageview;

}

- (instancetype)initWithFrame:(CGRect)frame image:(UIImage *)image action:(void(^)(UIImageView*imageView))action
{
    return [[self class] imageViewWithFrame:frame image:image action:action];

}
- (UIImageView *)imageCornerRadius:(CGFloat)cornerRadius
{

    self.clipsToBounds = YES;
    
    self.layer.cornerRadius = cornerRadius;
    
    return self;

}



















@end
