//
//  UIView+CYViewGeometry.m
//  gintong
//
//  Created by Andrew on 15/2/11.
//  Copyright (c) 2015年 Andrew. All rights reserved.
//

#import "UIView+CYViewGeometry.h"
#import "CYGlobalConstants.h"

CYCountSize CYCountSizeMake(signed rows, signed columns)
{
    return (CYCountSize){rows, columns};
}

@implementation UIView (CYViewGeometry)

+ (instancetype)view
{
    return [[self alloc] init];
}
+ (instancetype)viewWithFrame:(CGRect)frame
{
    return [[self alloc] initWithFrame:frame];
}
+ (instancetype)viewWithBackColor:(UIColor *)color
{
    return [[self alloc] initWithBackColor:color];
}

- (instancetype)initWithBackColor:(UIColor *)color
{
    self = [self init];
    if (nil != self)
        self.backgroundColor = color;
    return self;
}


#pragma mark ----------------x------------
- (CGFloat)x
{
    return self.frame.origin.x;
}
- (void)setX:(CGFloat)x
{
    CGRect rect = self.frame;
    rect.origin.x = x;
    self.frame = rect;
}
- (CGFloat)minX
{
    return self.frame.origin.x;
}
- (void)setMinX:(CGFloat)minX
{
    CGRect rect = self.frame;
    rect.origin.x = minX;
    self.frame = rect;
}
- (CGFloat)midX
{
    CGRect rect = self.frame;
    return rect.origin.x + rect.size.width / 2;
}
- (void)setMidX:(CGFloat)midX
{
    CGRect rect = self.frame;
    rect.origin.x = midX - rect.size.width / 2;
    self.frame = rect;
}
- (CGFloat)maxX
{
    CGRect rect = self.frame;
    return rect.origin.x + rect.size.width;
}
- (void)setMaxX:(CGFloat)maxX
{
    CGRect rect = self.frame;
    rect.origin.x = maxX - rect.size.width;
    self.frame = rect;
}


#pragma mark ----------------y------------
- (CGFloat)y
{
    return self.frame.origin.y;
}
- (void)setY:(CGFloat)y
{
    CGRect rect = self.frame;
    rect.origin.y = y;
    self.frame = rect;
}
- (CGFloat)minY
{
    return self.frame.origin.y;
}
- (void)setMinY:(CGFloat)minY
{
    CGRect rect = self.frame;
    rect.origin.y = minY;
    self.frame = rect;
}
- (CGFloat)midY
{
    CGRect rect = self.frame;
    return rect.origin.y + rect.size.height / 2;
}
- (void)setMidY:(CGFloat)midY
{
    CGRect rect = self.frame;
    rect.origin.y = midY - rect.size.height / 2;
    self.frame = rect;
}
- (CGFloat)maxY
{
    CGRect rect = self.frame;
    return rect.origin.y + rect.size.height;
}
- (void)setMaxY:(CGFloat)maxY
{
    CGRect rect = self.frame;
    rect.origin.y = maxY - rect.size.height;
    self.frame = rect;
}


#pragma mark ----------------size.point------------
- (CGFloat)width
{
    return self.frame.size.width;
}
- (void)setWidth:(CGFloat)width
{
    CGRect rect = self.frame;
    rect.size.width = width;
    self.frame = rect;
}
- (CGFloat)height
{
    return self.frame.size.height;
}
- (void)setHeight:(CGFloat)height
{
    CGRect rect = self.frame;
    rect.size.height = height;
    self.frame = rect;
}
- (CGSize)size
{
    return self.frame.size;
}
- (void)setSize:(CGSize)size
{
    CGRect rect = self.frame;
    rect.size = size;
    self.frame = rect;
}
- (CGPoint)origin
{
    return self.frame.origin;
}
- (void)setOrigin:(CGPoint)origin
{
    CGRect rect = self.frame;
    rect.origin = origin;
    self.frame = rect;
}


#pragma mark ----------------bounds------------
- (CGFloat)midXb
{
    return self.bounds.size.width / 2;
}
- (void)setMidXb:(CGFloat)midXb
{
    CGRect rect = self.bounds;
    rect.size.width = 2 * midXb;
    self.bounds = rect;
}
- (CGFloat)maxXb
{
    return self.bounds.size.width;
}
- (void)setMaxXb:(CGFloat)maxXb
{
    CGRect rect = self.bounds;
    rect.size.width = maxXb;
    self.bounds = rect;
}
- (CGFloat)midYb
{
    return self.bounds.size.height / 2;
}
- (void)setMidYb:(CGFloat)midYb
{
    CGRect rect = self.bounds;
    rect.size.height = 2 * midYb;
    self.bounds = rect;
}
- (CGFloat)maxYb
{
    return self.bounds.size.height;
}
- (void)setMaxYb:(CGFloat)maxYb
{
    CGRect rect = self.bounds;
    rect.size.height = maxYb;
    self.bounds = rect;
}


