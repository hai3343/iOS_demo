//
//  TZBBaseViewController.m
//  iOS_demo
//
//  Created by yik on 16/3/19.
//  Copyright © 2016年 jzg. All rights reserved.
//

#import "TZBBaseViewController.h"
#import "SDiPhoneVersion.h"
#import "UIButton+TZBTools.h"
@implementation TZBBaseViewController
- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (void)configSubviews {
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)showBarButton:(NavigationBarButtonPosition)position title:(NSString *)title fontColor:(UIColor *)color {
    UIButton *button = [[UIButton alloc] initNavigationButtonWithTitle:title color:color];
    [self showBarButton:position button:button];
}

- (void)showBarButton:(NavigationBarButtonPosition)position image:(UIImage *)image {
    UIButton *button = [[UIButton alloc] initNavigationButton:image];
    [self showBarButton:position button:button];
}

- (void)showBarButton:(NavigationBarButtonPosition)position button:(UIButton *)button {
    if (position == NavigationBarButtonPositionLeft) {
        [button addTarget:self action:@selector(leftButtonTouch) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.leftBarButtonItem = nil;
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
        if (iOSVersionGreaterThanOrEqualTo(@"7.0")) {
            self.navigationController.interactivePopGestureRecognizer.delegate = nil;
        }
    } else if (position == NavigationBarButtonPositionRight) {
        [button addTarget:self action:@selector(rightButtonTouch) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.rightBarButtonItem = nil;
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    }
}

- (void)showBarButton:(NavigationBarButtonPosition)position control:(UIControl *)control {
    if (position == NavigationBarButtonPositionLeft) {
        [control addTarget:self action:@selector(leftButtonTouch) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.leftBarButtonItem = nil;
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:control];
        if (iOSVersionGreaterThanOrEqualTo(@"7.0")) {
            self.navigationController.interactivePopGestureRecognizer.delegate = nil;
        }
    } else if (position == NavigationBarButtonPositionRight) {
        [control addTarget:self action:@selector(rightButtonTouch) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.rightBarButtonItem = nil;
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:control];
    }
}

- (void)leftButtonTouch {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)rightButtonTouch {
    
}
- (void)setBarButton:(NavigationBarButtonPosition)position image:(UIImage*)normal hilight:(UIImage*)hilight{
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [btn setImage:normal forState:UIControlStateNormal];
    [btn setImage:hilight forState:UIControlStateHighlighted];
    if (position == 0 ) {
        btn.imageEdgeInsets = UIEdgeInsetsMake(0,-30, 0, 0);
    }else{
        btn.imageEdgeInsets = UIEdgeInsetsMake(0,0, 0, -30);
    }
    [self showBarButton:position button:btn];
}
- (void)setTitle:(NSString *)title color:(UIColor *)color
{
    self.title = title;
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:19],
       NSForegroundColorAttributeName:color}];
}









@end
