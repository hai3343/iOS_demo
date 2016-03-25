//
//  StorButton.h
//  LYBFunctionalModule
//
//  Created by 金中国 on 16/3/15.
//  Copyright © 2016年 金中国. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, STOR_INTEGER){
    STOR_INTEGER_UP = 0,    //向上
    STOR_INTEGER_DOWN = 1   //向下
};
@class StorButton;
@protocol StorButtonDelegate <NSObject>
- (void)returnButton:(StorButton *)stor andStor:(STOR_INTEGER)buttonStor;

@end
@interface StorButton : UIView
@property (nonatomic, strong)id<StorButtonDelegate>delegate;
//自定义 声明函数
- (instancetype)initWithFrame:(CGRect)frame andTitle:(NSString *)title;

//若 拖动，则调用这个函数实现
- (void)layoutView:(NSString *)title;

//刷新 状态 重置为 未选中
- (void)reloadButtonStor;
@end
