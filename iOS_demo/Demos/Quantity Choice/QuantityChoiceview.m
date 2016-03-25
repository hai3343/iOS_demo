//
//  QuantityChoiceview.m
//  iOS_demo
//
//  Created by 金中国 on 16/3/18.
//  Copyright © 2016年 jzg. All rights reserved.
//

#import "QuantityChoiceview.h"

@implementation QuantityChoiceview

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
/**
    @param frame  宽 70 高 15
 */
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self reloadView];
    }
    return self;
}

- (void)reloadView{
    self.numText = @"1";
    
    UIButton *leftbut = [UIButton buttonWithType:UIButtonTypeCustom];
    leftbut.frame = CGRectMake(0, 0, 20, self.height);
    leftbut.backgroundColor = [UIColor whiteColor];
    leftbut.titleLabel.font = [UIFont systemFontOfSize:17];
    [leftbut setTitle:@"-" forState:UIControlStateNormal];
    [leftbut setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [leftbut addTarget:self action:@selector(reduceNum) forControlEvents:UIControlEventTouchUpInside];
    
    leftbut.layer.masksToBounds = YES;
    leftbut.layer.cornerRadius = 1;
    leftbut.layer.borderColor = [UIColor colorWithWhite:0.502 alpha:1.000].CGColor;
    leftbut.layer.borderWidth = 1;
    
    [self addSubview:leftbut];
    
    UITextField *numField = [[UITextField alloc]initWithFrame:CGRectMake(20, 0, self.width - 20 - 20, self.height)];
    numField.delegate = self;
    numField.font = [UIFont systemFontOfSize:15];
    numField.textAlignment = NSTextAlignmentCenter;
    numField.textColor = [UIColor colorWithWhite:0.298 alpha:1.000];
    numField.layer.masksToBounds = YES;
    numField.layer.cornerRadius = 3;
    numField.text = @"1";
    numField.tag = 1314;
    numField.layer.borderColor = [UIColor colorWithWhite:0.502 alpha:1.000].CGColor;
    numField.layer.borderWidth = 1;
    numField.keyboardType = UIKeyboardTypeNumberPad;
    [self addSubview:numField];
    
    UIButton *reightBut = [UIButton buttonWithType:UIButtonTypeCustom];
    reightBut.frame = CGRectMake(self.width - 20, 0, 20, self.height);
    reightBut.backgroundColor = [UIColor whiteColor];
    reightBut.titleLabel.font = [UIFont systemFontOfSize:17];
    [reightBut setTitle:@"+" forState:UIControlStateNormal];
    [reightBut setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [reightBut addTarget:self action:@selector(addNum) forControlEvents:UIControlEventTouchUpInside];
    
    reightBut.layer.masksToBounds = YES;
    reightBut.layer.cornerRadius = 1;
    reightBut.layer.borderColor = [UIColor colorWithWhite:0.502 alpha:1.000].CGColor;
    reightBut.layer.borderWidth = 1;
    
    [self addSubview:reightBut];
}

- (void)reduceNum{
    [self reloadTextFieldText:@"-1"];
}

- (void)addNum{
    [self reloadTextFieldText:@"1"];
}

- (BOOL)textField:(UITextField*)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSString *text = [NSString stringWithFormat:@"%@%@",textField.text,string];
    
    if ([string isEqualToString:@""] || string.length == 0) {
        if ([text isEqualToString:@""] || text.length == 1) {
            textField.text = @"0";
            self.numText = textField.text;
            return NO;
        }
        else{
            self.numText =  [text substringToIndex:[text length] - 1];
        }
    }
    else{
        NSInteger textnum = [text integerValue];
        textField.text = [NSString stringWithFormat:@"%@",@(textnum)];
        self.numText = textField.text;
        return NO;
    }
    
    return YES;
}


- (void)reloadTextFieldText:(NSString *)number{
    UITextField *numTextfield = (UITextField *)[self viewWithTag:1314];
    NSString *numText = numTextfield.text;
    NSInteger numberes = [numText integerValue];
    NSInteger num = [number integerValue];
    NSInteger numes = numberes + num;
    if (numes < 0) {
        numes = 0;
    }
    
    numTextfield.text = [NSString stringWithFormat:@"%@",@(numes)];
    self.numText = numTextfield.text;
}
@end
