//
//  QuantityViewController.m
//  iOS_demo
//
//  Created by 金中国 on 16/3/18.
//  Copyright © 2016年 jzg. All rights reserved.
//

#import "QuantityViewController.h"
#import "QuantityChoiceview.h"
@interface QuantityViewController ()

@property (nonatomic, strong)QuantityChoiceview *quan;
@end

@implementation QuantityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    _quan = [[QuantityChoiceview alloc]initWithFrame:CGRectMake(100, 100, 100, 20)];
    [self.view addSubview:_quan];
    
    UIButton *textBut = [UIButton buttonWithType:UIButtonTypeCustom];
    textBut.frame = CGRectMake(30, 100, 30, 15);
    [textBut setTitle:@"数量" forState:UIControlStateNormal];
    textBut.titleLabel.font = [UIFont systemFontOfSize:14];
    [textBut setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [textBut addTarget:self action:@selector(quentityText) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:textBut];
    
    UITapGestureRecognizer *zer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dissMisskeyBoard)];
    [self.view addGestureRecognizer:zer];
}

- (void)dissMisskeyBoard{
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
}

- (void)quentityText{
    NSLog(@"      数量  %@",_quan.numText);
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
