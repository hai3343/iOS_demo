//
//  CamerasController.m
//  iOS_demo
//
//  Created by yik on 16/3/16.
//  Copyright © 2016年 jzg. All rights reserved.
//

#import "CamerasController.h"
#import "LGPhoto.h"
@interface CamerasController ()<UITableViewDelegate,UITableViewDataSource,LGPhotoPickerBrowserViewControllerDelegate,LGPhotoPickerBrowserViewControllerDataSource,LGPhotoPickerViewControllerDelegate>
@property (nonatomic,strong) NSArray* dataArr;
/**图片显示器分类**/
@property (nonatomic, assign) LGShowImageType showType;
@property (nonatomic, strong)NSMutableArray *LGPhotoPickerBrowserPhotoArray;
@property (nonatomic, strong)NSMutableArray *LGPhotoPickerBrowserURLArray;
@end

@implementation CamerasController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
        UITableView *table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, Screen_Height) style:UITableViewStylePlain];
    table.rowHeight = 70;
    table.delegate = self;
    table.dataSource = self;
    [self.view addSubview:table];
    _dataArr = @[@"照片选择器",@"照片浏览器",@"网络图片浏览器",@"单张拍照",@"手动连拍"];
    [self prepareForPhotoBroswerWithImage];
    [self prepareForPhotoBroswerWithURL];

}

/**
 *  给照片浏览器传image的时候先包装成LGPhotoPickerBrowserPhoto对象
 */
- (void)prepareForPhotoBroswerWithImage {
    self.LGPhotoPickerBrowserPhotoArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < 5; i++) {
        LGPhotoPickerBrowserPhoto *photo = [[LGPhotoPickerBrowserPhoto alloc] init];
        photo.photoImage = [UIImage imageNamed:[NSString stringWithFormat:@"broswerPic%d.jpg",i]];
        [self.LGPhotoPickerBrowserPhotoArray addObject:photo];
    }
}
/**
 *  给照片浏览器传URL的时候先包装成LGPhotoPickerBrowserPhoto对象
 */
- (void)prepareForPhotoBroswerWithURL {
    self.LGPhotoPickerBrowserURLArray = [[NSMutableArray alloc] init];
    
    LGPhotoPickerBrowserPhoto *photo = [[LGPhotoPickerBrowserPhoto alloc] init];
    photo.photoURL = [NSURL URLWithString:@"http://img.ivsky.com/img/bizhi/slides/201511/11/december.jpg"];
    [self.LGPhotoPickerBrowserURLArray addObject:photo];
    
    LGPhotoPickerBrowserPhoto *photo1 = [[LGPhotoPickerBrowserPhoto alloc] init];
    photo1.photoURL = [NSURL URLWithString:@"http://h.hiphotos.baidu.com/image/pic/item/267f9e2f0708283890f56e02bb99a9014c08f128.jpg"];
    [self.LGPhotoPickerBrowserURLArray addObject:photo1];
    
    LGPhotoPickerBrowserPhoto *photo2 = [[LGPhotoPickerBrowserPhoto alloc] init];
    photo2.photoURL = [NSURL URLWithString:@"http://a.hiphotos.baidu.com/image/pic/item/b219ebc4b74543a9fa0c4bc11c178a82b90114a3.jpg"];
    [self.LGPhotoPickerBrowserURLArray addObject:photo2];
    
    LGPhotoPickerBrowserPhoto *photo3 = [[LGPhotoPickerBrowserPhoto alloc] init];
    photo3.photoURL = [NSURL URLWithString:@"http://c.hiphotos.baidu.com/image/pic/item/024f78f0f736afc33b1dbe65b119ebc4b7451298.jpg"];
    [self.LGPhotoPickerBrowserURLArray addObject:photo3];
    
    LGPhotoPickerBrowserPhoto *photo4 = [[LGPhotoPickerBrowserPhoto alloc] init];
    photo4.photoURL = [NSURL URLWithString:@"http://d.hiphotos.baidu.com/image/pic/item/77094b36acaf2edd481ef6e78f1001e9380193d5.jpg"];
    [self.LGPhotoPickerBrowserURLArray addObject:photo4];
}
/**
 *  初始化相册选择器
 */
- (void)initPhotoPickerViewControllerWithStyle:(LGShowImageType)style
{
    LGPhotoPickerViewController *pick = [[LGPhotoPickerViewController alloc] init];
    // 状态组
    pick.status = PickerViewShowStatusPhotoStream;
    pick.maxCount = 9;   // 最多能选9张图片
    pick.delegate = self;
    self.showType = style;
    [pick showPickerVc:self];


}
/**
 *  初始化图片浏览器
 */
