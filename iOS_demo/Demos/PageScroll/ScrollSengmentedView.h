//
//  ScrollSengmentedView.h
//  LYBFunctionalModule
//
//  Created by 金中国 on 16/3/14.
//  Copyright © 2016年 金中国. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ScrollSengmentedView;
@protocol ScrollSengmentedViewDelegate <NSObject>
- (void)segmentedView:(ScrollSengmentedView *)sengmented selectTitleinteger:(NSInteger )integer;

@end

@interface ScrollSengmentedView : UIView

@property (nonatomic, strong) UIScrollView *buttonScrollView;
@property (nonatomic, assign) NSInteger fontNumber; //字体 默认为17
@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) id <ScrollSengmentedViewDelegate>delegete;

- (void)setTitleAry:(NSArray *)titleAry;

- (void)displaySelect:(NSInteger)index;
@end
