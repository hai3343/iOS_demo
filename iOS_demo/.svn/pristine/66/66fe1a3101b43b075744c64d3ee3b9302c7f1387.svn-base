//
//  OpenCamerController.m
//  iOS_demo
//
//  Created by yik on 16/3/17.
//  Copyright © 2016年 jzg. All rights reserved.
//

#import "OpenCamerController.h"

@interface OpenCamerController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@end

@implementation OpenCamerController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    UIButton *opencamer = [UIButton buttonWithType:UIButtonTypeCustom title:@"打开相机" titleFont:20 titleColor:[UIColor yellowColor] backgroundColor:[UIColor blueColor] target:self selector:@selector(opencamer)];
    [self.view addSubview:opencamer];
    [opencamer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.top.mas_equalTo(self.view).offset(100);
        make.size.mas_equalTo(CGSizeMake(200, 40));
    }];
    
    UIButton *openpic = [UIButton buttonWithType:UIButtonTypeCustom title:@"打开相册" titleFont:20 titleColor:[UIColor yellowColor] backgroundColor:[UIColor blueColor] target:self selector:@selector(openPic)];
    [self.view addSubview:openpic];
    [openpic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.top.mas_equalTo(opencamer).offset(50);
        make.size.mas_equalTo(CGSizeMake(200, 40));
    }];
    
    
    
    
    
}
- (void)openPic
{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    //照片源
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    // 编辑模式
    imagePicker.allowsEditing = YES;
    [self  presentViewController:imagePicker animated:YES completion:^{
    }];



}
- (void)opencamer
{
    // UIImagePickerControllerCameraDeviceRear 后置摄像头
    // UIImagePickerControllerCameraDeviceFront 前置摄像头
    BOOL isCamera = [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
    if (!isCamera) {
        NSLog(@"没有摄像头");
        return ;
    }
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    
    imagePicker.delegate = self;
    //照片源
    imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    // 编辑模式
    imagePicker.allowsEditing = YES;
    [self  presentViewController:imagePicker animated:YES completion:^{
    }];



}
#pragma mark - UIImagePickerControllerDelegate
// 选中照片
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    // UIImagePickerControllerOriginalImage 原始图片
    // UIImagePickerControllerEditedImage 编辑后图片
    
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    //把图片转换成imageDate格式 转二进制时压缩
//    NSData *imageData = UIImageJPEGRepresentation(image, 0.5);

    //压缩图片
    image = [self imageWithImageSimple:image scaledToSize:CGSizeMake(800, 800)];
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}
// 取消相册
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:NULL];
}
//NSData * UIImageJPEGRepresentation ( UIImage *image, CGFloat compressionQuality)
#pragma mark - 压缩图片
- (UIImage *)imageWithImageSimple:(UIImage *)image scaledToSize:(CGSize)newSize
{
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
//    [image drawInRect:CGRectMake(0,0,800,800)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

-(NSData *)imageData:(UIImage *)myimage

{
    
    NSData *data=UIImageJPEGRepresentation(myimage, 1.0);
    
    if (data.length>100*1024) {
        
        if (data.length>1024*1024) {//1M以及以上
            
            data=UIImageJPEGRepresentation(myimage, 0.1);
            
        }else if (data.length>512*1024) {//0.5M-1M
            
            data=UIImageJPEGRepresentation(myimage, 0.5);
            
        }else if (data.length>200*1024) {//0.25M-0.5M
            
            data=UIImageJPEGRepresentation(myimage, 0.9);
            
        }
        
    }
    
    return data;
    
}











@end
