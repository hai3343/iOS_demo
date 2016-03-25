//
//  NSDictionary+HBExtension.m
//  iOS_demo
//
//  Created by yik on 16/3/22.
//  Copyright © 2016年 jzg. All rights reserved.
//

#import "NSDictionary+HBExtension.h"

@implementation NSDictionary (HBExtension)
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        
        return nil;
    }
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *err;
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:    jsonData options:NSJSONReadingMutableContainers error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
        
    }

    return dic;
    
}
@end
