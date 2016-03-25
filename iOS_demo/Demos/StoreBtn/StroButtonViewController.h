//
//  StroButtonViewController.h
//  LYBFunctionalModule
//
//  Created by 金中国 on 16/3/15.
//  Copyright © 2016年 金中国. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StorButton.h"
@interface StroButtonViewController : UIViewController<StorButtonDelegate>

@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet StorButton *storBut;
@end
