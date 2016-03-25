//
//  Helper.h
//  PalmKitchen
//
//  Created by apple on 14-10-14.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//型号版本
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

@interface Helper : NSObject
//获取磨砂图片
+ (UIImage *)blurryImage:(UIImage *)image withBlurLevel:(CGFloat)blur;

+(UIButton *)createButton:(CGRect)frame title:(NSString *)title image:(UIImage *)image target:(id)target selector:(SEL)selector;

//字符串文字的长度
+(CGFloat)widthOfString:(NSString *)string font:(UIFont*)font height:(CGFloat)height;

//字符串文字的高度
+(CGFloat)heightOfString:(NSString *)string font:(UIFont*)font width:(CGFloat)width;

//获取今天的日期：年月日
+(NSDictionary *)getTodayDate;

////通过年月日来获取他的兴起几3
//+(NSInteger)timeWeekData:(NSString *)year AndMonth:(NSString *)month AndDay:(NSString *)day;
//字符串切割
+ (NSArray *)getnsstringTime:(NSString *)timetxt AndText:(NSString *)sign;
//计算时间差
+ (NSString *)timePleaseAgoTime:(NSString *)timeAgo;
//邮箱
+ (BOOL) justEmail:(NSString *)email;

//手机号码验证
+ (BOOL) justMobile:(NSString *)mobile;

//车牌号验证
+ (BOOL) justCarNo:(NSString *)carNo;

//车型
+ (BOOL) justCarType:(NSString *)CarType;

//用户名
+ (BOOL) justUserName:(NSString *)name;

//密码
+ (BOOL) justPassword:(NSString *)passWord;

//昵称
+ (BOOL) justNickname:(NSString *)nickname;

//身份证号
+ (BOOL) justIdentityCard: (NSString *)identityCard;


@end


