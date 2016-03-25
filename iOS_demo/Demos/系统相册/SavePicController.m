//
//  SavePicController.m
//  iOS_demo
//
//  Created by yik on 16/3/17.
//  Copyright © 2016年 jzg. All rights reserved.
//

#import "SavePicController.h"

@interface SavePicController ()
@property (nonatomic,strong) UIImageView *image;
@end

@implementation SavePicController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.image = [UIImageView imageViewWithFrame:CGRectZero image:[UIImage imageNamed:@"broswerPic0.jpg"]];
    [self.view addSubview:self.image];
[self.image mas_makeConstraints:^(MASConstraintMaker *make) {
    make.size.mas_equalTo((CGSizeMake(300, 300)));
    make.centerX.mas_equalTo(self.view);
    make.centerY.mas_equalTo(self.view);
}];
//长按手势http://www.cnblogs.com/huangjianwu/p/4675648.html
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(save:)];
    //长按0.5秒
    longPress.minimumPressDuration = 0.5;
    longPress.numberOfTouchesRequired = 1;
    self.image.userInteractionEnabled = YES;
    //绑定手势
    [self.image addGestureRecognizer:longPress];
    
    
}
- (void)save:(UILongPressGestureRecognizer*)longPress
{
    //结束按压后调用
    if (longPress.state == UIGestureRecognizerStateEnded) {
        NSLog(@"点击了");
        //保存到相册
        UIGraphicsBeginImageContext(self.image.bounds.size);
        [self.image.layer renderInContext:UIGraphicsGetCurrentContext()];
        UIImage *temp = self.image.image;
        temp = [self imageWithImageSimple:temp scaledToSize:CGSizeMake(650, 800)];
        //UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        SEL selectorToCall = @selector(imageWasSavedSuccessfully:didFinishSavingWithError:contextInfo:);
        UIImageWriteToSavedPhotosAlbum(temp, self,selectorToCall, NULL);

    }

}
// 保存图片后到相册后，调用的相关方法，查看是否保存成功
- (void) imageWasSavedSuccessfully:(UIImage *)paramImage didFinishSavingWithError:(NSError *)paramError contextInfo:(void *)paramContextInfo{
    NSString *msg = nil;
    
    if (paramError == nil){
        msg = @"保存图片成功";
        [SVProgressHUD showSuccessWithStatus:msg];
        NSLog(@"Image was saved successfully.");

        //用时间给图片命名
        time_t now;
        time(&now);
        NSString *time_stamp  = [NSString stringWithFormat:@"%ld.jpg", now];
        [self saveImage:paramImage WithName:time_stamp];
    } else {
        msg = @"保存图片失败";
        [SVProgressHUD showErrorWithStatus:msg];
        NSLog(@"An error happened while saving the image.");
        NSLog(@"Error = %@", paramError);
    }
}
#pragma mark 保存图片到document
- (void)saveImage:(UIImage *)tempImage WithName:(NSString *)imageName
{
    //    NSData* imageData = UIImagePNGRepresentation(tempImage,0.5);
    NSData *imageData = UIImageJPEGRepresentation(tempImage,0.5);
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* documentsDirectory = [paths objectAtIndex:0];
    NSLog(@"%@",documentsDirectory);
    NSString* fullPathToFile = [documentsDirectory stringByAppendingPathComponent:imageName];
    [imageData writeToFile:fullPathToFile atomically:NO];
    //    [self saveToSys:tempImage];
}
#pragma mark - 修改图片尺寸
- (UIImage *)imageWithImageSimple:(UIImage *)image scaledToSize:(CGSize)newSize
{
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    //    [image drawInRect:CGRectMake(0,0,800,800)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end
