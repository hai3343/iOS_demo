//
//  CYGlobalConstants.m
//  gintong
//
//  Created by Andrew on 15/2/10.
//  Copyright (c) 2015年 Andrew. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CYGlobalConstants.h"

UIColor *getColorWithNumbers(CGFloat r, CGFloat g, CGFloat b, CGFloat a)
{
    return [UIColor colorWithRed:r/255.f green:g/255.f blue:b/255.f alpha:a];
}

double maxerDouble(double a, double b)
{
    if (a > b)
        return a;
    return b;
}
double minerDouble(double a, double b)
{
    if (a < b)
        return a;
    return b;
}

CGSize sumOfTwoSize(CGSize size1, CGSize size2)
{
    return CGSizeMake(size1.width + size2.width, size2.height + size1.height);
}

CGPoint CGPointAddCGSize(CGPoint point, CGSize size)
{
    return CGPointMake(point.x + size.width, point.y + size.height);
}

CGPoint CGPointAddSubCGSize(CGPoint point, CGSize size)
{
    return CGPointMake(point.x + size.width, point.y - size.height);
}

CGPoint CGPointSubAddCGSize(CGPoint point, CGSize size)
{
    return CGPointMake(point.x - size.width, point.y + size.height);
}

CGPoint CGPointSubCGSize(CGPoint point, CGSize size)
{
    return CGPointMake(point.x - size.width, point.y - size.height);
}

CGRect CGRectInCGRectWithIedge(CGRect refRect, UIEdgeInsets edge)
{
    return CGRectMake(refRect.origin.x + edge.left, refRect.origin.y + edge.top, refRect.size.width - edge.left - edge.right, refRect.size.height - edge.top - edge.bottom);
}

CGSize CGSizeAddCGSize(CGSize sz1, CGSize sz2)
{
    return CGSizeMake(sz1.width + sz2.width, sz1.height + sz2.height);
}
CGSize CGSizeAddSubCGSize(CGSize sz1, CGSize sz2)
{
    return CGSizeMake(sz1.width + sz2.width, sz1.height - sz2.height);
}
CGSize CGSizeSubAddCGSize(CGSize sz1, CGSize sz2)
{
    return CGSizeMake(sz1.width - sz2.width, sz1.height + sz2.height);
}
CGSize CGSizeSubCGSize(CGSize sz1, CGSize sz2)
{
    return CGSizeMake(sz1.width - sz2.width, sz1.height - sz2.height);
}

CGRect *setCGRectCenterWithCGPoint(CGRect *prt, CGPoint point)
{
    prt->origin.x = point.x - prt->size.width/2;
    prt->origin.y = point.y - prt->size.height/2;
    return prt;
}

CGRect *setCGRectMiddleTopWithCGPoint(CGRect *prt, CGPoint point)
{
    prt->origin.x = point.x - prt->size.width/2;
    prt->origin.y = point.y;
    return prt;
}

CGRect *setCGRectMiddleBottomWithCGPoint(CGRect *prt, CGPoint point)
{
    prt->origin.x = point.x - prt->size.width/2;
    prt->origin.y = point.y - prt->size.height;
    return prt;
}

CGRect *setCGRectOriginWithCGPoint(CGRect *prt, CGPoint point)
{
    prt->origin = point;
    return prt;
}

CGRect *setCGRectLeftMiddleWithCGPoint(CGRect *prt, CGPoint point)
{
    prt->origin.x = point.x;
    prt->origin.y = point.y - prt->size.height/2;
    return prt;
}

CGRect *setCGRectLeftBottomWithCGPoint(CGRect *prt, CGPoint point)
{
    prt->origin.x = point.x;
    prt->origin.y = point.y - prt->size.height;
    return prt;
}

CGRect *setCGRectRightTopWithCGPoint(CGRect *prt, CGPoint point)
{
    prt->origin.x = point.x - prt->size.width;
    prt->origin.y = point.y;
    return prt;
}