#pragma mark --------------property.point------------
- (CGPoint)centerb
{
    return CGPointMake(self.midXb, self.midYb);
}
- (void)setCenterb:(CGPoint)centerb
{
    self.size = CGSizeMake(2 * centerb.x, 2 * centerb.y);
}
- (CGPoint)leftMiddleb
{
    return CGPointMake(0, self.midYb);
}
- (void)setLeftMiddleb:(CGPoint)leftMiddleb
{
    self.size = CGSizeMake(self.width, 2 * leftMiddleb.y);
}
- (CGPoint)leftMiddle
{
    return CGPointMake(self.minX, self.midY);
}
- (void)setLeftMiddle:(CGPoint)leftMiddle
{
    self.origin = CGPointMake(leftMiddle.x, leftMiddle.y - self.height / 2);
}
- (CGPoint)leftBottomb
{
    return CGPointMake(0, self.maxYb);
}
- (void)setLeftBottomb:(CGPoint)leftBottomb
{
    self.size = CGSizeMake(0, leftBottomb.y);
}
- (CGPoint)leftBottom
{
    return CGPointMake(self.minX, self.maxY);
}
- (void)setLeftBottom:(CGPoint)leftBottom
{
    self.origin = CGPointMake(leftBottom.x, leftBottom.y - self.height);
}
- (CGPoint)rightTopb
{
    return CGPointMake(self.maxXb, 0);
}
- (void)setRightTopb:(CGPoint)rightTopb
{
    self.size = CGSizeMake(rightTopb.x, 0);
}
- (CGPoint)rightTop
{
    return CGPointMake(self.maxX, self.minY);
}
- (void)setRightTop:(CGPoint)rightTop
{
    self.origin = CGPointMake(rightTop.x - self.width, rightTop.y);
}
- (CGPoint)rightMiddleb
{
    return CGPointMake(self.maxXb, self.midYb);
}
- (void)setRightMiddleb:(CGPoint)rightMiddleb
{
    self.size = CGSizeMake(rightMiddleb.x, 2 * rightMiddleb.y);
}
- (CGPoint)rightMiddle
{
    return CGPointMake(self.maxX, self.midY);
}
- (void)setRightMiddle:(CGPoint)rightMiddle
{
    self.origin = CGPointMake(rightMiddle.x - self.width, rightMiddle.y - self.height / 2);
}
- (CGPoint)rightBottomb
{
    return CGPointMake(self.maxXb, self.maxYb);
}
- (void)setRightBottomb:(CGPoint)rightBottomb
{
    self.size = CGSizeMake(rightBottomb.x, rightBottomb.y);
}
- (CGPoint)rightBottom
{
    return CGPointMake(self.maxX, self.maxY);
}
- (void)setRightBottom:(CGPoint)rightBottom
{
    self.origin = CGPointMake(rightBottom.x - self.width, rightBottom.y - self.height);
}
- (CGPoint)middleTopb
{
    return CGPointMake(self.midXb, 0);
}
- (void)setMiddleTopb:(CGPoint)middleTopb
{
    self.size = CGSizeMake(2 * middleTopb.x, 0);
}
- (CGPoint)middleTop
{
    return CGPointMake(self.midX, self.minY);
}
- (void)setMiddleTop:(CGPoint)middleTop
{
    self.origin = CGPointMake(middleTop.x - self.width / 2, middleTop.y);
}
- (CGPoint)middleBottomb
{
    return CGPointMake(self.midXb, self.maxYb);
}
- (void)setMiddleBottomb:(CGPoint)middleBottomb
{
    self.size = CGSizeMake(2 * middleBottomb.x, middleBottomb.y);
}
- (CGPoint)middleBottom
{
    return CGPointMake(self.midX, self.maxY);
}
- (void)setMiddleBottom:(CGPoint)middleBottom
{
    self.origin = CGPointMake(middleBottom.x - self.width / 2, middleBottom.y - self.height);
}


