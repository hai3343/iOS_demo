//
//  UIView+CYViewGeometry.h
//  gintong
//
//  Created by Andrew on 15/2/11.
//  Copyright (c) 2015年 Andrew. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 参照模式
 */
typedef enum {
    CYReferenceTypeCenter,      // 以中心坐标点做参照
    
    CYReferenceTypeLeftTop,     // 以左上坐标点做参照
    CYReferenceTypeLeftMiddle,  // 以左中坐标点做参照
    CYReferenceTypeLeftBottom,  // 以左下坐标点做参照
    
    CYReferenceTypeRightTop,    // 以右上坐标点做参照
    CYReferenceTypeRightMiddle, // 以右中坐标点做参照
    CYReferenceTypeRightBottom, // 以右下坐标点做参照
    
    CYReferenceTypeMiddleTop,   // 以中上坐标点做参照
    CYReferenceTypeMiddleBottom,// 以中下坐标点做参照
    
    CYReferenceTypeTop,         // 以上边线y做参照
    CYReferenceTypeLeft,        // 以左边线x做参照
    CYReferenceTypeBottom,      // 以下边线y做参照
    CYReferenceTypeRight,       // 以右边线x做参照
    
    CYReferenceTypeOther        // 未知参照类型，没有任何效果，参数错误处理
} CYReferenceType;

/**
 *  均分行列数
 */
typedef struct {
    signed rows;
    signed cols;
} CYCountSize;

CYCountSize CYCountSizeMake(signed rows, signed columns);


@interface UIView (CYViewGeometry)

/**
 *  constructor
 *
 *  @return instance object
 */
+ (instancetype)view;
+ (instancetype)viewWithBackColor:(UIColor *)color;
- (instancetype)initWithBackColor:(UIColor *)color;
+ (instancetype)viewWithFrame:(CGRect)frame;

/**
 *  坐标x，不推荐使用
 */
@property (nonatomic, assign) CGFloat x DEPRECATED_ATTRIBUTE;

/**
 *  坐标y，不推荐使用
 */
@property (nonatomic, assign) CGFloat y DEPRECATED_ATTRIBUTE;

/**
 *  坐标x
 */
@property (nonatomic, assign) CGFloat minX;

/**
 *  坐标y
 */
@property (nonatomic, assign) CGFloat minY;

/**
 *  纵向中线x
 */
@property (nonatomic, assign) CGFloat midX;

/**
 *  横向中线y
 */
@property (nonatomic, assign) CGFloat midY;

/**
 *  x + self宽度
 */
@property (nonatomic, assign) CGFloat maxX;

/**
 *  y + self高度
 */
@property (nonatomic, assign) CGFloat maxY;

/**
 *  self宽度
 */
@property (nonatomic, assign) CGFloat width;

/**
 *  self高度
 */
@property (nonatomic, assign) CGFloat height;

/**
 *  self宽度，高度
 */
@property (nonatomic, assign) CGSize size;

/**
 *  self x，y
 */
@property (nonatomic, assign) CGPoint origin;

/**
 *  宽度/2
 */
@property (nonatomic, assign) CGFloat midXb;

/**
 *  高度/2
 */
@property (nonatomic, assign) CGFloat midYb;

/**
 *  self宽度
 */
@property (nonatomic, assign) CGFloat maxXb;

/**
 *  self高度
 */
@property (nonatomic, assign) CGFloat maxYb;

/**
 *  self.bounds中心点
 */
@property (nonatomic, assign) CGPoint centerb;

/**
 *  左中坐标点
 */
@property (nonatomic, assign) CGPoint leftMiddle;

/**
 *  左中坐标点
 */
@property (nonatomic, assign) CGPoint leftMiddleb;

/**
 *  左下坐标点
 */
@property (nonatomic, assign) CGPoint leftBottom;

/**
 *  0, self高度
 */
@property (nonatomic, assign) CGPoint leftBottomb;

/**
 *  右上坐标点
 */
@property (nonatomic, assign) CGPoint rightTop;

/**
 *  self宽度，0
 */
@property (nonatomic, assign) CGPoint rightTopb;

/**
 *  右中坐标点
 */
@property (nonatomic, assign) CGPoint rightMiddle;

/**
 *  self宽度，self高度/2
 */
@property (nonatomic, assign) CGPoint rightMiddleb;

/**
 *  右下坐标点
 */
@property (nonatomic, assign) CGPoint rightBottom;

/**
 *  self宽度，高度
 */
@property (nonatomic, assign) CGPoint rightBottomb;

/**
 *  中上坐标点
 */
@property (nonatomic, assign) CGPoint middleTop;

/**
 *  self宽度/2, 0
 */
@property (nonatomic, assign) CGPoint middleTopb;

