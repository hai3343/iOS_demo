//
//  JPick.h
//  JPick
//
//  Created by xcb on 16/1/23.
//  Copyright © 2016年 xcb. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, DATAPICK_TYPE){
    DATAPICK_TYPEMIDDLE = 0,
    DATAPICK_TYPEBOTTOM
};
@interface YTDatePick : UIView
@property (nonatomic, retain) NSDate *ScrollToDate;//滚到指定日期
/**
 *  时间选择器
 *
 *  @param selectArea 时间 选择好后 代理回调
 *  @param type       居中 ／ 底部
 */
+ (void)showPickWithMakeSure:(void(^)(id year, id month, id  day))selectArea andDatapickType:(DATAPICK_TYPE)type;

@end