CGRect *setCGRectRightMiddleWithCGPoint(CGRect *prt, CGPoint point)
{
    prt->origin.x = point.x - prt->size.width;
    prt->origin.y = point.y - prt->size.height/2;
    return prt;
}

CGRect *setCGRectRightBottomWithCGPoint(CGRect *prt, CGPoint point)
{
    prt->origin.x = point.x - prt->size.width;
    prt->origin.y = point.y - prt->size.height;
    return prt;
}

CGPoint CGPointOfCGRectCenter(CGRect rect)
{
    return CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
}
CGPoint CGPointOfCGRectMiddleTop(CGRect rect)
{
    return CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect));
}
CGPoint CGPointOfCGRectMiddleBottom(CGRect rect)
{
    return CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect));
}

CGPoint CGPointOfCGRectLeftMiddle(CGRect rect)
{
    return CGPointMake(CGRectGetMinX(rect), CGRectGetMidY(rect));
}
CGPoint CGPointOfCGRectLeftBottom(CGRect rect)
{
    return CGPointMake(CGRectGetMinX(rect), CGRectGetMaxY(rect));
}

CGPoint CGPointOfCGRectRightTop(CGRect rect)
{
    return CGPointMake(CGRectGetMaxX(rect), CGRectGetMinY(rect));
}
CGPoint CGPointOfCGRectRightMiddle(CGRect rect)
{
    return CGPointMake(CGRectGetMaxX(rect), CGRectGetMidY(rect));
}
CGPoint CGPointOfCGRectRightBottom(CGRect rect)
{
    return CGPointMake(CGRectGetMaxX(rect), CGRectGetMaxY(rect));
}

CGRect rectRefRectWithType(CGRect srcRt, CGRect refRt, CYRefType type)
{
    CGRect desRt = srcRt;
    
    switch (type)
    {
        case CYRefTypeTop:
            desRt.origin.y = refRt.origin.y - srcRt.size.height;
            break;
            
        case CYRefTypeLeft:
            desRt.origin.x = refRt.origin.x - srcRt.size.width;
            break;
            
        case CYRefTypeBottom:
            desRt.origin.y = refRt.origin.y + refRt.size.height;
            break;
            
        case CYRefTypeRight:
            desRt.origin.x = refRt.origin.x + refRt.size.width;
            break;
            
        case CYRefTypeCenter:
            setCGRectCenterWithCGPoint(&desRt, CGPointOfCGRectCenter(refRt));
            break;
            
        case CYRefTypeLeftTop:
            setCGRectRightBottomWithCGPoint(&desRt, refRt.origin);
            break;
            
        case CYRefTypeLeftMiddle:
            setCGRectRightMiddleWithCGPoint(&desRt, CGPointOfCGRectLeftMiddle(refRt));
            break;
            
        case CYRefTypeLeftBottom:
            setCGRectRightTopWithCGPoint(&desRt, CGPointOfCGRectLeftBottom(refRt));
            break;
            
        case CYRefTypeRightTop:
            setCGRectLeftBottomWithCGPoint(&desRt, CGPointOfCGRectRightTop(refRt));
            break;
            
        case CYRefTypeRightMiddle:
            setCGRectLeftMiddleWithCGPoint(&desRt, CGPointOfCGRectRightMiddle(refRt));
            break;
            
        case CYRefTypeMiddleBottom:
            setCGRectMiddleTopWithCGPoint(&desRt, CGPointOfCGRectMiddleBottom(refRt));
            break;
            
        case CYRefTypeMiddleTop:
            setCGRectMiddleBottomWithCGPoint(&desRt, CGPointOfCGRectMiddleTop(refRt));
            break;
            
        case CYRefTypeRightBottom:
            desRt.origin = CGPointOfCGRectRightBottom(refRt);
            break;
            
        default:;
    }
    
    return desRt;
}
