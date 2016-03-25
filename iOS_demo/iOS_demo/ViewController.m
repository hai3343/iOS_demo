//
//  ViewController.m
//  iOS_demo
//
//  Created by yik on 16/3/15.
//  Copyright © 2016年 jzg. All rights reserved.
//



#import "ViewController.h"
#import "YTDatePick.h"
#import "SegmentedViewController.h"
#import "StroButtonViewController.h"
#import "DatabaseController.h"
#import "SavePicController.h"
#import "ScreenLabView.h"
#import "OpenCamerController.h"
#import "Helper.h"
#import "CamerasController.h"
#import "ScreenLableViewController.h"
#import "QuantityViewController.h"
#import "AddsController.h"
#import "LoginVC.h"
#import "OrderViewController.h"
#import "DeadClosesController.h"
#import "OrderDetailsController.h"
#import "BuyBuyVC.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *titleAry;
    UIScrollView *backScroll;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"iOS_demos";
    UITableView *table = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    [self.view addSubview:table];
    
    [table mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.top.mas_equalTo(self.view);
        
    }];
    [table setRowHeight:70];
    table.delegate = self;
    table.dataSource = self;
    //    backScroll = [UIScrollView alloc]initWithFrame:se
    titleAry = @[@"分段控制器",@"选择器",@"按钮",@"FMDB数据库增,删,查,改",@"自定义相机,图片选择器,图片浏览器",@"筛选界面 动画效果",@"保存图片到相册",@"打开系统相册",@"广告轮播",@"登陆",@"数量选择器",@"订单列表",@"交易完成",@"订单详情",@"首页"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return titleAry.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellClass = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellClass];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellClass];
    }
    cell.textLabel.text = [titleAry objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        SegmentedViewController *ller = [[SegmentedViewController alloc]init];
        [self.navigationController pushViewController:ller animated:YES];
    }
    else if (indexPath.row == 1){
        [YTDatePick showPickWithMakeSure:^(id year, id month, id day){
            
        }andDatapickType:DATAPICK_TYPEMIDDLE];
    }else if(indexPath.row == 2){
        StroButtonViewController *ller = [[StroButtonViewController alloc]init];
        [self.navigationController pushViewController:ller animated:YES];
    }else if(indexPath.row == 3){
        DatabaseController *ller = [[DatabaseController alloc]init];
        [self.navigationController pushViewController:ller animated:YES];
        //
    }else if(indexPath.row == 4){
        
        CamerasController *ller = [[CamerasController alloc]init];
        [self.navigationController pushViewController:ller animated:YES];
    }
    else if (indexPath.row == 5){
        ScreenLableViewController *ller = [[ScreenLableViewController alloc]init];
        [self.navigationController pushViewController:ller animated:YES];
        
    }else if (indexPath.row == 6){
        SavePicController *ller = [[SavePicController alloc]init];
        [self.navigationController pushViewController:ller animated:YES];
    }else if (indexPath.row == 7){
        OpenCamerController *ller = [[OpenCamerController alloc]init];
        [self.navigationController pushViewController:ller animated:YES];
        
        NSString* identifierNumber = [[UIDevice currentDevice].identifierForVendor UUIDString] ;
        NSLog(@"uuidStr ------ %@",identifierNumber);
        
    }else if (indexPath.row == 8){
        AddsController *ller = [[AddsController alloc]init];
        [self.navigationController pushViewController:ller animated:YES];
    }else if (indexPath.row == 9){
        LoginVC *ller = [[LoginVC alloc]init];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:ller];
        [self presentViewController:nav animated:YES completion:nil];
    }
    else if (indexPath.row == 10){
        QuantityViewController *ller = [[QuantityViewController alloc]init];
        [self.navigationController pushViewController:ller animated:YES];
    }
    else if (indexPath.row == 11){
        OrderViewController *ller = [[OrderViewController alloc]init];
        [self.navigationController pushViewController:ller animated:YES];
    }
    else if (indexPath.row == 12){
        DeadClosesController *ller = [[DeadClosesController alloc]init];
        [self.navigationController pushViewController:ller animated:YES];
    }
    else if(indexPath.row == 13){
        OrderDetailsController *ller = [[OrderDetailsController alloc]init];
        [self.navigationController pushViewController:ller animated:YES];
    }else if(indexPath.row == 14){
        BuyBuyVC *ller = [[BuyBuyVC alloc]init];
        [self.navigationController pushViewController:ller animated:YES];
    }
}
















@end