#pragma mark ------------property.view-----------
- (UIView *)centerView
{
    NSArray *Views = self.subviews;
    for (UIView *view in Views)
        if (CGPointEqualToPoint(view.center, self.centerb))
            return view;
    return nil;
}
- (void)setCenterView:(UIView *)centerView
{
    if (nil == centerView) return;
    if ([centerView isKindOfClass:[UIView class]])
    {
        centerView.center = self.centerb;
        [self addSubview:centerView];
    }
}
- (UIView *)middleTopView
{
    NSArray *Views = self.subviews;
    for (UIView *view in Views)
        if (CGPointEqualToPoint(view.middleTop, self.middleTopb))
            return view;
    return nil;
}
- (void)setMiddleTopView:(UIView *)middleTopView
{
    if (nil == middleTopView) return;
    if ([middleTopView isKindOfClass:[UIView class]])
    {
        middleTopView.middleTop = self.middleTopb;
        [self addSubview:middleTopView];
    }
}
- (UIView *)middleBottomView
{
    NSArray *Views = self.subviews;
    for (UIView *view in Views)
        if (CGPointEqualToPoint(view.middleBottom, self.middleBottomb))
            return view;
    return nil;
}
- (void)setMiddleBottomView:(UIView *)middleBottomView
{
    if (nil == middleBottomView) return;
    if ([middleBottomView isKindOfClass:[UIView class]])
    {
        middleBottomView.middleBottom = self.middleBottomb;
        [self addSubview:middleBottomView];
    }
}
- (UIView *)leftTopView
{
    NSArray *Views = self.subviews;
    for (UIView *view in Views)
        if (CGPointEqualToPoint(view.origin, CGPointZero))
            return view;
    return nil;
}
- (void)setLeftTopView:(UIView *)leftTopView
{
    if (nil == leftTopView) return;
    if ([leftTopView isKindOfClass:[UIView class]])
    {
        leftTopView.origin = CGPointZero;
        [self addSubview:leftTopView];
    }
}
- (UIView *)leftMiddleView
{
    NSArray *Views = self.subviews;
    
    for (UIView *view in Views)
        if (CGPointEqualToPoint(view.leftMiddle, self.leftMiddleb))
            return view;
    return nil;
}
- (void)setLeftMiddleView:(UIView *)leftMiddleView
{
    if (nil == leftMiddleView) return;
    if ([leftMiddleView isKindOfClass:[UIView class]])
    {
        leftMiddleView.leftMiddle = self.leftMiddleb;
        [self addSubview:leftMiddleView];
    }
}
- (UIView *)leftBottomView
{
    NSArray *Views = self.subviews;
    for (UIView *view in Views)
        if (CGPointEqualToPoint(view.leftBottom, self.leftBottomb))
            return view;
    return nil;
}
- (void)setLeftBottomView:(UIView *)leftBottomView
{
    if (nil == leftBottomView) return;
    if ([leftBottomView isKindOfClass:[UIView class]])
    {
        leftBottomView.leftBottom = self.leftBottomb;
        [self addSubview:leftBottomView];
    }
}
- (UIView *)rightTopView
{
    NSArray *Views = self.subviews;
    for (UIView *view in Views)
        if (CGPointEqualToPoint(view.rightTop, self.rightTopb))
            return view;
    return nil;
}
- (void)setRightTopView:(UIView *)rightTopView
{
    if (nil == rightTopView) return;
    if ([rightTopView isKindOfClass:[UIView class]])
    {
        rightTopView.rightTop = self.rightTopb;
        [self addSubview:rightTopView];
    }
}
- (UIView *)rightMiddleView
{
    NSArray *Views = self.subviews;
    for (UIView *view in Views)
        if (CGPointEqualToPoint(view.rightMiddle, self.rightMiddleb))
            return view;
    return nil;
}
- (void)setRightMiddleView:(UIView *)rightMiddleView
{
    if (nil == rightMiddleView) return;
    if ([rightMiddleView isKindOfClass:[UIView class]])
    {
        [self addSubview:rightMiddleView];
        rightMiddleView.rightMiddle = self.rightMiddleb;
    }
}
- (UIView *)rightBottomView
{
    NSArray *Views = self.subviews;
    for (UIView *view in Views)
        if (CGPointEqualToPoint(view.rightBottom, self.rightBottomb))
            return view;
    return nil;
}
- (void)setRightBottomView:(UIView *)rightBottomView
{
    if (nil == rightBottomView) return;
    if ([rightBottomView isKindOfClass:[UIView class]])
    {
        rightBottomView.rightBottom = self.rightBottomb;
        [self addSubview:rightBottomView];
    }
}


#pragma mark ------add.view.extension-----
- (void)addSubView:(UIView *)view withFrame:(CGRect)frame
{
    view.frame = frame;
    [self addSubview:view];
}
- (void)addSubView:(UIView *)view atPoint:(CGPoint)point withSize:(CGSize)size
{
    view.frame = (CGRect){point, size};
    [self addSubview:view];
}

