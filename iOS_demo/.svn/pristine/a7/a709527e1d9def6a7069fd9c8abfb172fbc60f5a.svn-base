//
//  BaseTableView.h
//  YunTongXun
//
//  Created by DengYiyuan on 14-12-10.
//  Copyright (c) 2014年 jiaying. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGORefreshTableHeaderView.h"
#import "EGORefreshTableFooterView.h"
#import "DrowButtonTableView.h"

@class BaseTableView;
@protocol UITableViewEventDelegate <NSObject>
@optional
//下拉
- (void)pullDown:(BaseTableView *)tableView;
//上拉
- (void)pullUp:(BaseTableView *)tableView;

- (CGFloat)tableView:(BaseTableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;

-(void)tableView:(BaseTableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface BaseTableView : DrowButtonTableView<UITableViewDataSource,UITableViewDelegate,EGORefreshTableDelegate> {
    UIButton *_leftBackItem;
    DrowButtonTableView *_tableView;
    UIView *_defaultView;
    
    EGORefreshTableHeaderView *_refreshHeaderView;
    EGORefreshTableFooterView *_refreshFooterView;
    BOOL _reloading;
    BOOL _isPullDown;  //区分上下拉，yes为下拉
}

@property (nonatomic, assign) BOOL refreshHeader; //是否需要下拉效果,默认开启
@property (nonatomic, assign) BOOL refreshFooter; //是否需要上拉效果
@property (nonatomic, assign) BOOL isMore;        //是否还有更多（下一页）
@property (nonatomic, assign) id<UITableViewEventDelegate> eventDelegate; 

@property (nonatomic, strong) NSMutableArray *data;

//下拉
- (void)pullDown:(UITableView *)tableView;
//上拉
- (void)pullUp:(UITableView *)tableView;

- (void)doneLoadingTableViewData;
//刷新数据
- (void)refreshData;

@end
