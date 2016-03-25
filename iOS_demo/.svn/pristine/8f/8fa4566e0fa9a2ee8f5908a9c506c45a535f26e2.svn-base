//
//  StorButton.m
//  LYBFunctionalModule
//
//  Created by 金中国 on 16/3/15.
//  Copyright © 2016年 金中国. All rights reserved.
//

#import "StorButton.h"
#import "Helper.h"
@interface StorButton ()
@property (nonatomic, strong)UIButton *     storBtn;
@property (nonatomic, strong)UIImageView *  imageViewUP;
@property (nonatomic, strong)UIImageView *  imageViewDOWN;
@property (nonatomic, assign)BOOL           isSelector;
@property (nonatomic, assign)BOOL           isState;
@end
@implementation StorButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame andTitle:(NSString *)title{
    self = [super initWithFrame:frame];
    if (self) {
        [self layoutView:title];
    }
    return self;
}
- (void)layoutView:(NSString *)title{
    CGFloat when = [Helper widthOfString:title font:[UIFont systemFontOfSize:17] height:100] + 20;
    
    self.storBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.storBtn.frame = CGRectMake((self.frame.size.width - 10 - when) / 2, 0, when, self.frame.size.height);
    [self.storBtn setTitle:title forState:UIControlStateNormal];
    [self.storBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.storBtn addTarget:self action:@selector(pleaseDown) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.storBtn];
    
    self.imageViewUP = [[UIImageView alloc]initWithFrame:CGRectMake(self.storBtn.frame.size.width + self.storBtn.frame.origin.x, (self.frame.size.height - 20 - 5) / 2, 10, 10)];
    self.imageViewUP.image = [UIImage imageNamed:@"iconfont-icon-UP-1"];
    [self addSubview:self.imageViewUP];
    
    self.imageViewDOWN = [[UIImageView alloc]initWithFrame:CGRectMake(self.storBtn.frame.size.width + self.storBtn.frame.origin.x, (self.frame.size.height) / 2 + 5 / 2, 10, 10)];
    self.imageViewDOWN.image = [UIImage imageNamed:@"iconfont-icon-DOWN-1"];
    [self addSubview:self.imageViewDOWN];
}

- (void)pleaseDown{
    self.isState = !self.isState;
    // 刚开始 是从 未选中状态过来
    if (self.isSelector == NO) {
        self.imageViewUP.image = [UIImage imageNamed:@"iconfont-icon-UP-2"];
        self.isSelector = YES;
        [self.storBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    }
    else if (self.isSelector == YES){
        self.imageViewUP.image = [UIImage imageNamed:(self.isState ?@"iconfont-icon-UP-2":@"iconfont-icon-UP-1")];
        self.imageViewDOWN.image = [UIImage imageNamed:(self.isState ?@"iconfont-icon-DOWN-1":@"iconfont-icon-DOWN-2")];
    }
    if ([_delegate respondsToSelector:@selector(returnButton:andStor:)]) {
        [self.delegate returnButton:self andStor:(self.isState ?STOR_INTEGER_UP :STOR_INTEGER_DOWN)];
    }
}
- (void)reloadButtonStor{
    self.isState = NO;
    self.isSelector = NO;
    
    [self.storBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    self.imageViewUP.image = [UIImage imageNamed:@"iconfont-icon-UP-1"];
    self.imageViewDOWN.image = [UIImage imageNamed:@"iconfont-icon-DOWN-1"];
}
@end