- (void)addSubview:(UIView *)view withType:(CYReferenceType)layoutType
{
    switch (layoutType)
    {
        case CYReferenceTypeCenter:
            self.centerView = view;
            return;
            
        case CYReferenceTypeLeftTop:
            self.leftTopView = view;
            return;
            
        case CYReferenceTypeLeftMiddle:
            self.leftMiddleView = view;
            return;
            
        case CYReferenceTypeLeftBottom:
            self.leftBottomView = view;
            return;
            
        case CYReferenceTypeMiddleTop:
            self.middleTopView = view;
            return;
            
        case CYReferenceTypeMiddleBottom:
            self.middleBottomView = view;
            return;
            
        case CYReferenceTypeRightTop:
            self.rightTopView = view;
            return;
            
        case CYReferenceTypeRightMiddle:
            self.rightMiddleView = view;
            return;
            
        case CYReferenceTypeRightBottom:
            self.rightBottomView = view;
            return;
            
        default:;
    }
}
- (void)addSubview:(UIView *)view withType:(CYReferenceType)layoutType offset:(CGSize)size
{
    [self addSubview:view withType:layoutType];
    
    switch (layoutType)
    {
        case CYReferenceTypeCenter:
            view.origin = CGPointAddCGSize(view.origin, size);
            return;
            
        case CYReferenceTypeLeftTop:
            view.origin = CGPointAddCGSize(view.origin, size);
            return;
            
        case CYReferenceTypeLeftMiddle:
            view.origin = CGPointAddCGSize(view.origin, size);
            return;
            
        case CYReferenceTypeLeftBottom:
            view.origin = CGPointAddSubCGSize(view.origin, size);
            return;
            
        case CYReferenceTypeMiddleTop:
            view.origin = CGPointAddCGSize(view.origin, size);
            return;
            
        case CYReferenceTypeMiddleBottom:
            view.origin = CGPointAddSubCGSize(view.origin, size);
            return;
            
        case CYReferenceTypeRightTop:
            view.origin = CGPointSubAddCGSize(view.origin, size);
            return;
            
        case CYReferenceTypeRightMiddle:
            view.origin = CGPointSubAddCGSize(view.origin, size);
            return;
            
        case CYReferenceTypeRightBottom:
            view.origin = CGPointSubCGSize(view.origin, size);
            return;
            
        default:;
    }
}

- (void)addSubview:(UIView *)view atPoint:(CGPoint)point withType:(CYReferenceType)layoutType
{
    switch (layoutType)
    {
        case CYReferenceTypeCenter:
            view.center = point;
            break;
            
        case CYReferenceTypeLeftTop:
            view.origin = point;
            break;
            
        case CYReferenceTypeLeftMiddle:
            view.leftMiddle = point;
            break;
            
        case CYReferenceTypeLeftBottom:
            view.leftBottom = point;
            break;
            
        case CYReferenceTypeMiddleTop:
            view.middleTop = point;
            break;
            
        case CYReferenceTypeMiddleBottom:
            view.middleBottom = point;
            break;
            
        case CYReferenceTypeRightTop:
            view.rightTop = point;
            break;
            
        case CYReferenceTypeRightMiddle:
            view.rightMiddle = point;
            break;
            
        case CYReferenceTypeRightBottom:
            view.rightBottom = point;
            break;
            
        default:;
    }
    [self addSubview:view];
}
- (void)addSubview:(UIView *)view atPoint:(CGPoint)point withType:(CYReferenceType)layoutType offset:(CGSize)size
{
    [self addSubview:view atPoint:point withType:layoutType];
    view.origin = CGPointAddCGSize(view.origin, size);
}

- (void)addSubViewFitToBounds:(UIView *)view
{
    view.frame = self.bounds;
    [self addSubview:view];
}
- (void)addSubView:(UIView *)view withEdge:(UIEdgeInsets)edge
{
    view.frame = CGRectMake(edge.left, edge.top, self.width - edge.right - edge.left, self.height - edge.top - edge.bottom);
    [self addSubview:view];
}

