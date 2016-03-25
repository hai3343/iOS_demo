//
//  OrderTableViewCell.m
//  iOS_demo
//
//  Created by 金中国 on 16/3/18.
//  Copyright © 2016年 jzg. All rights reserved.
//

#import "OrderTableViewCell.h"
#import "UIImageView+WebCache.h"

@interface OrderTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *orderNumber;
@property (weak, nonatomic) IBOutlet UILabel *orderState;
@property (weak, nonatomic) IBOutlet UIImageView *orderImage;
@property (weak, nonatomic) IBOutlet UILabel *orderName;
@property (weak, nonatomic) IBOutlet UILabel *UnitPrice;
@property (weak, nonatomic) IBOutlet UILabel *number;
@property (weak, nonatomic) IBOutlet UILabel *orderSpecs;
@property (weak, nonatomic) IBOutlet UILabel *totalNumber;
@property (weak, nonatomic) IBOutlet UILabel *totalprice;
@property (strong, nonatomic) UIButton *leftBut;
@property (strong, nonatomic) UIButton *rightBut;

@property (weak, nonatomic) IBOutlet UILabel *lingViewUp;

@property (weak, nonatomic) IBOutlet UILabel *lingViewBotton;

@property (weak, nonatomic) IBOutlet UIView *backView;
@end
@implementation OrderTableViewCell

