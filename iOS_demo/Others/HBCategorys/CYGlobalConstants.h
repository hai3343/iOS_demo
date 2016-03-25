//
//  CYGlobalConstants.h
//  gintong
//
//  Created by Andrew on 15/2/10.
//  Copyright (c) 2015年 Andrew. All rights reserved.
//
//#import <UIKit/UIKit.h>
//#import <Foundation/Foundation.h>

typedef enum {
    CYRefTypeCenter,
    CYRefTypeLeftTop,
    CYRefTypeLeftMiddle,
    CYRefTypeLeftBottom,
    CYRefTypeRightTop,
    CYRefTypeRightMiddle,
    CYRefTypeRightBottom,
    CYRefTypeMiddleTop,
    CYRefTypeMiddleBottom,
    CYRefTypeTop,
    CYRefTypeLeft,
    CYRefTypeBottom,
    CYRefTypeRight,
    CYRefTypeOther
} CYRefType;


UIColor *getColorWithNumbers(CGFloat r, CGFloat g, CGFloat b, CGFloat a);

double maxerDouble(double a, double b);
double minerDouble(double a, double b);

CGSize sumOfTwoSize(CGSize size1, CGSize size2);

CGPoint CGPointAddCGSize(CGPoint point, CGSize size);
CGPoint CGPointSubCGSize(CGPoint point, CGSize size);
CGPoint CGPointSubAddCGSize(CGPoint point, CGSize size);
CGPoint CGPointAddSubCGSize(CGPoint point, CGSize size);

CGRect CGRectInCGRectWithIedge(CGRect refRect, UIEdgeInsets edge);

CGSize CGSizeAddCGSize(CGSize sz1, CGSize sz2);
CGSize CGSizeAddSubCGSize(CGSize sz1, CGSize sz2);
CGSize CGSizeSubAddCGSize(CGSize sz1, CGSize sz2);
CGSize CGSizeSubCGSize(CGSize sz1, CGSize sz2);


CGRect *setCGRectCenterWithCGPoint(CGRect *prt, CGPoint point);
CGRect *setCGRectMiddleTopWithCGPoint(CGRect *prt, CGPoint point);
CGRect *setCGRectMiddleBottomWithCGPoint(CGRect *prt, CGPoint point);
CGRect *setCGRectOriginWithCGPoint(CGRect *prt, CGPoint point);
CGRect *setCGRectLeftMiddleWithCGPoint(CGRect *prt, CGPoint point);
CGRect *setCGRectLeftBottomWithCGPoint(CGRect *prt, CGPoint point);
CGRect *setCGRectRightTopWithCGPoint(CGRect *prt, CGPoint point);
CGRect *setCGRectRightMiddleWithCGPoint(CGRect *prt, CGPoint point);
CGRect *setCGRectRightBottomWithCGPoint(CGRect *prt, CGPoint point);

CGPoint CGPointOfCGRectCenter(CGRect rect);
CGPoint CGPointOfCGRectMiddleTop(CGRect rect);
CGPoint CGPointOfCGRectMiddleBottom(CGRect rect);

CGPoint CGPointOfCGRectLeftMiddle(CGRect rect);
CGPoint CGPointOfCGRectLeftBottom(CGRect rect);

CGPoint CGPointOfCGRectRightTop(CGRect rect);
CGPoint CGPointOfCGRectRightMiddle(CGRect rect);
CGPoint CGPointOfCGRectRightBottom(CGRect rect);


CGRect rectRefRectWithType(CGRect srcRt, CGRect refRt, CYRefType type);
