//
//  UIImage+HBExtension.m
//  TZBMain
//
//  Created by yik on 16/1/28.
//  Copyright © 2016年 jzg. All rights reserved.
//

#import "UIImage+HBExtension.h"

@implementation UIImage (HBExtension)
-(UIImage *)resizableImage
{
    return  [self resizableImageWithCapInsets:UIEdgeInsetsMake(self.size.height/2, self.size.width/2, self.size.height/2, self.size.width/2) resizingMode:UIImageResizingModeTile];
}

@end