- (void)addSubView:(UIView *)view withType:(CYReferenceType)layoutType referenceView:(UIView *)refView
{
    switch (layoutType)
    {
        case CYReferenceTypeTop:
            view.maxY = refView.minY;
            break;
            
        case CYReferenceTypeLeft:
            view.maxX = refView.minX;
            break;
            
        case CYReferenceTypeBottom:
            view.minY = refView.maxY;
            break;
            
        case CYReferenceTypeRight:
            view.minX = refView.maxX;
            break;
            
        case CYReferenceTypeMiddleTop:
            view.middleBottom = refView.middleTop;
            break;
            
        case CYReferenceTypeLeftMiddle:
            view.rightMiddle = refView.leftMiddle;
            break;
            
        case CYReferenceTypeMiddleBottom:
            view.middleTop = refView.middleBottom;
            break;
            
        case CYReferenceTypeRightMiddle:
            view.leftMiddle = refView.rightMiddle;
            break;
            
        case CYReferenceTypeLeftTop:
            view.rightBottom = refView.origin;
            break;
            
        case CYReferenceTypeLeftBottom:
            view.rightTop = refView.leftBottom;
            break;
            
        case CYReferenceTypeRightTop:
            view.leftBottom = refView.rightTop;
            break;
            
        case CYReferenceTypeRightBottom:
            view.origin = refView.rightBottom;
            break;
            
        case CYReferenceTypeCenter:
            view.center = refView.center;
            
        default:;
    }
    
    [self addSubview:view];
}
- (void)addSubView:(UIView *)view withType:(CYReferenceType)layoutType referenceView:(UIView *)refView offset:(CGSize)size
{
    [self addSubView:view withType:layoutType referenceView:refView];
    
    switch (layoutType)
    {
        case CYReferenceTypeTop:
            view.origin = CGPointAddSubCGSize(view.origin, size);
            break;
            
        case CYReferenceTypeLeft:
            view.origin = CGPointSubAddCGSize(view.origin, size);
            break;
            
        case CYReferenceTypeBottom:
            view.origin = CGPointAddCGSize(view.origin, size);
            break;
            
        case CYReferenceTypeRight:
            view.origin = CGPointAddCGSize(view.origin, size);
            break;
            
        case CYReferenceTypeMiddleTop:
            view.origin = CGPointAddSubCGSize(view.origin, size);
            break;
            
        case CYReferenceTypeLeftMiddle:
            view.origin = CGPointSubAddCGSize(view.origin, size);
            break;
            
        case CYReferenceTypeMiddleBottom:
            view.origin = CGPointAddCGSize(view.origin, size);
            break;
            
        case CYReferenceTypeRightMiddle:
            view.origin = CGPointAddCGSize(view.origin, size);
            break;
            
        case CYReferenceTypeLeftTop:
            view.origin = CGPointSubCGSize(view.origin, size);
            break;
            
        case CYReferenceTypeLeftBottom:
            view.origin = CGPointSubAddCGSize(view.origin, size);
            break;
            
        case CYReferenceTypeRightTop:
            view.origin = CGPointAddSubCGSize(view.origin, size);
            break;
            
        case CYReferenceTypeRightBottom:
            view.origin = CGPointAddCGSize(view.origin, size);
            break;
            
        case CYReferenceTypeCenter:
            view.origin = CGPointAddCGSize(view.origin, size);
            break;
            
        default:;
    }
}

- (void)setLocationRefView:(UIView *)refView withRefType:(CYReferenceType)type
{
    switch (type)
    {
        case CYReferenceTypeTop:
            self.maxY = refView.minY;
            break;
            
        case CYReferenceTypeLeft:
            self.maxX = refView.minX;
            break;
            
        case CYReferenceTypeBottom:
            self.minY = refView.maxY;
            break;
            
        case CYReferenceTypeRight:
            self.minX = refView.maxX;
            break;
            
        case CYReferenceTypeCenter:
            self.center = refView.center;
            break;
            
        case CYReferenceTypeMiddleTop:
            self.middleBottom = refView.middleTop;
            break;
            
        case CYReferenceTypeMiddleBottom:
            self.middleTop = refView.middleBottom;
            break;
            
        case CYReferenceTypeLeftTop:
            self.rightBottom = refView.origin;
            break;
            
        case CYReferenceTypeLeftMiddle:
            self.rightMiddle = refView.leftMiddle;
            break;
            
        case CYReferenceTypeLeftBottom:
            self.rightTop = refView.leftBottom;
            break;
            
        case CYReferenceTypeRightTop:
            self.leftBottom = refView.rightTop;
            break;
            
        case CYReferenceTypeRightMiddle:
            self.leftMiddle = refView.rightMiddle;
            break;
            
        case CYReferenceTypeRightBottom:
            self.origin = refView.rightBottom;
            break;
            
        default:;
    }
}
- (void)setLocationRefView:(UIView *)refView withRefType:(CYReferenceType)type offset:(CGSize)size
{
    [self setLocationRefView:refView withRefType:type];
    
    switch (type)
    {
        case CYReferenceTypeTop:
            self.origin = CGPointAddSubCGSize(self.origin, size);
            break;
            
        case CYReferenceTypeLeft:
            self.origin = CGPointAddCGSize(self.origin, size);
            break;
            
        case CYReferenceTypeCenter:
            self.origin = CGPointAddCGSize(self.origin, size);
            break;
            
        case CYReferenceTypeBottom:
            self.origin = CGPointAddCGSize(self.origin, size);
            break;
            
        case CYReferenceTypeRight:
            self.origin = CGPointSubAddCGSize(self.origin, size);
            break;
            
        case CYReferenceTypeLeftTop:
            self.origin = CGPointSubCGSize(self.origin, size);
            break;
            
        case CYReferenceTypeLeftMiddle:
            self.origin = CGPointSubAddCGSize(self.origin, size);
            break;
            
        case CYReferenceTypeLeftBottom:
            self.origin = CGPointSubAddCGSize(self.origin, size);
            break;
            
        case CYReferenceTypeMiddleTop:
            self.origin = CGPointAddSubCGSize(self.origin, size);
            break;
            
        case CYReferenceTypeMiddleBottom:
            self.origin = CGPointAddCGSize(self.origin, size);
            break;
            
        case CYReferenceTypeRightTop:
            self.origin = CGPointAddSubCGSize(self.origin, size);
            break;
            
        case CYReferenceTypeRightMiddle:
            self.origin = CGPointAddCGSize(self.origin, size);
            break;
            
        case CYReferenceTypeRightBottom:
            self.origin = CGPointAddCGSize(self.origin, size);
            break;
            
        default:
            break;
    }
}

