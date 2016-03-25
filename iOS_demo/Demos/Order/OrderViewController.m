//
//  OrderViewController.m
//  iOS_demo
//
//  Created by 金中国 on 16/3/18.
//  Copyright © 2016年 jzg. All rights reserved.
//

#import "OrderViewController.h"
#import "OrderModel.h"
#import "OrderTableViewCell.h"
#import "DrowButtonTableView.h"
@interface OrderViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *dataAry;
}
@end

@implementation OrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    dataAry = [[NSMutableArray alloc]init];
    NSArray *array0 = @[@"http://image.baidu.com/search/detail?ct=503316480&z=0&ipn=false&word=美女图片&pn=3&spn=0&di=0&pi=21627435432&rn=1&tn=baiduimagedetail&is=0%2C170535&istype=&ie=utf-8&oe=utf-8&in=3354&cl=2&lm=-1&st=&cs=2177496079%2C1229025177&os=&simid=&adpicid=0&ln=31000&fr=&fmq=1378374347070_R&fm=&ic=0&s=0&se=&sme=&tab=&face=&ist=&jit=&statnum=girl&cg=girl&bdtype=-1&oriquery=&objurl=http%3A%2F%2Fa.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2Ff9dcd100baa1cd11daf25f19bc12c8fcc3ce2d46.jpg&fromurl=http%3A%2F%2Fwww.juemei.cc%2Fhtml%2Flist%2FPmaiPJdaiiHPaPCdJ.html&gsm=",@"http://image.baidu.com/search/detail?ct=503316480&z=0&ipn=false&word=美女图片&pn=3&spn=0&di=0&pi=21627435432&rn=1&tn=baiduimagedetail&is=0%2C170535&istype=&ie=utf-8&oe=utf-8&in=3354&cl=2&lm=-1&st=&cs=2177496079%2C1229025177&os=&simid=&adpicid=0&ln=31000&fr=&fmq=1378374347070_R&fm=&ic=0&s=0&se=&sme=&tab=&face=&ist=&jit=&statnum=girl&cg=girl&bdtype=-1&oriquery=&objurl=http%3A%2F%2Fa.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2Ff9dcd100baa1cd11daf25f19bc12c8fcc3ce2d46.jpg&fromurl=http%3A%2F%2Fwww.juemei.cc%2Fhtml%2Flist%2FPmaiPJdaiiHPaPCdJ.html&gsm=",@"http://image.baidu.com/search/detail?ct=503316480&z=0&ipn=false&word=美女图片&pn=3&spn=0&di=0&pi=21627435432&rn=1&tn=baiduimagedetail&is=0%2C170535&istype=&ie=utf-8&oe=utf-8&in=3354&cl=2&lm=-1&st=&cs=2177496079%2C1229025177&os=&simid=&adpicid=0&ln=31000&fr=&fmq=1378374347070_R&fm=&ic=0&s=0&se=&sme=&tab=&face=&ist=&jit=&statnum=girl&cg=girl&bdtype=-1&oriquery=&objurl=http%3A%2F%2Fa.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2Ff9dcd100baa1cd11daf25f19bc12c8fcc3ce2d46.jpg&fromurl=http%3A%2F%2Fwww.juemei.cc%2Fhtml%2Flist%2FPmaiPJdaiiHPaPCdJ.html&gsm=",@"http://image.baidu.com/search/detail?ct=503316480&z=0&ipn=false&word=美女图片&pn=3&spn=0&di=0&pi=21627435432&rn=1&tn=baiduimagedetail&is=0%2C170535&istype=&ie=utf-8&oe=utf-8&in=3354&cl=2&lm=-1&st=&cs=2177496079%2C1229025177&os=&simid=&adpicid=0&ln=31000&fr=&fmq=1378374347070_R&fm=&ic=0&s=0&se=&sme=&tab=&face=&ist=&jit=&statnum=girl&cg=girl&bdtype=-1&oriquery=&objurl=http%3A%2F%2Fa.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2Ff9dcd100baa1cd11daf25f19bc12c8fcc3ce2d46.jpg&fromurl=http%3A%2F%2Fwww.juemei.cc%2Fhtml%2Flist%2FPmaiPJdaiiHPaPCdJ.html&gsm=",@"http://image.baidu.com/search/detail?ct=503316480&z=0&ipn=false&word=美女图片&pn=3&spn=0&di=0&pi=21627435432&rn=1&tn=baiduimagedetail&is=0%2C170535&istype=&ie=utf-8&oe=utf-8&in=3354&cl=2&lm=-1&st=&cs=2177496079%2C1229025177&os=&simid=&adpicid=0&ln=31000&fr=&fmq=1378374347070_R&fm=&ic=0&s=0&se=&sme=&tab=&face=&ist=&jit=&statnum=girl&cg=girl&bdtype=-1&oriquery=&objurl=http%3A%2F%2Fa.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2Ff9dcd100baa1cd11daf25f19bc12c8fcc3ce2d46.jpg&fromurl=http%3A%2F%2Fwww.juemei.cc%2Fhtml%2Flist%2FPmaiPJdaiiHPaPCdJ.html&gsm=",@"http://image.baidu.com/search/detail?ct=503316480&z=0&ipn=false&word=美女图片&pn=3&spn=0&di=0&pi=21627435432&rn=1&tn=baiduimagedetail&is=0%2C170535&istype=&ie=utf-8&oe=utf-8&in=3354&cl=2&lm=-1&st=&cs=2177496079%2C1229025177&os=&simid=&adpicid=0&ln=31000&fr=&fmq=1378374347070_R&fm=&ic=0&s=0&se=&sme=&tab=&face=&ist=&jit=&statnum=girl&cg=girl&bdtype=-1&oriquery=&objurl=http%3A%2F%2Fa.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2Ff9dcd100baa1cd11daf25f19bc12c8fcc3ce2d46.jpg&fromurl=http%3A%2F%2Fwww.juemei.cc%2Fhtml%2Flist%2FPmaiPJdaiiHPaPCdJ.html&gsm="];
    NSArray *array1 = @[@"111112222",@"0099",@"32324",@"12314435346",@"345322343242424234",@"457569845763456456334634635"];
    NSArray *array2 = @[@"未付款",@"待发货",@"待收货",@"已收货",@"已完成",@"交易关闭"];
    NSArray *array3 = @[@"金",@"好贵的铂金首饰",@"七仙女的头钗你值得拥有",@"这是啥？过了这个村就没了这个店了，快来买啊",@"皇帝的宝珠",@"女王的桂冠，你值得拥有，还在等什么，马上来购买吧，啊啊啊啊"];
    NSArray *array4 = @[@"100",@"10000",@"10000",@"100000",@"1000000",@"10000000"];
    NSArray *array5 = @[@"1",@"10",@"100",@"1000",@"1000",@"1000"];
    NSArray *array6 = @[@"这是啥",@"这又是啥",@"这他喵的到底是啥",@"什么鬼",@"三位一体的首饰套件，你值得拥右哦，快来",@"搞活动了，速度来抢啊。免费送了，只有一天哦，快过来选一下吧，速度滴干活"];
    NSArray *array7 = @[@"10000000",@"122",@"3300",@"999988",@"9882",@"77664433"];
    for (NSInteger index = 0; index < array1.count; index++) {
        OrderModel *model = [[OrderModel alloc]init];
        model.orderNumber = [array1 objectAtIndex:index];
        model.orderState  = [array2 objectAtIndex:index];
        model.imageurl    = [array0 objectAtIndex:index];
        model.orderName   = [array3 objectAtIndex:index];
        model.unitPrice   = [array4 objectAtIndex:index];
        model.number      = [array5 objectAtIndex:index];
        model.specs      =  [array6 objectAtIndex:index];
        model.totalAmount=  [array7 objectAtIndex:index];
        
        [dataAry addObject:model];
    }
    
    DrowButtonTableView *table = [[DrowButtonTableView alloc]initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height)];
    table.delegate = self;
    table.dataSource = self;
    table.allowsSelection = NO;
    table.delaysContentTouches = NO;
    table.canCancelContentTouches = YES;
    [self.view addSubview:table];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return dataAry.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    OrderModel *model = [dataAry objectAtIndex:indexPath.row];
    return ([model.orderState isEqualToString:@"交易关闭"] ? 176:255);
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellid = @"OrderTableViewCell";
    OrderTableViewCell *celles = [tableView dequeueReusableCellWithIdentifier:cellid];
    OrderModel *model = [dataAry objectAtIndex:indexPath.row];
    if(!celles){
        [tableView registerNib:[UINib nibWithNibName:cellid bundle:nil] forCellReuseIdentifier:cellid];
        celles = [tableView dequeueReusableCellWithIdentifier:cellid];
    }
    celles.contentView.userInteractionEnabled = YES;
    celles.contentView.size = CGSizeMake(Screen_Width, 248);
    celles.model = model;
    celles.selectionStyle = UITableViewCellSelectionStyleNone;
    return celles;
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
