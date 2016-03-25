//
//  Helper.m
//  PalmKitchen
//
//  Created by apple on 14-10-14.
//  Copyright (c) 2014年 apple. All rights reserved.
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"




#import "Helper.h"
#import <Accelerate/Accelerate.h>
@implementation Helper

+(UIButton *)createButton:(CGRect)frame title:(NSString *)title image:(UIImage *)image target:(id)target selector:(SEL)selector
{
    UIButton * button=[UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:image forState:UIControlStateNormal];
    button.frame=frame;
    CGRect newFrame=frame;
    newFrame.origin.y=frame.size.height/2.0;
    newFrame.size.height=frame.size.height/2.0;
    newFrame.origin.x=0;
    UILabel * label=[[UILabel alloc]initWithFrame:newFrame];
    label.text=title;
    [button addSubview:label];
    label.font=[UIFont systemFontOfSize:12];
    label.backgroundColor=[UIColor clearColor];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    return button;
}
//获取磨砂图片
+ (UIImage *)blurryImage:(UIImage *)image withBlurLevel:(CGFloat)blur
{
    //模糊度,
    if ((blur < 0.1f) || (blur > 2.0f)) {
        blur = 0.5f;
    }
    
    //boxSize必须大于0
    int boxSize = (int)(blur * 100);
    boxSize -= (boxSize % 2) + 1;
    // boxSize = 29;
    // NSLog(@"boxSize:%i",boxSize);
    //图像处理
    CGImageRef img = image.CGImage;
    //需要引入#import <Accelerate/Accelerate.h>
    /*
     This document describes the Accelerate Framework, which contains C APIs for vector and matrix math, digital signal processing, large number handling, and image processing.
     本文档介绍了Accelerate Framework，其中包含C语言应用程序接口（API）的向量和矩阵数学，数字信号处理，大量处理和图像处理。
     */
    
    //图像缓存,输入缓存，输出缓存
    vImage_Buffer inBuffer, outBuffer;
    vImage_Error error;
    //像素缓存
    void *pixelBuffer;
    
    //数据源提供者，Defines an opaque type that supplies Quartz with data.
    CGDataProviderRef inProvider = CGImageGetDataProvider(img);
    // provider’s data.
    CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);
    
    //宽，高，字节/行，data
    inBuffer.width = CGImageGetWidth(img);
    inBuffer.height = CGImageGetHeight(img);
    inBuffer.rowBytes = CGImageGetBytesPerRow(img);
    inBuffer.data = (void*)CFDataGetBytePtr(inBitmapData);
    
    //像数缓存，字节行*图片高
    pixelBuffer = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));
    
    outBuffer.data = pixelBuffer;
    outBuffer.width = CGImageGetWidth(img);
    outBuffer.height = CGImageGetHeight(img);
    outBuffer.rowBytes = CGImageGetBytesPerRow(img);
    
    
    // 第三个中间的缓存区,抗锯齿的效果
    void *pixelBuffer2 = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));
    vImage_Buffer outBuffer2;
    outBuffer2.data = pixelBuffer2;
    outBuffer2.width = CGImageGetWidth(img);
    outBuffer2.height = CGImageGetHeight(img);
    outBuffer2.rowBytes = CGImageGetBytesPerRow(img);
    
    //Convolves a region of interest within an ARGB8888 source image by an implicit M x N kernel that has the effect of a box filter.
    
    error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer2, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    //error = vImageBoxConvolve_ARGB8888(&outBuffer2, &inBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    
    error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    
    
    if (error) {
        NSLog(@"error from convolution %ld", error);
    }
    
    
    //    NSLog(@"字节组成部分：%zu",CGImageGetBitsPerComponent(img));
    //颜色空间DeviceRGB
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    //用图片创建上下文,CGImageGetBitsPerComponent(img),7,8
    CGContextRef ctx = CGBitmapContextCreate(
                                             outBuffer.data,
                                             outBuffer.width,
                                             outBuffer.height,
                                             8,
                                             outBuffer.rowBytes,
                                             colorSpace,
                                             CGImageGetBitmapInfo(image.CGImage));
    
    //根据上下文，处理过的图片，重新组件
    CGImageRef imageRef = CGBitmapContextCreateImage (ctx);
    UIImage *returnImage = [UIImage imageWithCGImage:imageRef];
    
    //clean up
    CGContextRelease(ctx);
    CGColorSpaceRelease(colorSpace);
    
    free(pixelBuffer);
    free(pixelBuffer2);
    CFRelease(inBitmapData);
    
    CGColorSpaceRelease(colorSpace);
    CGImageRelease(imageRef);
    
    return returnImage;
}