#pragma mark ------------rect.in.view-----------
- (CGRect)rectWithType:(CYReferenceType)type scaleSize:(CGSize)scale
{
    CGRect rect = CGRectMake(0, 0, self.width * scale.width, self.height * scale.height);
    
    switch (type)
    {
        case CYReferenceTypeCenter:
            rect.origin.x = self.midXb - rect.size.width/2;
            rect.origin.y = self.midYb - rect.size.height/2;
            break;
            
        case CYReferenceTypeMiddleTop:
            rect.origin.x = self.midXb - rect.size.width/2;
            break;
            
        case CYReferenceTypeMiddleBottom:
            rect.origin.x = self.midXb - rect.size.width/2;
            rect.origin.y = self.maxYb - rect.size.height;
            break;
            
        case CYReferenceTypeLeftMiddle:
            rect.origin.y = self.midYb - rect.size.height/2;
            break;
            
        case CYReferenceTypeLeftBottom:
            rect.origin.y = self.maxYb - rect.size.height;
            break;
            
        case CYReferenceTypeRightTop:
            rect.origin.x = self.maxXb - rect.size.width;
            break;
            
        case CYReferenceTypeRightMiddle:
            rect.origin.x = self.maxXb - rect.size.width;
            rect.origin.y = self.midYb - rect.size.height/2;
            break;
            
        case CYReferenceTypeRightBottom:
            rect.origin = CGPointSubCGSize(self.rightBottom, rect.size);
            break;
            
        default:;
    }
    
    return rect;
}
- (CGRect)rectWithType:(CYReferenceType)type scaleSize:(CGSize)scale offset:(CGSize)size
{
    CGRect rect = [self rectWithType:type scaleSize:scale];
    
    switch (type)
    {
        case CYReferenceTypeCenter:
            rect.origin = CGPointAddCGSize(rect.origin, size);
            break;
            
        case CYReferenceTypeMiddleTop:
            rect.origin = CGPointAddCGSize(rect.origin, size);
            break;
            
        case CYReferenceTypeMiddleBottom:
            rect.origin = CGPointAddSubCGSize(rect.origin, size);
            break;
            
        case CYReferenceTypeLeftTop:
            rect.origin = CGPointAddCGSize(rect.origin, size);
            break;
            
        case CYReferenceTypeLeftMiddle:
            rect.origin = CGPointAddCGSize(rect.origin, size);
            break;
            
        case CYReferenceTypeLeftBottom:
            rect.origin = CGPointAddSubCGSize(rect.origin, size);
            break;
            
        case CYReferenceTypeRightTop:
            rect.origin = CGPointSubAddCGSize(rect.origin, size);
            break;
            
        case CYReferenceTypeRightMiddle:
            rect.origin = CGPointSubAddCGSize(rect.origin, size);
            break;
            
        case CYReferenceTypeRightBottom:
            rect.origin = CGPointSubCGSize(rect.origin, size);
            break;
            
        default:;
    }
    
    return rect;
}
- (CGRect)rectWithEdge:(UIEdgeInsets)edge
{
    return CGRectMake(edge.left, edge.top, self.width - edge.left - edge.right, self.height - edge.top - edge.bottom);
}
- (CGRect)rectWithType:(CYReferenceType)type referenceRect:(CGRect)refRect size:(CGSize)size
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    
    switch (type)
    {
        case CYReferenceTypeTop:
            rect.origin.y = refRect.origin.y - rect.size.height;
            break;
            
        case CYReferenceTypeLeft:
            rect.origin.x = refRect.origin.x - rect.size.width;
            break;
            
        case CYReferenceTypeBottom:
            rect.origin.y = refRect.origin.y + refRect.size.height;
            break;
            
        case CYReferenceTypeRight:
            rect.origin.x = refRect.origin.x + refRect.size.width;
            break;
            
        case CYReferenceTypeCenter:
            rect.origin.x = (refRect.size.width - rect.size.width)/2;
            rect.origin.y = (refRect.size.height - rect.size.height)/2;
            break;
            
        case CYReferenceTypeMiddleTop:
            rect.origin.x = refRect.origin.x + (refRect.size.width - rect.size.width)/2;
            rect.origin.y = refRect.origin.y - rect.size.height;
            break;
            
        case CYReferenceTypeMiddleBottom:
            rect.origin.x = refRect.origin.x + (refRect.size.width - rect.size.width)/2;
            rect.origin.y = refRect.origin.y + refRect.size.height;
            break;
            
        case CYReferenceTypeLeftTop:
            rect.origin.x = refRect.origin.x - rect.size.width;
            rect.origin.y = refRect.origin.y - rect.size.height;
            break;
            
        case CYReferenceTypeLeftMiddle:
            rect.origin.x = refRect.origin.x - rect.size.width;
            rect.origin.y = refRect.origin.y + (refRect.size.height - rect.size.height)/2;
            break;
            
        case CYReferenceTypeLeftBottom:
            rect.origin.x = refRect.origin.x - rect.size.width;
            rect.origin.y = refRect.origin.y + refRect.size.height;
            break;
            
        case CYReferenceTypeRightTop:
            rect.origin.x = refRect.origin.x + refRect.size.width;
            rect.origin.y = refRect.origin.y - rect.size.height;
            break;
            
        case CYReferenceTypeRightMiddle:
            rect.origin.x = refRect.origin.x + refRect.size.width;
            rect.origin.y = refRect.origin.y + (refRect.size.height - rect.size.height)/2;
            break;
            
        case CYReferenceTypeRightBottom:
            rect.origin.x = refRect.origin.x + refRect.size.width;
            rect.origin.y = refRect.origin.y + refRect.size.height;
            break;
            
        default:;
    }
    
    return rect;
}
- (CGRect)rectWithType:(CYReferenceType)type referenceRect:(CGRect)refRect size:(CGSize)size offset:(CGSize)oSize
{
    CGRect rect = [self rectWithType:type referenceRect:refRect size:size];
    
    switch (type)
    {
        case CYReferenceTypeCenter:
            rect.origin = CGPointAddCGSize(rect.origin, oSize);
            break;
            
        case CYReferenceTypeMiddleTop:
            rect.origin = CGPointAddSubCGSize(rect.origin, oSize);
            break;
            
        case CYReferenceTypeMiddleBottom:
            rect.origin = CGPointAddCGSize(rect.origin, oSize);
            break;
            
        case CYReferenceTypeLeftTop:
            rect.origin = CGPointSubCGSize(rect.origin, oSize);
            break;
            
        case CYReferenceTypeLeftMiddle:
            rect.origin = CGPointSubAddCGSize(rect.origin, oSize);
            break;
            
        case CYReferenceTypeLeftBottom:
            rect.origin = CGPointSubAddCGSize(rect.origin, oSize);
            break;
            
        case CYReferenceTypeRightTop:
            rect.origin = CGPointAddSubCGSize(rect.origin, oSize);
            break;
            
        case CYReferenceTypeRightMiddle:
            rect.origin = CGPointAddCGSize(rect.origin, oSize);
            break;
            
        case CYReferenceTypeRightBottom:
            rect.origin = CGPointAddCGSize(rect.origin, oSize);
            break;
            
        case CYReferenceTypeTop:
            rect.origin = CGPointAddSubCGSize(rect.origin, oSize);
            break;
            
        case CYReferenceTypeLeft:
            rect.origin = CGPointSubAddCGSize(rect.origin, oSize);
            break;
            
        case CYReferenceTypeBottom:
            rect.origin = CGPointAddCGSize(rect.origin, oSize);
            break;
            
        case CYReferenceTypeRight:
            rect.origin = CGPointSubAddCGSize(rect.origin, oSize);
            break;
            
        default:;
    }
    
    return rect;
}

