//
//  SegmentedViewController.m
//  LYBFunctionalModule
//
//  Created by 金中国 on 16/3/15.
//  Copyright © 2016年 金中国. All rights reserved.
//

#import "SegmentedViewController.h"

@interface SegmentedViewController ()<ScrollSengmentedViewDelegate>

@end

@implementation SegmentedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.view addSubview:self.backView];
    
    [self.sengmented setTitleAry:@[@"进货",@"退货",@"待收货",@"要退货",@"东方月初",@"西方日落",@"北方大雨",@"南方梅雨"]];
    self.sengmented.delegete = self;
    
    [self.sengmented displaySelect:2];
}
- (void)segmentedView:(ScrollSengmentedView *)sengmented selectTitleinteger:(NSInteger)integer{
    UIColor *color = [UIColor colorWithRed:(arc4random()%255) / 256.0 green:(arc4random()%255) / 256.0 blue:(arc4random()%255) / 256.0 alpha:1];
    self.backView.backgroundColor = color;
}
- (IBAction)dissMiss:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
