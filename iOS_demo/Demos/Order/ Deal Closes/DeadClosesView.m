//
//  DeadClosesView.m
//  iOS_demo
//
//  Created by 金中国 on 16/3/19.
//  Copyright © 2016年 jzg. All rights reserved.
//

#import "DeadClosesView.h"
@interface DeadClosesView ()
@property (weak, nonatomic) IBOutlet UILabel *amountOrders;
@property (weak, nonatomic) IBOutlet UILabel *freightAmount;
@property (weak, nonatomic) IBOutlet UILabel *consignee;
@property (weak, nonatomic) IBOutlet UILabel *telephone;
@property (weak, nonatomic) IBOutlet UILabel *shippingAddress;
@property (weak, nonatomic) IBOutlet UILabel *actualPayment;
@property (weak, nonatomic) IBOutlet UIButton *detailsBut;
@property (weak, nonatomic) IBOutlet UIView *downBackView;

@end
@implementation DeadClosesView

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

- (void)setModel:(DeadClosesModel *)model{
    _model = model;
    self.amountOrders.text = [NSString stringWithFormat:@"￥%@",model.amountOrders ];
    self.freightAmount.text = [NSString stringWithFormat:@"￥%@",model.freightAmount ];
    self.consignee.text = model.consignee;
    self.telephone.text = model.telephone;
    self.shippingAddress.text = model.shippingAddress;
    
    CGFloat whenes = [self widthOfString:self.shippingAddress.text font:self.shippingAddress.font height:100 maxWidth:1000] ;
    if (whenes > self.shippingAddress.frame.size.width) {
        NSInteger index = whenes / self.shippingAddress.frame.size.width;
        CGRect fram = self.shippingAddress.frame;
        fram.size.height = index  * 22 + 20;
        self.shippingAddress.frame = fram;
        self.shippingAddress.numberOfLines = 0;
    }
    CGRect fram = self.downBackView.frame;
    fram.origin.y = self.shippingAddress.frame.origin.y + self.shippingAddress.frame.size.height + 20;
    self.downBackView.frame = fram;
    
    self.actualPayment.text = [NSString stringWithFormat:@"￥%@",model.actualPayment];
}

- (void)awakeFromNib{
    
    self.frame = CGRectMake(0, 64, Screen_Width, Screen_Height - 64);
    
    self.detailsBut.layer.borderColor = [UIColor colorWithWhite:0.600 alpha:1.000].CGColor;
    self.detailsBut.layer.borderWidth = 1;
    self.detailsBut.layer.masksToBounds = YES;
    self.detailsBut.layer.cornerRadius = 5;
}

- (IBAction)deatilsJump:(UIButton *)sender {
    NSLog(@"     sender   %@",[sender titleForState:UIControlStateNormal]);
    self.block(self.model);
}

-(CGFloat)widthOfString:(NSString *)string font:(UIFont*)font height:(CGFloat)height maxWidth:(CGFloat)maxWidth
{
    NSString * stringes = [NSString stringWithFormat:@"%@",string];
    if([stringes isEqualToString:@"<null>"] ||stringes.length == 0){
        return 20;
    }
    NSDictionary * dict=[NSDictionary dictionaryWithObject: font forKey:NSFontAttributeName];
    CGRect rect=[string boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, height) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    if (rect.size.width > maxWidth) {
        return maxWidth;
    }
    return rect.size.width;
}

@end
