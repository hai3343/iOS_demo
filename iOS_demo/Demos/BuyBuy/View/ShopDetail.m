//
//  ShopDetail.m
//  TZBMain
//
//  Created by yik on 16/1/25.
//  Copyright © 2016年 jzg. All rights reserved.
//

#import "ShopDetail.h"
@interface ShopDetail()
@end
@implementation ShopDetail
- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title dict:(NSDictionary *)dict
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;

}



- (void)createUI:(NSDictionary*)dic
{
    UIView *bgview = [UIView new];
    [self addSubview:bgview];
    bgview.backgroundColor = RGB(233, 233, 233);
    [bgview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(44);
        make.left.mas_equalTo(self);
        make.size.mas_equalTo(CGSizeMake(Screen_Width, 100));
    }];
    //头像
    UIImageView *imagview = [UIImageView imageViewWithImage:[UIImage imageNamed:@"logo"]];
                             
    [bgview addSubview:imagview];
    [imagview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.left.mas_equalTo(10);
        make.size.mas_equalTo(CGSizeMake(80, 80));
    }];
    //店铺名称
    UILabel *shopname = [UILabel lableWithTitle:@"罗远冰的小店" titleColor:[UIColor blackColor] titleFont:[UIFont systemFontOfSize:14] textAlignment:NSTextAlignmentLeft];
    [bgview addSubview:shopname];
    [shopname mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(imagview.mas_right).offset(5);
        make.top.mas_equalTo(imagview.mas_top).offset(15);
        CGFloat w = [Helper widthOfString:shopname.text font:shopname.font height:1000 ] + 10;
        make.size.mas_equalTo(CGSizeMake(w, 20));
    }];
    //关注数
    self.attention = [UILabel lableWithTitle:@"99" titleColor:RGB(253, 119, 143) titleFont:[UIFont systemFontOfSize:14] textAlignment:NSTextAlignmentLeft];
    
    [bgview addSubview:self.attention];
    [self.attention mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(imagview.mas_right).offset(5);
        make.bottom.mas_equalTo(imagview.mas_bottom).offset(-10);
        CGFloat w = [Helper widthOfString:self.attention.text font:self.attention.font height:1000] + 10;
        make.size.mas_equalTo(CGSizeMake(w, 20));

    }];
    UILabel *fans = [UILabel lableWithTitle:@"粉丝数" titleColor:[UIColor blackColor] titleFont:[UIFont systemFontOfSize:14] textAlignment:NSTextAlignmentLeft];
    [bgview addSubview:fans];
    [fans mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.attention.mas_right);
        make.bottom.mas_equalTo(imagview.mas_bottom).offset(-10);
        make.size.mas_equalTo(CGSizeMake(50, 20));
        
    }];
    UIButton *attentionbtn = [UIButton buttonWithType:UIButtonTypeCustom title:@"关注" titleFont:14 titleColor:[UIColor blackColor] backgroundColor:[UIColor whiteColor] target:self selector:@selector(attentionbtn:)];
    [attentionbtn buttonCornerRadius:5];
    [attentionbtn setTitle:@"已关注" forState:UIControlStateSelected];
    [bgview addSubview:attentionbtn];
    [attentionbtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(bgview.mas_right).offset(-10);
        make.bottom.mas_equalTo(bgview).offset(-15);
        make.size.mas_equalTo(CGSizeMake(50, 30));
    }];
    CGFloat shopAddsY = 0;
    NSArray *shoplabarr = @[@"店铺地址:",@"店铺联系人:",@"服务电话:",@"店铺简介:"];
    UIImageView *line;
    for (int i = 0; i < 4; i ++) {
        UILabel* shoplab = [UILabel lableWithTitle:shoplabarr[i] titleColor:[UIColor grayColor] titleFont:[UIFont systemFontOfSize:14] textAlignment:NSTextAlignmentCenter];
        CGFloat w = [Helper widthOfString:shoplab.text font:shoplab.font height:1000] + 10;
        [self addSubview:shoplab];
        //店铺名称
        UILabel* shopAdds = [UILabel lableWithTitle:@"深圳市龙岗布吉深圳市龙岗布吉深圳市深圳市深11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111" titleColor:[UIColor grayColor] titleFont:[UIFont systemFontOfSize:14] textAlignment:NSTextAlignmentLeft];
        shopAdds.numberOfLines = 0;
        shoplab.numberOfLines = 0;
        CGFloat shopAddsW = [Helper widthOfString:shopAdds.text font:shopAdds.font height:1000] + 10;
        CGFloat shopAddsH = [Helper heightOfString:shopAdds.text font:shopAdds.font width:shopAddsW]+10 + 10;

        [self addSubview:shopAdds];
        [shoplab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(bgview.mas_bottom).offset(12 +shopAddsY);
            make.size.mas_equalTo(CGSizeMake(w,shopAddsH));
        }];
        
        [shopAdds mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(shoplab.mas_right).offset(5);
            make.top.mas_equalTo(bgview.mas_bottom).offset(12 +shopAddsY);
            make.size.mas_equalTo(CGSizeMake(shopAddsW, shopAddsH));
        }];
        line = [UIImageView imageViewWithImage:[UIImage imageNamed:@"adds_1.jp"]];
        line.backgroundColor = RGB(233, 233, 233);
        [self addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(shopAdds.mas_bottom);
            make.size.mas_equalTo(CGSizeMake(Screen_Width - 20, 1.5));
        }];
        shopAddsY +=shopAddsH;

    }
    UIImageView *footerImg = [UIImageView imageViewWithImage:[UIImage imageNamed:@"footerlogo"]];
    [self addSubview:footerImg];
    [footerImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(line.mas_bottom).offset(20);
        make.left.mas_offset(0);
        make.size.mas_offset(CGSizeMake(Screen_Width, 50));
    }];

}

- (void)attentionbtn:(UIButton *)button
{
    button.selected = !button.selected;
    if (button.selected) {
        self.attention.text = @"100";
    }else{
    self.attention.text = @"99";
    }


}

- (void)hbNavBack
{
    [UIView deleteView:self duration:0.35];
}






@end
