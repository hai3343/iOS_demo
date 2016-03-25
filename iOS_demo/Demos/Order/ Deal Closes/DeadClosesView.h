//
//  DeadClosesView.h
//  iOS_demo
//
//  Created by 金中国 on 16/3/19.
//  Copyright © 2016年 jzg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DeadClosesModel.h"
typedef void(^OrderDetailsBlock)(DeadClosesModel * model);
@interface DeadClosesView : UIView

@property (nonatomic, strong)DeadClosesModel *model;
@property (nonatomic, strong)OrderDetailsBlock block;
@end
