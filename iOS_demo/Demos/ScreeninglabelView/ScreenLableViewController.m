//
//  ScreenLableViewController.m
//  iOS_demo
//
//  Created by 金中国 on 16/3/17.
//  Copyright © 2016年 jzg. All rights reserved.
//

#import "ScreenLableViewController.h"

#import "ScreenLabView.h"
#import "ScreenModel.h"

@interface ScreenLableViewController ()<ScreenLabViewdelegate>

//@property (nonatomic, strong) UIWindow *myWindow;
@end

@implementation ScreenLableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSMutableArray *dataAry = [[NSMutableArray alloc]init];
    NSArray *array = @[@"xxxxxxx",@"aa",@"2222",@"44444444444",@"556",@"11",@"09087897989",@"9867876567656787678"];
    NSArray *prickAry = @[@"1-100",@"11-200",@"1000-10001",@"100以上",@"0.2-1001",@"200-1314"];
    NSArray *titleAryes = @[array,prickAry];
    for (NSInteger index = 0; index < 2; index ++) {
        NSMutableArray *data = [[NSMutableArray alloc]init];
        
        NSArray *dataText = [titleAryes objectAtIndex:index];
        for (NSInteger indexes = 0; indexes < dataText.count; indexes++) {
            ScreenModel *model = [[ScreenModel alloc]init];
            model.viewTitle = [dataText objectAtIndex:indexes];
            model.founth    = (index == 0)?VIEW_FUNCTION_COLOR:VIEW_FUNCTION_TEXTFIELD;
            [data addObject:model];
        }
        [dataAry addObject:data];
    }
    
    ScreenLabView *view = [[ScreenLabView alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height - 64) andDataAry:dataAry];
    view.delegate = self;
    [self.view addSubview:view];
//    
//    _myWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    
//    [self windowLeft:NO];
}

//- (void)windowLeft:(BOOL)left{
//    NSInteger index = [UIApplication sharedApplication].windows.count - 1;
//    UIWindow *window = [UIApplication sharedApplication].windows[index];
//    if (left == NO) {
//        [UIView animateWithDuration:0.5 animations:^{
//            window.frame = CGRectMake( -(Screen_Width - 50), 0, Screen_Width, Screen_Height);
//            [_myWindow addSubview:window];
//            [_myWindow makeKeyAndVisible];
//        }];
//    }else
//    {
//        [UIView animateWithDuration:0.5 animations:^{
//            window.frame = [UIScreen mainScreen].bounds;
//            [_myWindow resignKeyWindow];
//        }];
//    }
//
//}

- (void)dissMissView{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)returnSelectedCondition:(NSArray *)dict{
    NSLog(@"   aaaa    %@   \n    %@",[dict objectAtIndex:0],[dict objectAtIndex:1]);
    
//    [self windowLeft:YES];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