+(CGFloat)widthOfString:(NSString *)string font:(UIFont *)font height:(CGFloat)height
{
   // NSLog(@"  string  %@ ",string);
    NSString * stringes = [NSString stringWithFormat:@"%@",string];
    if([stringes isEqualToString:@"<null>"]){
        return 20;
    }
    NSDictionary * dict=[NSDictionary dictionaryWithObject: font forKey:NSFontAttributeName];
    CGRect rect=[string boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, height) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    return rect.size.width;
}
//文字高度
+(CGFloat)heightOfString:(NSString *)string font:(UIFont *)font width:(CGFloat)width
{
    CGRect bounds;
    NSString * stringes = [NSString stringWithFormat:@"%@",string];
    if([stringes isEqualToString:@"<null>"]){
        string = @"null";
    }
    if (IOS_VERSION >= 7.0) {
        NSDictionary * parameterDict=[NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
        bounds=[string boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:parameterDict context:nil];
    }
    else{
        bounds.size = [string sizeWithFont:font forWidth:width lineBreakMode:NSLineBreakByWordWrapping];
    }
    
    return bounds.size.height;
}

//#pragma mark - 计算时间差
////isStart 为月份跳过来进来初始化，，NO为以排好顺序的
//+ (NSArray *)getDayWeekesNum:(NSString *)year AndBeformTim:(NSString *)month AndAppointDay:(NSString *)day AndIntialization:(BOOL)isStart{//时间格式00-00-00
//    
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    [formatter setDateFormat:@"yyyy-MM-dd"];
//    NSInteger weeknum = [self timeWeekData:year AndMonth:month AndDay:day];
//    NSString *string = [NSString stringWithFormat:@"%@-%@-%@",year,month,day];
//    NSDate *date01 = [formatter dateFromString:string];
//    NSMutableArray *arrTotal = [[NSMutableArray alloc]init];
//    
//    for(NSInteger index = 6+weeknum; index >= weeknum -14;index--){
//        NSDate *date001 = [NSDate dateWithTimeInterval:-index*60*60*24 sinceDate:date01];
//        [arrTotal addObjectsFromArray:[self getnsstringTime:[formatter stringFromDate:date001] AndText:@"-"]];
//    }
//    return arrTotal;
//}
#pragma mark - 切割字符串
+ (NSArray *)getnsstringTime:(NSString *)timetxt AndText:(NSString *)sign{
    NSArray *array =[timetxt componentsSeparatedByString:sign];
    NSMutableArray *timeArr = [[NSMutableArray alloc]init];
    for(NSString *timex in array){
        if(![timex isEqualToString:@""]){
            [timeArr addObject:timex];
        }
    }
    return timeArr;
}
#pragma mark - 时间字符串转换成当时发表的时间
+ (NSString *)thatTime:(NSString*)time
{
    long long int num = [time longLongValue]/1000;//（重点）一定要用长长整形来解析。不然数据会因为超出内存而失真
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:@"YYYY.MM.dd HH:mm:ss"];
    
    NSDate*confromTimesp = [NSDate dateWithTimeIntervalSince1970:num];
    NSString*Str = [formatter stringFromDate:confromTimesp];
    return Str;
}