- (void)pushPhotoBroswerWithStyle:(LGShowImageType)style{
    LGPhotoPickerBrowserViewController *BroswerVC = [[LGPhotoPickerBrowserViewController alloc] init];
    BroswerVC.delegate = self;
    BroswerVC.dataSource = self;
    BroswerVC.showType = style;
    self.showType = style;
    [self presentViewController:BroswerVC animated:YES completion:nil];
}


#define mark - tableDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return _dataArr.count;

}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.textLabel.text = _dataArr[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    switch (indexPath.row) {
        case 0:
            [self initPhotoPickerViewControllerWithStyle:LGShowImageTypeImagePicker];
            break;
        case 1:
            [self pushPhotoBroswerWithStyle:LGShowImageTypeImageBroswer];
            break;
        case 2:
            [self pushPhotoBroswerWithStyle:LGShowImageTypeImageURL];
            break;
        case 3:
            [self presentCameraSingle];
            break;
        case 4:
            [self presentCameraContinuous];
            break;
            
        default:
            break;
    }



}
/**
 *  初始化自定义相机（单拍）
 */
- (void)presentCameraSingle {
    ZLCameraViewController *cameraVC = [[ZLCameraViewController alloc] init];
    // 拍照最多个数
    cameraVC.maxCount = 1;
    // 单拍
    cameraVC.cameraType = ZLCameraSingle;
    cameraVC.callback = ^(NSArray *cameras){
        //在这里得到拍照结果
        //数组元素是ZLCamera对象
        /*
         @exemple
         ZLCamera *canamerPhoto = cameras[0];
         UIImage *image = canamerPhoto.photoImage;
         */
    };
    [cameraVC showPickerVc:self];
}
/**
 *  初始化自定义相机（连拍）
 */
- (void)presentCameraContinuous {
    ZLCameraViewController *cameraVC = [[ZLCameraViewController alloc] init];
    // 拍照最多个数
    cameraVC.maxCount = 4;
    // 连拍
    cameraVC.cameraType = ZLCameraContinuous;
    cameraVC.callback = ^(NSArray *cameras){
        //在这里得到拍照结果
        //数组元素是ZLCamera对象
        /*
         @exemple
         ZLCamera *canamerPhoto = cameras[0];
         UIImage *image = canamerPhoto.photoImage;
         */
    };
    [cameraVC showPickerVc:self];
}

#pragma mark - LGPhotoPickerViewControllerDelegate
- (void)pickerViewControllerDoneAsstes:(NSArray *)assets isOriginal:(BOOL)original{
   
     //assets的元素是LGPhotoAssets对象，获取image方法如下:
    /*
     NSMutableArray *thumbImageArray = [NSMutableArray array];
     NSMutableArray *originImage = [NSMutableArray array];
     NSMutableArray *fullResolutionImage = [NSMutableArray array];
     
     for (LGPhotoAssets *photo in assets) {
     //缩略图
     [thumbImageArray addObject:photo.thumbImage];
     //原图
     [originImage addObject:photo.originImage];
     //全屏图
     [fullResolutionImage addObject:fullResolutionImage];
     }
    */
       NSInteger num = (long)assets.count;
    NSString *isOriginal = original? @"YES":@"NO";
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"发送图片" message:[NSString stringWithFormat:@"您选择了%ld张图片\n是否原图：%@",(long)num,isOriginal] delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alertView show];
    
}
#pragma mark - LGPhotoPickerBrowserViewControllerDataSource
- (NSInteger)photoBrowser:(LGPhotoPickerBrowserViewController *)photoBrowser numberOfItemsInSection:(NSUInteger)section
{
    if (self.showType == LGShowImageTypeImageBroswer) {
        return self.LGPhotoPickerBrowserPhotoArray.count;

    }else if (self.showType == LGShowImageTypeImageURL) {
        return self.LGPhotoPickerBrowserURLArray.count;
    } else {
        NSLog(@"非法数据源");
        return 0;
    }
}

- (id<LGPhotoPickerBrowserPhoto>)photoBrowser:(LGPhotoPickerBrowserViewController *)pickerBrowser photoAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.showType == LGShowImageTypeImageBroswer) {
        return [self.LGPhotoPickerBrowserPhotoArray objectAtIndex:indexPath.item];
    } else if (self.showType == LGShowImageTypeImageURL) {
        return [self.LGPhotoPickerBrowserURLArray objectAtIndex:indexPath.item];
    } else {
        NSLog(@"非法数据源");
        return nil;
    }


}



















@end