#pragma mark ------------view.transform-----------
- (void)changeTransformScaleWithType:(CYReferenceType)type scale:(CGSize)scale
{
    CGPoint point = CGPointZero;
    
    switch (type)
    {
        case CYReferenceTypeCenter:
            point = self.center;
            break;
            
        case CYReferenceTypeMiddleTop:
            point = self.middleTop;
            break;
            
        case CYReferenceTypeMiddleBottom:
            point = self.middleBottom;
            break;
            
        case CYReferenceTypeLeftTop:
            point = self.origin;
            break;
            
        case CYReferenceTypeLeftMiddle:
            point = self.leftMiddle;
            break;
            
        case CYReferenceTypeLeftBottom:
            point = self.leftBottom;
            break;
            
        case CYReferenceTypeRightTop:
            point = self.rightTop;
            break;
            
        case CYReferenceTypeRightMiddle:
            point = self.rightMiddle;
            break;
            
        case CYReferenceTypeRightBottom:
            point = self.rightBottom;
            break;
            
        default:;
    }
    
    self.size = CGSizeMake(self.width * scale.width, self.height * scale.height);
    
    switch (type)
    {
        case CYReferenceTypeCenter:
            self.center = point;
            break;
            
        case CYReferenceTypeMiddleTop:
            self.middleTop = point;
            break;
            
        case CYReferenceTypeMiddleBottom:
            self.middleBottom = point;
            break;
            
        case CYReferenceTypeLeftTop:
            self.origin = point;
            break;
            
        case CYReferenceTypeLeftMiddle:
            self.leftMiddle = point;
            break;
            
        case CYReferenceTypeLeftBottom:
            self.leftBottom = point;
            break;
            
        case CYReferenceTypeRightTop:
            self.rightTop = point;
            break;
            
        case CYReferenceTypeRightMiddle:
            self.rightMiddle = point;
            break;
            
        case CYReferenceTypeRightBottom:
            self.rightBottom = point;
            break;
            
        default:;
    }
}
- (void)changeTransformScaleWithType:(CYReferenceType)type size:(CGSize)size
{
    CGPoint point = CGPointZero;
    
    switch (type)
    {
        case CYReferenceTypeCenter:
            point = self.center;
            break;
            
        case CYReferenceTypeMiddleTop:
            point = self.middleTop;
            break;
            
        case CYReferenceTypeMiddleBottom:
            point = self.middleBottom;
            break;
            
        case CYReferenceTypeLeftTop:
            point = self.origin;
            break;
            
        case CYReferenceTypeLeftMiddle:
            point = self.leftMiddle;
            break;
            
        case CYReferenceTypeLeftBottom:
            point = self.leftBottom;
            break;
            
        case CYReferenceTypeRightTop:
            point = self.rightTop;
            break;
            
        case CYReferenceTypeRightMiddle:
            point = self.rightMiddle;
            break;
            
        case CYReferenceTypeRightBottom:
            point = self.rightBottom;
            break;
            
        default:;
    }
    
    self.size = CGSizeMake(self.width + size.width, self.height + size.height);
    
    switch (type)
    {
        case CYReferenceTypeCenter:
            self.center = point;
            break;
            
        case CYReferenceTypeMiddleTop:
            self.middleTop = point;
            break;
            
        case CYReferenceTypeMiddleBottom:
            self.middleBottom = point;
            break;
            
        case CYReferenceTypeLeftTop:
            self.origin = point;
            break;
            
        case CYReferenceTypeLeftMiddle:
            self.leftMiddle = point;
            break;
            
        case CYReferenceTypeLeftBottom:
            self.leftBottom = point;
            break;
            
        case CYReferenceTypeRightTop:
            self.rightTop = point;
            break;
            
        case CYReferenceTypeRightMiddle:
            self.rightMiddle = point;
            break;
            
        case CYReferenceTypeRightBottom:
            self.rightBottom = point;
            break;
            
        default:;
    }
}

- (void)setFrameInSuperViewWithEdge:(UIEdgeInsets)edge
{
    CGSize size = self.superview.bounds.size;
    self.frame = CGRectMake(edge.left, edge.top, size.width - edge.left - edge.right, size.height - edge.bottom - edge.top);
}

- (void)setFrameWithTotalSize:(CYCountSize)tolSz location:(CYCountSize)locSz clip:(BOOL)clip
{
    CGSize bnsSize = self.superview.bounds.size;
    CGSize tarSize = CGSizeMake(bnsSize.width/tolSz.cols, bnsSize.height/tolSz.rows);
    if (clip)
        self.size = tarSize;
    self.center = CGPointMake((locSz.cols - .5) * tarSize.width, (locSz.rows - .5) * tarSize.height);
}

- (void)addSubView:(UIView *)view withTotalSize:(CYCountSize)tolSz location:(CYCountSize)locSz clip:(BOOL)clip;
{
    [self addSubview:view];
    [view setFrameWithTotalSize:tolSz location:locSz clip:clip];
}

@end