/**
 *  中下坐标点
 */
@property (nonatomic, assign) CGPoint middleBottom;

/**
 *  self宽度/2, self高度
 */
@property (nonatomic, assign) CGPoint middleBottomb;


/**
 *  center == self.centerb的view
 */
@property (nonatomic, strong) UIView *centerView;

/**
 *  middleTop == self.middleTopb的view
 */
@property (nonatomic, strong) UIView *middleTopView;

/**
 *  middleBottom == self.middleBottomb的view
 */
@property (nonatomic, strong) UIView *middleBottomView;

/**
 *  leftTop == self.leftTopb的view
 */
@property (nonatomic, strong) UIView *leftTopView;

/**
 *  leftMiddle == self.leftMiddleb的view
 */
@property (nonatomic, strong) UIView *leftMiddleView;

/**
 *  leftBottom == self.leftBottomb的view
 */
@property (nonatomic, strong) UIView *leftBottomView;

/**
 *  rightTop == self.rightTopb的view
 */
@property (nonatomic, strong) UIView *rightTopView;

/**
 *  rightMiddle == self.rightMiddleb的view
 */
@property (nonatomic, strong) UIView *rightMiddleView;

/**
 *  rightBottom == self.rightBottomb的view
 */
@property (nonatomic, strong) UIView *rightBottomView;


/**
 *  添加view，同时设置fram
 *
 *  @param view  要添加的UIView
 *  @param frame view.frame
 */
- (void)addSubView:(UIView *)view withFrame:(CGRect)frame;

/**
 *  添加view，同时设置fram
 *
 *  @param view  要添加的UIView
 *  @param point view.frame.point
 *  @param size  view.frame.size
 */
- (void)addSubView:(UIView *)view atPoint:(CGPoint)point withSize:(CGSize)size;

/**
 *  添加view，同时设置位置
 *
 *  @param view       要添加的UIView
 *  @param layoutType 参照模式，具体请查看本文件开头部分，view的frame参照此值计算
 */
- (void)addSubview:(UIView *)view withType:(CYReferenceType)layoutType;

/**
 *  添加view，同时设置位置及偏移量
 *
 *  @param view       要添加的UIView
 *  @param layoutType 参照模式，具体请查看本文件开头部分，view的frame参照此值计算
 *  @param size       水平竖直方向偏移量
 */
- (void)addSubview:(UIView *)view withType:(CYReferenceType)layoutType offset:(CGSize)size;

/**
 *  添加view，同时设置位置
 *
 *  @param view       要添加的UIView
 *  @param point      指定的位置
 *  @param layoutType 参照模式，具体请查看本文件开头部分，view的frame参照此值计算
 */
- (void)addSubview:(UIView *)view atPoint:(CGPoint)point withType:(CYReferenceType)layoutType;

/**
 *  添加view，同时设置位置及偏移量
 *
 *  @param view       要添加的UIView
 *  @param point      指定的位置
 *  @param layoutType 参照模式，具体请查看本文件开头部分，view的frame参照此值计算
 *  @param size       水平竖直方向偏移量
 */
- (void)addSubview:(UIView *)view atPoint:(CGPoint)point withType:(CYReferenceType)layoutType offset:(CGSize)size;

/**
 *  添加view，同时设置view的frame填充self
 *
 *  @param view 要添加的UIView
 */
- (void)addSubViewFitToBounds:(UIView *)view;

/**
 *  添加view，同时设置frame
 *
 *  @param view 要添加的UIView
 *  @param edge view距离self的各边距，view.frame参照edge计算
 */
- (void)addSubView:(UIView *)view withEdge:(UIEdgeInsets)edge;

/**
 *  添加view，同时设置view的frame
 *
 *  @param view       要添加的UIView
 *  @param layoutType 参照模式，具体请查看本文件开头部分，view的frame参照此值计算
 *  @param refView    view参照的UIView，view的frame参照refView.frame及layoutType计算
 */
- (void)addSubView:(UIView *)view withType:(CYReferenceType)layoutType referenceView:(UIView *)refView;

/**
 *  添加view，同时设置view的frame及偏移量
 *
 *  @param view       要添加的UIView
 *  @param layoutType 参照模式，具体请查看本文件开头部分，view的frame参照此值计算
 *  @param refView    view参照的UIView，view的frame参照refView.frame及layoutType计算
 *  @param size       view水平竖直方向偏移量
 */
- (void)addSubView:(UIView *)view withType:(CYReferenceType)layoutType referenceView:(UIView *)refView offset:(CGSize)size;

/**
 *  设置view的位置
 *
 *  @param refView view参照的UIView，view的frame参照refView.frame计算
 *  @param type    参照模式，具体请查看本文件开头部分，view的frame参照此值计算
 */
