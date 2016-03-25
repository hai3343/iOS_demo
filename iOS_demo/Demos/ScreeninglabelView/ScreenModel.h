//
//  ScreenModel.h
//  iOS_demo
//
//  Created by 金中国 on 16/3/17.
//  Copyright © 2016年 jzg. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  标签页 所需要的 模型
 *  基本框架不变   只需要传入 2组 所需要的 按钮 显示字串
 */

/**
 *  是否是整行
 */
//typedef NS_ENUM(NSInteger ,VIEW_FRAM_WRAP){
//    VIEW_FRAM_WRAP_NOWRAP = 0,  //不换行
//    VIEW_FRAM_WRAP_Wrap   = 1,  //换行    整行，当作是标题控制栏
//};
/**
 *  功能
 */
typedef NS_ENUM(NSInteger ,VIEW_FUNCTION){
    VIEW_FUNCTION_NO_REACTION   = 0,        //  无反应  按钮之外的
    VIEW_FUNCTION_COLOR         = 1,        //  按钮 变色选中
    VIEW_FUNCTION_FOLDED        = 2,        //  折叠
    VIEW_FUNCTION_TEXTFIELD                 //  按钮 点击后其上 文字 付给 可输入文本框
};
/**
 *  控件类型
 */
//typedef NS_ENUM(NSInteger ,VIEW_CLASS){
//    VIEW_CLASS_BUTTON = 0,      //按钮
//    VIEW_CLASS_LABLE  = 1,      //文本
//    VIEW_CLASS_TEXTFIELD  = 2,      //可输入框          每个子 view 只能有一个 可输入文本框
//    VIEW_CLASS_TEXTFIELD_ES         //可输入框组合 用于按钮点击后赋值
//};

typedef void(^BUTTONFUNCTIONBLOCK)(VIEW_FUNCTION function);

@interface ScreenModel : NSObject

//@property (nonatomic, assign)VIEW_CLASS     viewClass;
@property (nonatomic, strong)NSString       *viewTitle;
//@property (nonatomic, assign)VIEW_FRAM_WRAP wrap;
@property (nonatomic, assign)VIEW_FUNCTION  founth;
/**
 *  生成 所需要的 对象
 *
 *  @param min_x x  坐标
 *  @param min_y y  坐标
 *  @param block    所需要处理的事件
 *  @return 返回当前对象
 */
- (UIButton *)returnViewXposition:(CGFloat )min_x andYposition:(CGFloat)min_y;
@end
