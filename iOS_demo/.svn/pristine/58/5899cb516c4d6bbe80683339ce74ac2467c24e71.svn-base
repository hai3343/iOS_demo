//
//  AddsController.m
//  iOS_demo
//
//  Created by yik on 16/3/18.
//  Copyright © 2016年 jzg. All rights reserved.
//
#import "AddsController.h"
#import "HBScrollView.h"
@interface AddsController ()

@end

@implementation AddsController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    NSArray *arrImg = @[@"http://imgsrc.baidu.com/forum/pic/item/c18444fbb2fb431682d1751b22a446230bf7d3eb.jpg",
                        @"http://imgsrc.baidu.com/forum/pic/item/c5fba21bb051f819449b0d2bd8b44aed2f73e77b.jpg",
                        @"http://imgsrc.baidu.com/forum/pic/item/a80e27d12f2eb938a0177593d7628535e4dd6f46.jpg",
                        @"http://imgsrc.baidu.com/forum/pic/item/3f14ed039245d688184173b8a6c27d1ed31b2451.jpg"];
    HBScrollView *adds = [[HBScrollView alloc] initWithFrame:CGRectZero array:arrImg];
    [self.view addSubview:adds];
    [adds mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(300, 300));
        make.center.mas_equalTo(self.view);
    }];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
