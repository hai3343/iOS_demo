//
//  NSString+HBExtension.m
//  Category
//
//  Created by lik on 15/8/15.
//  Copyright (c) 2015年 jzg. All rights reserved.
//

#import "NSString+HBExtension.h"

@implementation NSString (HBExtension)

-(CGSize)sizeWithFont:(UIFont *)font andMaxSize:(CGSize)maxSize
{
    return  [self boundingRectWithSize:maxSize options:\
             NSStringDrawingTruncatesLastVisibleLine |
             NSStringDrawingUsesLineFragmentOrigin |
             NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:font} context:nil].size;
}
+ (NSString*)dictionaryToJson:(NSDictionary *)dic

{
    
    NSError *parseError = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
}
@end