- (void)setLocationRefView:(UIView *)refView withRefType:(CYReferenceType)type;

/**
 *  设置view的位置及偏移量
 *
 *  @param refView view参照的UIView，view的frame参照refView.frame计算
 *  @param type    参照模式，具体请查看本文件开头部分，view的frame参照此值计算
 *  @param size    view水平竖直方向偏移量
 */
- (void)setLocationRefView:(UIView *)refView withRefType:(CYReferenceType)type offset:(CGSize)size;

/**
 *  在UIView内部截取一款矩形区域
 *
 *  @param type  参照模式，具体请查看本文件开头部分，返回的CGRect参照此值计算
 *  @param scale 控制矩形区域大小，参照self的缩放比例，返回的CGRect参照此值计算
 *
 *  @return 所截取的矩形区域
 */
- (CGRect)rectWithType:(CYReferenceType)type scaleSize:(CGSize)scale;

/**
 *  在UIView内部截取一款矩形区域
 *
 *  @param type  参照模式，具体请查看本文件开头部分，返回的CGRect参照此值计算
 *  @param scale 控制矩形区域大小，参照self的缩放比例，返回的CGRect参照此值计算
 *  @param size  矩形区域的水平竖直方向偏移量，返回的CGRect参照此值计算
 *
 *  @return 所截取的矩形区域
 */
- (CGRect)rectWithType:(CYReferenceType)type scaleSize:(CGSize)scale offset:(CGSize)size;

/**
 *  在UIView内部截取一款矩形区域
 *
 *  @param edge 矩形区域距离各边距离，返回的CGRect参照此值计算
 *
 *  @return 所截取的矩形区域
 */
- (CGRect)rectWithEdge:(UIEdgeInsets)edge;

/**
 *  在UIView内部截取一款矩形区域
 *
 *  @param type    参照模式，具体请查看本文件开头部分，返回的CGRect参照此值计算
 *  @param refRect 返回的CGRect参照的CGRect，返回的CGRect参照此值计算
 *  @param size    矩形区域的大小，返回的CGRect参照此值计算
 *
 *  @return 所截取的矩形区域
 */
- (CGRect)rectWithType:(CYReferenceType)type referenceRect:(CGRect)refRect size:(CGSize)size;

/**
 *  在UIView内部截取一款矩形区域
 *
 *  @param type    参照模式，具体请查看本文件开头部分，返回的CGRect参照此值计算
 *  @param refRect 返回的CGRect参照的CGRect，返回的CGRect参照此值计算
 *  @param size    矩形区域的大小
 *  @param oSize   矩形区域的水平竖直方向偏移量，返回的CGRect参照此值计算
 *
 *  @return 所截取的矩形区域
 */
- (CGRect)rectWithType:(CYReferenceType)type referenceRect:(CGRect)refRect size:(CGSize)size offset:(CGSize)oSize;

/**
 *  改变self的frame
 *
 *  @param type  参照模式，具体请查看本文件开头部分，self的frame参照此值计算
 *  @param scale 形变度，参照self的缩放比例，self的frame参照此值计算
 */
- (void)changeTransformScaleWithType:(CYReferenceType)type scale:(CGSize)scale;

/**
 *  改变self的frame
 *
 *  @param type 参照模式，具体请查看本文件开头部分，self的frame参照此值计算
 *  @param size 形变度，参照self的增减尺寸，self的frame参照此值计算
 */
- (void)changeTransformScaleWithType:(CYReferenceType)type size:(CGSize)size;

/**
 *  改变self的frame，使用此方法self.superView必须存在，否则……
 *
 *  @param edge view距离view.superView的各边尺寸，self的frame参照此值计算
 */
- (void)setFrameInSuperViewWithEdge:(UIEdgeInsets)edge;

/**
 *  设置self在self.superView中的位置，使用此方法self.superView必须存在，否则……
 *
 *  @param tolSz self.superView总共需要均分的行列数
 *  @param locSz self在self.superView的位置，以行列方式指定
 *  @param clip  default is NO， if YES将会改变self尺寸为一个单元格的尺寸
 */
- (void)setFrameWithTotalSize:(CYCountSize)tolSz location:(CYCountSize)locSz clip:(BOOL)clip;

/**
 *  添加view，同时设置位置frame
 *
 *  @param view  要添加的UIView
 *  @param tolSz self总共需要均分的行列数
 *  @param locSz view在self的位置，以行列方式指定
 *  @param clip  default is NO， if YES将会改变view尺寸为一个单元格的尺寸
 */
- (void)addSubView:(UIView *)view withTotalSize:(CYCountSize)tolSz location:(CYCountSize)locSz clip:(BOOL)clip;

@end
