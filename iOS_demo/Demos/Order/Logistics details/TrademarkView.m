//
//  TrademarkView.m
//  iOS_demo
//
//  Created by 金中国 on 16/3/19.
//  Copyright © 2016年 jzg. All rights reserved.
//

#import "TrademarkView.h"
#import "UIImageView+WebCache.h"
@implementation TrademarkView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)setModel:(TrademarkModel *)model{
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 10, 30, 30)];
    [imageView sd_setImageWithURL:[NSURL URLWithString:self.model.imageUrl] placeholderImage:[UIImage imageNamed:@"hyzx_wddd_icon"]];
    imageView.layer.masksToBounds = YES;
    imageView.layer.cornerRadius = 5;
    [self addSubview:imageView];
    
    UILabel *nameLab = [[UILabel alloc]initWithFrame:CGRectMake(imageView.frame.origin.x + imageView.frame.size.width + 10, 10, self.frame.size.width - 80 - imageView.frame.origin.x - imageView.frame.size.width - 10, 20)];
    nameLab.font = [UIFont systemFontOfSize:15];
    nameLab.textColor = [UIColor colorWithWhite:0.498 alpha:1.000];
    
    
}
@end