#pragma mark - 时间解析 发表时距离现在多久
+ (NSString*)timePlease:(NSString*)time
{
    //获取今天的日期
    //    NSDate *today = [NSDate date];
    NSTimeInterval timess=[[NSDate date] timeIntervalSince1970]*1000;//毫秒
    long long int date = (long long int)timess;
    long long int timeas = [time floatValue];
    long long int tims = (date - timeas)/1000;
    if(tims/60<=0)
    {
        //确定为秒
        return [NSString stringWithFormat:@"%lld秒前",tims];
    }else if(tims/3600<1){
        //确定为分
        return [NSString stringWithFormat:@"%lld分钟前",tims/60];
    }else if(tims/3600/24<1){
        //确定为小时
        return [NSString stringWithFormat:@"%lld小时前",tims/3600];
    }else if(tims/3600/24/30<1){
        //确定为天，以30天月份计算
        return [NSString stringWithFormat:@"%lld天前",tims/3600/24];
    }else if(tims/3600/24/365<1){
        //确定为月，以30天月份计算
        return [NSString stringWithFormat:@"%lld月前",tims/3600/24/30];
    }else{
        //确定为年，以365天计算
        return [NSString stringWithFormat:@"%lld年前",tims/3600/24/365];
    }
}
#pragma  mark - 获取当天的日期：年月日
+ (NSDictionary *)getTodayDate
{
    NSCalendar *calendar;
    if(IOS_VERSION >=8.0){
        calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    }else{
        calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
    }
    NSDateComponents *comps = [[NSDateComponents alloc]init];
    NSInteger unitflags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDate *now = [NSDate date];
    comps = [calendar components:unitflags fromDate:now];
    NSInteger year = [comps year];
    NSInteger week = [comps weekday];
    NSInteger monthes = [comps month];
    NSInteger dayes = [comps day];
    NSInteger hour = [comps hour];
    NSInteger min = [comps minute];
    NSInteger sec = [comps second];
    //获取今天的日期
    //    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSMutableDictionary *todayDic = [[NSMutableDictionary alloc] init];
    [todayDic setObject:[NSString stringWithFormat:@"%@",@(year)] forKey:@"year"];
    [todayDic setObject:[NSString stringWithFormat:(monthes < 10 ? @"0%@":@"%@"),@(monthes)] forKey:@"month"];
     [todayDic setObject:[NSString stringWithFormat:(dayes < 10 ? @"0%@":@"%@"),@(dayes)] forKey:@"day"];
    [todayDic setObject:@(week) forKey:@"week"];//周(1:周日，2:周一。。。。。)
    [todayDic setObject:@(hour) forKey:@"hour"];
    [todayDic setObject:@(min) forKey:@"minute"];
    [todayDic setObject:@(sec) forKey:@"second"];
    return todayDic;
}


//计算时间差
+ (NSString *)timePleaseAgoTime:(NSString *)timeAgo{
    NSTimeInterval timess=[[NSDate date] timeIntervalSince1970] *1000;//毫秒
    long long int date = (long long int)timess;
//    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
//    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
////    NSDate *timses = [NSDate ]
////    long long int tims = [[NSDate date]timeIntervalSince1970] *1000;
//    NSDate *dateOne = [NSDate date];
//    NSDate *dateOne = [NSDate dateWithTimeIntervalSince1970:timess];
//    
//    NSDate *dateTwo = [NSDate dateWithTimeIntervalSince1970:[timeAgo longLongValue]];

//    NSTimeInterval secondsBetweenDates= [dateOne timeIntervalSinceDate:dateTwo];
    long long int tims = [timeAgo longLongValue];
    long long int timeNums = (date - tims)/1000;
    
    if(timeNums/3600/24 >= 1){
        return [NSString stringWithFormat:@"%lld",tims/3600/24];
    }
    
    return @"";
}


//邮箱
+ (BOOL) justEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}
//手机号码验证
+ (BOOL) justMobile:(NSString *)mobile
{
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}


//车牌号验证
+ (BOOL) justCarNo:(NSString *)carNo
{
    NSString *carRegex = @"^[\u4e00-\u9fa5]{1}[a-zA-Z]{1}[a-zA-Z_0-9]{4}[a-zA-Z_0-9_\u4e00-\u9fa5]$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",carRegex];
    NSLog(@"carTest is %@",carTest);
    return [carTest evaluateWithObject:carNo];
}


//车型
+ (BOOL) justCarType:(NSString *)CarType
{
    NSString *CarTypeRegex = @"^[\u4E00-\u9FFF]+$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",CarTypeRegex];
    return [carTest evaluateWithObject:CarType];
}


//用户名
+ (BOOL) justUserName:(NSString *)name
{
    NSString *userNameRegex = @"^[A-Za-z0-9]{6,20}+$";
    NSPredicate *userNamePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",userNameRegex];
    BOOL B = [userNamePredicate evaluateWithObject:name];
    return B;
}


//密码
+ (BOOL) justPassword:(NSString *)passWord
{
    NSString *passWordRegex = @"^[a-zA-Z0-9_]{6,14}+$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    return [passWordPredicate evaluateWithObject:passWord];
}


//昵称
+ (BOOL) justNickname:(NSString *)nickname
{
    NSString *nicknameRegex = @"^[\u4e00-\u9fa5]{4,8}$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",nicknameRegex];
    return [passWordPredicate evaluateWithObject:nickname];
}


//身份证号
+ (BOOL) justIdentityCard: (NSString *)identityCard
{
    BOOL flag;
    if (identityCard.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:identityCard];
}
@end
#pragma clang diagnostic pop
