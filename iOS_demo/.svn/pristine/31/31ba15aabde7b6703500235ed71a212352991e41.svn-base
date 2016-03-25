//
//  OrderDatailsView.m
//  iOS_demo
//
//  Created by 金中国 on 16/3/19.
//  Copyright © 2016年 jzg. All rights reserved.
//

#import "OrderDatailsView.h"
#import "UIImageView+WebCache.h"
//#import "AppScrollView.h"
@interface OrderDatailsView()
@property (weak, nonatomic) IBOutlet UIScrollView*backScrollView;
@property (weak, nonatomic) IBOutlet UIView *upperHalfView;
@property (weak, nonatomic) IBOutlet UILabel *amountOrders;
@property (weak, nonatomic) IBOutlet UILabel *freightAmount;
@property (weak, nonatomic) IBOutlet UILabel *logisticsCompany;
@property (weak, nonatomic) IBOutlet UILabel *logisticsNumber;
@property (weak, nonatomic) IBOutlet UILabel *consignee;
@property (weak, nonatomic) IBOutlet UILabel *telephone;
/**
 *  这个需要换行
 */
@property (weak, nonatomic) IBOutlet UILabel *shippingAddress;

@property (weak, nonatomic) IBOutlet UIView *lowerHaflView;


@property (weak, nonatomic) IBOutlet UIImageView *orderImage;
@property (weak, nonatomic) IBOutlet UILabel *orderName;
@property (weak, nonatomic) IBOutlet UILabel *unitPrice;
@property (weak, nonatomic) IBOutlet UILabel *number;
@property (weak, nonatomic) IBOutlet UILabel *specs;

@property (strong, nonatomic) UIButton *refundBtn;

@property (weak, nonatomic) IBOutlet UIView *orderTimeView;

@property (weak, nonatomic) IBOutlet UILabel *orderNumber;
@property (weak, nonatomic) IBOutlet UILabel *scheduledTime;
@property (weak, nonatomic) IBOutlet UILabel *paymentTime;
@property (weak, nonatomic) IBOutlet UILabel *deliverytime;
@property (weak, nonatomic) IBOutlet UILabel *receivingTime;
@property (weak, nonatomic) IBOutlet UILabel *merchantRemarks;

@property (weak, nonatomic) IBOutlet UIImageView *logoImage;

@end
@implementation OrderDatailsView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromNib{
    self.frame = CGRectMake(0, 0, Screen_Width, Screen_Height);
    self.backScrollView.frame = CGRectMake(0, 0, Screen_Width, Screen_Height);
    self.backScrollView.bounces = NO;
    self.backScrollView.showsHorizontalScrollIndicator = NO;
    self.backScrollView.showsVerticalScrollIndicator = NO;
}

- (void)setModel:(OrderDetailsModel *)model{
    
    _model = model;
    self.refundBtn.layer.masksToBounds = YES;
    self.refundBtn.layer.cornerRadius = 5;
    
    if (self.refundBtn == nil) {
        self.refundBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.refundBtn.frame = CGRectMake(self.backScrollView.frame.size.width - 70, 60, 58, 31);
        [self.refundBtn setTitle:@"退款" forState:UIControlStateNormal];
        [self.refundBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.refundBtn addTarget:self action:@selector(jumpToRefund:) forControlEvents:UIControlEventTouchUpInside];
        self.refundBtn.layer.masksToBounds = YES;
        self.refundBtn.userInteractionEnabled = YES;
        self.refundBtn.layer.cornerRadius = 5;
        self.refundBtn.backgroundColor = [UIColor colorWithRed:1.000 green:0.400 blue:0.400 alpha:1.000];
        [self.lowerHaflView addSubview:self.refundBtn];
    }

    self.amountOrders.text = [NSString stringWithFormat:@"￥%@",model.amountOrders ];
    self.freightAmount.text = [NSString stringWithFormat:@"￥%@",model.freightAmount ];
    self.logisticsCompany.text = model.logisticsCompany;
    self.logisticsNumber.text = model.logisticsNumber;
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
    CGRect fram = self.upperHalfView.frame;
    fram.size.height = self.shippingAddress.frame.origin.y + self.shippingAddress.frame.size.height + 10;
    self.upperHalfView.frame = fram;
    
    
    [self.orderImage sd_setImageWithURL:[NSURL URLWithString:self.model.imageurl] placeholderImage:[UIImage imageNamed:@"hyzx_wddd_icon"]];
    CGFloat when = [self widthOfString:self.model.orderName font:self.orderName.font height:100 maxWidth:1000] + 20;
    if (when >= self.orderName.frame.size.width) {
        CGRect fram = self.orderName.frame;
        fram.size.height = 50;
        self.orderName.frame = fram;
        self.orderName.numberOfLines = 2;
    }
    else{
        CGRect fram = self.orderName.frame;
        fram.size.height = 28;
        self.orderName.frame = fram;
        self.orderName.numberOfLines = 1;
    }
    
    self.unitPrice.text = [NSString stringWithFormat:@"￥%@",model.unitPrice ];
    self.number.text = [NSString stringWithFormat:@"X%@",model.number ];
    
    self.specs.text= [NSString stringWithFormat:@"规格: %@",model.specs ];
    CGFloat wheness = [self widthOfString:self.specs.text font:self.specs.font height:100 maxWidth:1000] + 20;
    if (wheness >= self.specs.frame.size.width) {
        NSInteger index = wheness / self.specs.frame.size.width;
        CGRect fram = self.specs.frame;
        fram.size.height = index  * 22 + 20;
        self.specs.frame = fram;
        self.specs.numberOfLines = 0;
    }
    
    self.orderNumber.text = model.orderName;
    self.scheduledTime.text = model.scheduledTime;
    self.paymentTime.text = model.paymentTime;
    self.deliverytime.text = model.deliverytime;
    self.receivingTime.text = model.receivingTime;
    self.merchantRemarks.text = model.merchantRemarks;
    
    CGFloat heigh = [self widthOfString:self.merchantRemarks.text font:self.merchantRemarks.font height:1000 maxWidth:1000] ;
    if (heigh > self.merchantRemarks.frame.size.width) {
        NSInteger index = heigh / self.merchantRemarks.frame.size.width;
        CGRect fram = self.merchantRemarks.frame;
        fram.size.height = index  * 22 + 20;
        self.merchantRemarks.frame = fram;
        self.merchantRemarks.numberOfLines = 0;
    }
    
    CGRect timefram = self.orderTimeView.frame;
    timefram.origin.y = self.specs.frame.origin.y +self.specs.frame.size.height + 10;
    timefram.size.height = self.merchantRemarks.frame.origin.y + self.merchantRemarks.frame.size.height + 10;
    self.orderTimeView.frame = timefram;
    
    
    CGRect framss = self.lowerHaflView.frame;
    framss.origin.y = self.upperHalfView.frame.origin.y + self.upperHalfView.frame.size.height + 20;
    framss.size.height = self.orderTimeView.frame.origin.y + self.orderTimeView.frame.size.height + 10;
    self.lowerHaflView.frame = framss;
    
    CGRect framIma = self.logoImage.frame;
    framIma.origin.y = self.lowerHaflView.frame.origin.y + self.lowerHaflView.frame.size.height + 10;
    self.logoImage.frame = framIma;
    
    self.backScrollView.contentSize = CGSizeMake(Screen_Width, self.logoImage.frame.size.height + self.logoImage.frame.origin.y + 20);
}
- (void)jumpToRefund:(UIButton *)sender {
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
