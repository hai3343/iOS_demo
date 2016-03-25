//
//  UIButton+TZBTools.m
//  iOS_demo
//
//  Created by yik on 16/3/19.
//  Copyright © 2016年 jzg. All rights reserved.
//

#import "UIButton+TZBTools.h"
#import <objc/runtime.h>
#import "SDiPhoneVersion.h"
@implementation UIButton (TZBTools)
@dynamic hitTestEdgeInsets;

static const NSString *KEY_HIT_TEST_EDGE_INSETS = @"KEY_HIT_TEST_EDGE_INSET";

-(void)setHitTestEdgeInsets:(UIEdgeInsets)hitTestEdgeInsets {
    NSValue *value = [NSValue value:&hitTestEdgeInsets withObjCType:@encode(UIEdgeInsets)];
    objc_setAssociatedObject(self, &KEY_HIT_TEST_EDGE_INSETS, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIEdgeInsets)hitTestEdgeInsets {
    NSValue *value = objc_getAssociatedObject(self, &KEY_HIT_TEST_EDGE_INSETS);
    if(value) {
        UIEdgeInsets edgeInsets; [value getValue:&edgeInsets]; return edgeInsets;
    }else {
        return UIEdgeInsetsZero;
    }
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    if(UIEdgeInsetsEqualToEdgeInsets(self.hitTestEdgeInsets, UIEdgeInsetsZero) || !self.enabled || self.hidden) {
        return [super pointInside:point withEvent:event];
    }
    
    CGRect relativeFrame = self.bounds;
    CGRect hitFrame = UIEdgeInsetsInsetRect(relativeFrame, self.hitTestEdgeInsets);
    
    return CGRectContainsPoint(hitFrame, point);
}

-(UIButton *)initNavigationButton:(UIImage *)image{
    CGRect buttonFrame = CGRectZero;
    
    if (iOSVersionGreaterThanOrEqualTo(@"7.0")) {
        buttonFrame = CGRectMake(0, 0, image.size.width, NAV_BAR_HEIGHT);
    }
    else {
        buttonFrame = CGRectMake(0, 0, image.size.width + 10.0f, NAV_BAR_HEIGHT);
    }
    if ( buttonFrame.size.width < NAV_BUTTON_MIN_WIDTH ) {
        buttonFrame.size.width = NAV_BUTTON_MIN_WIDTH;
    }
    
    if ( buttonFrame.size.height < NAV_BUTTON_MIN_HEIGHT ) {
        buttonFrame.size.height = NAV_BUTTON_MIN_HEIGHT;
    }
    self = [self initWithFrame:buttonFrame];
    self.contentMode = UIViewContentModeScaleAspectFit;
    self.backgroundColor = [UIColor clearColor];
    [self setImage:image forState:UIControlStateNormal];
    return self;
}
-(UIButton *)initNavigationButtonWithTitle:(NSString *)str color:(UIColor *)color{
    CGRect buttonFrame = CGRectZero;
    
    CGSize titleSize = [str boundingRectWithSize:CGSizeMake(999999.0f, NAV_BAR_HEIGHT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:16]} context:nil].size;
    
    if (iOSVersionGreaterThanOrEqualTo(@"7.0")) {
        buttonFrame = CGRectMake(0, 0, titleSize.width, NAV_BAR_HEIGHT);
    }
    else {
        buttonFrame = CGRectMake(0, 0, titleSize.width + 10.0f, NAV_BAR_HEIGHT);
    }
    
    self = [self initWithFrame:buttonFrame];
    self.contentMode = UIViewContentModeScaleAspectFit;
    self.backgroundColor = [UIColor clearColor];
    self.titleLabel.font = [UIFont systemFontOfSize:16.0f];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self setTitleColor:color forState:UIControlStateNormal];
    [self setTitle:str forState:UIControlStateNormal];
    return self;
}

@end
