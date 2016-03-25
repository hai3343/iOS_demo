//
//  BaseTableView.m
//  YunTongXun
//
//  Created by DengYiyuan on 14-12-10.
//  Copyright (c) 2014年 jiaying. All rights reserved.
//

#import "BaseTableView.h"

@implementation BaseTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        [self _initView];
        _data = [[NSMutableArray alloc]init];
    }
    return self;
}

- (void)awakeFromNib {
    [self _initView];
}

#pragma mark -
#pragma mark UI methods
// 写成私有方法，防止子类override
- (void)_initView {
    self.backgroundColor = [UIColor clearColor];
    self.dataSource = self;
    self.delegate = self;
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.delaysContentTouches = NO;
    for (UIView *currentView in self.subviews) {
        if ([currentView isKindOfClass:[UIScrollView class]]) {
            ((UIScrollView *)currentView).delaysContentTouches = NO;
            break;
        }
    }
    self.backgroundColor = kColorSeven;
    // 初始化下拉控件
    [self createRefreshHeaderView];
    // 开启下拉刷新
    [self setRefreshHeader:YES];
}

//创建下拉刷新控件
- (void)createRefreshHeaderView {
    if (_refreshHeaderView == nil) {
        EGORefreshTableHeaderView *view = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0.0f, 0.0f - self.bounds.size.height, self.frame.size.width, self.bounds.size.height) withCtlClass:@""];
        view.delegate = self;
        _refreshHeaderView = view;
    }
}

//创建上拉加载更多控件
- (void)createRefreshFooterView {
    CGFloat height = MAX(self.contentSize.height, self.bounds.size.height);
    if (_refreshFooterView && [_refreshFooterView superview])
    {
        // reset position
        _refreshFooterView.frame = CGRectMake(0.0f, height, self.frame.size.width, self.bounds.size.height);
    }else
    {
        // create the footerView
        EGORefreshTableFooterView *view = [[EGORefreshTableFooterView alloc] initWithFrame:CGRectMake(0.0f, height, self.frame.size.width, self.bounds.size.height)];
        view.delegate = self;
        _refreshFooterView = view;
        [self addSubview:_refreshFooterView];
    }
    
    //  update the last update date
    [_refreshFooterView refreshLastUpdatedDate];
}

//移除上拉加载更多控件
- (void)removeRefreshFooterView {
    if (_refreshFooterView && [_refreshFooterView superview])
    {
        [_refreshFooterView removeFromSuperview];
    }
    _refreshFooterView = nil;
}

//无内容时的默认图
- (void)setNoDataDefaultView {
    if (_defaultView == nil){
        _defaultView = [[UIView alloc] initWithFrame:_tableView.bounds];
        _defaultView.backgroundColor = kColorSeven;
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake((Screen_Width-90)/2, (self.height - 118)/2 -40, 90, 118)];
        imageView.image = [UIImage imageNamed:@"icon_wait"];
        [_defaultView addSubview:imageView];
        [self addSubview:_defaultView];
    }
}

//移除内容时的默认图
- (void)removeNoDataDefaultView {
    if (_defaultView && [_defaultView superview])
    {
        for (UIView *view in _defaultView.subviews) {
            [view removeFromSuperview];
        }
        [_defaultView removeFromSuperview];
    }
    _defaultView = nil;
}

#pragma mark -
#pragma mark Setter methods

- (void)setRefreshHeader:(BOOL)refreshHeader {
    _refreshHeader = refreshHeader;
    
    if (_refreshHeader) {
        [self addSubview:_refreshHeaderView];
        //  update the last update date
        [_refreshHeaderView refreshLastUpdatedDate];
    }else {
        if ([_refreshHeaderView superview]) {
            [_refreshHeaderView removeFromSuperview];
        }
        _refreshHeaderView = nil;
    }
}

//是否需要上拉setter方法
- (void)setRefreshFooter:(BOOL)refreshFooter {
    _refreshFooter = refreshFooter;
    
    if (_refreshFooter) {
        [self createRefreshFooterView];
    }else {
        [self removeRefreshFooterView];
    }
}

//是否还有下一页，有则开启上拉加载
- (void)setIsMore:(BOOL)isMore {
    _isMore = isMore;
    
    if (_isMore) {
        [self setRefreshFooter:YES];
    }else
        [self setRefreshFooter:NO];
}

#pragma mark -
#pragma mark Action methods
//下拉
- (void)pullDown:(UITableView *)tableView {
    // 供子类继承和调用
}

//上拉
- (void)pullUp:(UITableView *)tableView {
    // 供子类继承和调用
}

//刷新数据
- (void)refreshData {
    [_refreshHeaderView forceToRefresh:self];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat height;
    if ([self.eventDelegate respondsToSelector:@selector(tableView:heightForRowAtIndexPath:)]) {
        height = [self.eventDelegate tableView:self heightForRowAtIndexPath:indexPath];
    }
    return height;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.eventDelegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)]) {
        [self.eventDelegate tableView:tableView didSelectRowAtIndexPath:indexPath];
    }
}
#pragma mark -
#pragma mark Data Source Loading / Reloading Methods

- (void)reloadTableViewDataSource {
    _reloading = YES;
}

- (void)doneLoadingTableViewData {
    _reloading = NO;
    if (_isPullDown) {
        [_refreshHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:self];
    }
    else {
        [_refreshFooterView egoRefreshScrollViewDataSourceDidFinishedLoading:self];
    }
    
    if (self.data.count == 0) {
        [self setNoDataDefaultView];
    }else {
        [self removeNoDataDefaultView];
    }
    [self reloadData];
}

#pragma mark -
#pragma mark UIScrollViewDelegate Methods
//当滚动时，实时调用此方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (_refreshHeaderView.superview) {
        [_refreshHeaderView egoRefreshScrollViewDidScroll:scrollView];
    }
    if (_refreshFooterView.superview) {
        [_refreshFooterView egoRefreshScrollViewDidScroll:scrollView];
    }
}

//手指停止拖拽时调用
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    if (_refreshHeaderView.superview) {
        [_refreshHeaderView egoRefreshScrollViewDidEndDragging:scrollView];
    }
    if (_refreshFooterView.superview) {
        [_refreshFooterView egoRefreshScrollViewDidEndDragging:scrollView];
    }
}

#pragma mark -
#pragma mark EGORefreshTableDelegate
//下拉到一定距离，手指放开时调用
- (void)egoRefreshTableDidTriggerRefresh:(EGORefreshPos)aRefreshPos {
    [self reloadTableViewDataSource];
    
    if (aRefreshPos == 0) {
        _isPullDown = YES;
        if ([self.eventDelegate respondsToSelector:@selector(pullDown:)]) {
            [self.eventDelegate pullDown:self];
        }
    }else {
        _isPullDown = NO;
        if ([self.eventDelegate respondsToSelector:@selector(pullUp:)]) {
            [self.eventDelegate pullUp:self];
        }
    }
}

- (BOOL)egoRefreshTableDataSourceIsLoading:(UIView *)view {
    return _reloading; // should return if data source model is reloading
}

- (NSDate *)egoRefreshTableDataSourceLastUpdated:(UIView *)view {
    return [NSDate date]; // should return date data source was last changed
}

@end
