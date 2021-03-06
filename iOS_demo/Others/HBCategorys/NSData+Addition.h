//
//  NSData+Addition.h
//  Line0
//
//  Created by line0 on 12-12-5.
//  Copyright (c) 2012年 line0. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (Addition)
/**
 *  对象转为Data
 *
 *  @param object 传入的对象
 *
 *  @return 返回Data
 */
+ (NSData *)dataWithObject:(id)object;
/**
 *  Data转为对象
 *
 *  @return 对象
 */
- (id)convertDataToObject;

@end
