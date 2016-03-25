//
//  ScreenModel.m
//  iOS_demo
//
//  Created by 金中国 on 16/3/17.
//  Copyright © 2016年 jzg. All rights reserved.
//

#import "ScreenModel.h"
//型号版本
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
@implementation ScreenModel


- (UIButton *)returnViewXposition:(CGFloat)min_x andYposition:(CGFloat)min_y{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    CGFloat when = [self widthOfString:self.viewTitle font:[UIFont systemFontOfSize:15] height:100 maxWidth:1000] + 20;
    button.frame = CGRectMake(min_x, min_y, when, 30);
    [button setTitle:self.viewTitle forState:UIControlStateNormal];
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 5;
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    
    button.layer.borderWidth = 1;
    button.layer.borderColor = [UIColor grayColor].CGColor;
    
    return button;
}

-(CGFloat)widthOfString:(NSString *)string font:(UIFont*)font height:(CGFloat)height maxWidth:(CGFloat)maxWidth
{
    NSString * stringes = [NSString stringWithFormat:@"%@",string];
    if([stringes isEqualToString:@"<null>"] ||stringes.length == 0){
        return 20;
    }
    NSDictionary * dict=[NSDictionary dictionaryWithObject: font forKey:NSFontAttributeName];
    CGRect rect=[string boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, height) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    if (rect.size.width > maxWidth) {
        return maxWidth;
    }
    return rect.size.width;
}

@end
