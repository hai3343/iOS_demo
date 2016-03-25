//
//  ScrollSengmentedView.m
//  LYBFunctionalModule
//
//  Created by 金中国 on 16/3/14.
//  Copyright © 2016年 金中国. All rights reserved.
//

#import "ScrollSengmentedView.h"
#import "Helper.h"
@implementation ScrollSengmentedView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self loadView];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self loadView];
    }
    return self;
}
- (void)loadView{
    self.buttonScrollView = [[UIScrollView alloc]initWithFrame:self.bounds];
    [self addSubview:self.buttonScrollView];
    self.buttonScrollView.showsVerticalScrollIndicator = YES;
    self.buttonScrollView.pagingEnabled = YES;
}

- (void)setTitleAry:(NSArray *)titleAry{
    if (!_fontNumber) {
        _fontNumber = 17;
    }
    
    CGFloat min_x = 10;
    [self.buttonScrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    if (!_backView) {
        _backView = [[UIView alloc]initWithFrame:CGRectMake(min_x, 0, [Helper widthOfString:[titleAry objectAtIndex:0] font:[UIFont systemFontOfSize:_fontNumber] height:100] + 20, 50)];
        _backView.backgroundColor = [UIColor redColor];
    }
    [self.buttonScrollView addSubview:_backView];
    
    for (NSInteger index = 0; index < titleAry.count; index++) {
        UIButton *select = [UIButton buttonWithType:UIButtonTypeCustom];
        select.frame = CGRectMake(min_x, 0, [Helper widthOfString:[titleAry objectAtIndex:index] font:[UIFont systemFontOfSize:_fontNumber] height:100] + 20, 50);
        [select setTitle:[titleAry objectAtIndex:index] forState:UIControlStateNormal];
        [select setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [select setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [select addTarget:self action:@selector(selectUP:) forControlEvents:UIControlEventTouchUpInside];
        select.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 10, 0);
        select.tag = 100 + index;
        [self.buttonScrollView addSubview:select];
        
        min_x = select.frame.origin.x + select.frame.size.width;
    }
    
    self.buttonScrollView.contentSize = CGSizeMake(min_x, 0);
}

- (void)displaySelect:(NSInteger)index{
    UIButton *button = (UIButton *)[self.buttonScrollView viewWithTag:index+100];
    [self selectUP:button];
}

- (void)selectUP:(UIButton *)senter{
    [UIView animateWithDuration:0.3 animations:^{
        _backView.frame = senter.frame;
    }];
    if ([_delegete respondsToSelector:@selector(segmentedView:selectTitleinteger:)]) {
        [_delegete segmentedView:self selectTitleinteger:senter.tag - 100];
    }
}
@end