- (void)awakeFromNib {
    // Initialization code
//    [self.leftBut addTarget:self action:@selector(leftPleaseUp:) forControlEvents:UIControlEventTouchUpInside];
//    [self.rightBut addTarget:self action:@selector(rightPleaseUp:) forControlEvents:UIControlEventTouchUpInside];
//
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
    self.backgroundColor = [UIColor grayColor];
    if (_leftBut == nil) {
        self.leftBut = [UIButton buttonWithType:UIButtonTypeCustom];
        self.leftBut.frame = CGRectMake(Screen_Width - 170, 210, 75, 30);
        [self.leftBut setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        self.leftBut.layer.masksToBounds = YES;
        self.leftBut.layer.cornerRadius = 5;
        self.leftBut.layer.borderColor  = [UIColor grayColor].CGColor;
        self.leftBut.titleLabel.font = [UIFont systemFontOfSize:15];
        self.leftBut.layer.borderWidth  = 1;
        [self.leftBut addTarget:self action:@selector(leftPleaseUp:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.leftBut];
    }
    if (_rightBut == nil) {
        self.rightBut = [UIButton buttonWithType:UIButtonTypeCustom];
        self.rightBut.frame = CGRectMake(Screen_Width - 90, 210, 75, 30);
        [self.rightBut setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        self.rightBut.layer.masksToBounds = YES;
        self.rightBut.layer.cornerRadius = 5;
        self.rightBut.layer.borderColor  = [UIColor grayColor].CGColor;
        self.rightBut.layer.borderWidth  = 1;
        self.rightBut.titleLabel.font = [UIFont systemFontOfSize:15];
        [self.rightBut addTarget:self action:@selector(rightPleaseUp:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.rightBut];
    }
    
    self.leftBut.userInteractionEnabled = YES;
    self.rightBut.userInteractionEnabled = YES;
    
    self.orderNumber.text = [NSString stringWithFormat:@"订单号: %@",self.model.orderNumber ];
    self.orderState.text  = self.model.orderState;
    [self.orderImage sd_setImageWithURL:[NSURL URLWithString:self.model.imageurl] placeholderImage:[UIImage imageNamed:@"hyzx_wddd_icon@2x"]];
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
    
    self.orderSpecs.text= [NSString stringWithFormat:@"规格: %@",self.model.specs ];
    CGFloat whenes = [self widthOfString:self.orderSpecs.text font:self.orderName.font height:100 maxWidth:1000] + 20;
    if (whenes >= self.orderSpecs.frame.size.width) {
        CGRect fram = self.orderSpecs.frame;
        fram.size.height = 50;
        self.orderSpecs.frame = fram;
        self.orderSpecs.numberOfLines = 2;
    }
    else{
        CGRect fram = self.orderSpecs.frame;
        fram.size.height = 28;
        self.orderSpecs.frame = fram;
        self.orderSpecs.numberOfLines = 1;
    }
    
    
    self.orderName.text = self.model.orderName;
    self.UnitPrice.text = [NSString stringWithFormat:@"￥%@",self.model.unitPrice];
    self.number.text    = [NSString stringWithFormat:@"X%@",self.model.number ];
    self.totalNumber.text = [NSString stringWithFormat:@"共 %@ 件商品",self.model.number ];
    self.totalprice.text  = [NSString stringWithFormat:@"应付: ￥%@",self.model.totalAmount ];
    
    if ([self.model.orderState isEqualToString:@"未付款"]) {
        self.leftBut.hidden = NO;
        self.rightBut.hidden = NO;
        [self.leftBut setTitle:@"取消订单" forState:UIControlStateNormal];
        [self.rightBut setTitle:@"付款" forState:UIControlStateNormal];
        [self.rightBut setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.rightBut.backgroundColor = [UIColor colorWithRed:0.941 green:0.357 blue:0.471 alpha:1.000];
        self.rightBut.layer.borderColor = [UIColor colorWithRed:0.941 green:0.357 blue:0.471 alpha:1.000].CGColor;
        
        self.totalNumber.hidden = NO;
        self.totalprice.hidden = NO;
        self.lingViewUp.hidden = NO;
        self.lingViewBotton.hidden = NO;
        
        CGRect fram = _backView.frame;
        fram.size.height = 245;
        _backView.frame = fram;
    }
    else if ([self.model.orderState isEqualToString:@"待发货"]){
        self.leftBut.hidden = YES;
        self.rightBut.hidden = NO;
        [self.rightBut setTitle:@"催促发货" forState:UIControlStateNormal];
        [self.rightBut setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.rightBut.backgroundColor = [UIColor colorWithRed:0.941 green:0.357 blue:0.471 alpha:1.000];
        self.rightBut.layer.borderColor = [UIColor colorWithRed:0.941 green:0.357 blue:0.471 alpha:1.000].CGColor;
        self.totalNumber.hidden = NO;
        self.totalprice.hidden = NO;
        self.lingViewUp.hidden = NO;
        self.lingViewBotton.hidden = NO;
        
        CGRect fram = _backView.frame;
        fram.size.height = 245;
        _backView.frame = fram;
    }
    else if ([self.model.orderState isEqualToString:@"待收货"]){
        self.leftBut.hidden = NO;
        self.rightBut.hidden = NO;
        [self.leftBut setTitle:@"查看物流" forState:UIControlStateNormal];
        [self.rightBut setTitle:@"确认收货" forState:UIControlStateNormal];
        [self.rightBut setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.rightBut.backgroundColor = [UIColor colorWithRed:0.941 green:0.357 blue:0.471 alpha:1.000];
        self.rightBut.layer.borderColor = [UIColor colorWithRed:0.941 green:0.357 blue:0.471 alpha:1.000].CGColor;
        self.totalNumber.hidden = NO;
        self.totalprice.hidden = NO;
        self.lingViewUp.hidden = NO;
        self.lingViewBotton.hidden = NO;
        
        CGRect fram = _backView.frame;
        fram.size.height = 245;
        _backView.frame = fram;
    }
    else if ([self.model.orderState isEqualToString:@"已收货"]){
        self.leftBut.hidden = YES;
        self.rightBut.hidden = NO;
        self.rightBut.layer.borderColor = [UIColor colorWithRed:0.941 green:0.357 blue:0.471 alpha:1.000].CGColor;
        [self.rightBut setTitle:@"已收货" forState:UIControlStateNormal];
        [self.rightBut setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.rightBut.backgroundColor = [UIColor colorWithRed:0.941 green:0.357 blue:0.471 alpha:1.000];
        self.totalNumber.hidden = NO;
        self.totalprice.hidden = NO;
        self.lingViewUp.hidden = NO;
        self.lingViewBotton.hidden = NO;
        
        CGRect fram = _backView.frame;
        fram.size.height = 245;
        _backView.frame = fram;
    }
    else if ([self.model.orderState isEqualToString:@"已完成"]){
        self.leftBut.hidden = YES;
        self.rightBut.hidden = NO;
        self.rightBut.layer.borderColor = [UIColor grayColor].CGColor;
        [self.rightBut setTitle:@"删除订单" forState:UIControlStateNormal];
        [self.rightBut setTitleColor:[UIColor colorWithWhite:0.702 alpha:1.000] forState:UIControlStateNormal];
        self.rightBut.backgroundColor = [UIColor whiteColor];
        self.totalNumber.hidden = NO;
        self.totalprice.hidden = NO;
        self.lingViewUp.hidden = NO;
        self.lingViewBotton.hidden = NO;
        
        CGRect fram = _backView.frame;
        fram.size.height = 245;
        _backView.frame = fram;
    }
    else if ([self.model.orderState isEqualToString:@"交易关闭"]){
        self.leftBut.hidden = YES;
        self.rightBut.hidden = YES;
        self.totalNumber.hidden = YES;
        self.totalprice.hidden = YES;
        self.lingViewUp.hidden = YES;
        self.lingViewBotton.hidden = YES;
        
        CGRect fram = _backView.frame;
        fram.size.height = 166;
        _backView.frame = fram;
    }
    
    
}
- (void)leftPleaseUp:(UIButton *)sender {
    NSLog(@"    xxxxxxxx %@    %@" , [sender titleForState:UIControlStateNormal],self.model);
}
//- (void)leftPleaseUp:(UIButton *)sender{
//    NSLog(@"    xxxxxxxx %@ " , [sender titleForState:UIControlStateNormal]);
//}
- (void)rightPleaseUp:(UIButton *)sender {
    NSLog(@"   aaaaaaaa  %@    %@",[sender titleForState:UIControlStateNormal],self.model);
}

//- (void)rightPleaseUp:(UIButton *)sender{
//     NSLog(@"   aaaaaaaa  %@",[sender titleForState:UIControlStateNormal]);
//}

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

//- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
//    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
//    if(self){
//    }
//    return self;
//}


@end
