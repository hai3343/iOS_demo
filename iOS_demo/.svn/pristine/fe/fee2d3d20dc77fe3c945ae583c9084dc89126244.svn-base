//
//  QuantityChoiceview.h
//  iOS_demo
//
//  Created by 金中国 on 16/3/18.
//  Copyright © 2016年 jzg. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QuantityChoiceview;
@protocol QuantityChoiceviewDelegate <NSObject>

- (void)QuantityChoiceview:(QuantityChoiceview *)quantityChoiceview andSelectedNumber:(NSString *)number;
@end
@interface QuantityChoiceview : UIView<UITextFieldDelegate>

@property (nonatomic, strong)id <QuantityChoiceviewDelegate>delegate;
@property (nonatomic, strong)NSString *numText;
@end
