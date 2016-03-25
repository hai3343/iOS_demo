//
//  ActionPresenter.h
//  MVPTest
//
//  Created by yik on 16/3/4.
//  Copyright © 2016年 jzg. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ActionProtocol <NSObject>
/**数据存储接口**/
- (void)writeData:(id)views;
/***数据读取接口***/
- (void)readData:(id)views;
@end
