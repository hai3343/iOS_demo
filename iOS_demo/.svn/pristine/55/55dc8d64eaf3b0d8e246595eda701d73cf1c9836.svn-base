//
//  EGORefreshTableHeaderView.m
//  Demo
//
//  Created by Devin Doty on 10/14/09October14.
//  Copyright 2009 enormego. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "EGORefreshTableHeaderView.h"





@interface EGORefreshTableHeaderView (Private)
- (void)setState:(EGOPullRefreshState)aState;
@end

@implementation EGORefreshTableHeaderView

@synthesize delegate=_delegate;

- (id)initWithFrame:(CGRect)frame withCtlClass:(NSString *)ctlClass
{
    if (self = [super initWithFrame:frame]) {
        
        //self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        self.backgroundColor = kColorSeven;
        _ctlClass = ctlClass;
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, frame.size.height - 30.0f, self.frame.size.width, 20.0f)];
        label.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        label.font = [UIFont systemFontOfSize:12.0f];
        label.textColor = TEXT_COLOR;
        label.shadowColor = [UIColor colorWithWhite:0.9f alpha:1.0f];
        label.shadowOffset = CGSizeMake(0.0f, 1.0f);
        label.backgroundColor = [UIColor clearColor];
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
        _lastUpdatedLabel = label;
        [label release];
        
        label = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, frame.size.height - 48.0f, self.frame.size.width, 20.0f)];
        label.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        label.font = [UIFont boldSystemFontOfSize:13.0f];
        label.textColor = TEXT_COLOR;
        label.shadowColor = [UIColor colorWithWhite:0.9f alpha:1.0f];
        label.shadowOffset = CGSizeMake(0.0f, 1.0f);
        label.backgroundColor = [UIColor clearColor];
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
        _statusLabel = label;
        [label release];
        
        //		CALayer *layer = [CALayer layer];
        //		layer.frame = CGRectMake(25.0f, frame.size.height - 65.0f, 30.0f, 55.0f);
        //		layer.contentsGravity = kCAGravityResizeAspect;
        //		layer.contents = (id)[UIImage imageNamed:@"blueArrow.png"].CGImage;
        //
        //#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 40000
        //		if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
        //			layer.contentsScale = [[UIScreen mainScreen] scale];
        //		}
        //#endif
        //
        //		[[self layer] addSublayer:layer];
        //		_arrowImage=layer;
        
        CircleView *circleView = [[CircleView alloc] initWithFrame:CGRectMake(25.0f, frame.size.height - 41.0f, 26.0f, 26.0f)];
        _circleView = circleView;
        [self addSubview:circleView];
        [_circleView release];
        
        if([ctlClass isEqualToString:@"PrivateTalkViewController"])
        {
            _circleView.hidden = YES;
            _lastUpdatedLabel.hidden = YES;
        }
        else
        {
            _circleView.hidden = NO;
            _lastUpdatedLabel.hidden = NO;
        }
        
        //		UIActivityIndicatorView *view = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        //		view.frame = CGRectMake(25.0f, frame.size.height - 38.0f, 20.0f, 20.0f);
        //		[self addSubview:view];
        //		_activityView = view;
        //		[view release];
        
        
        [self setState:EGOOPullRefreshNormal];
        
    }
    
    return self;
    
}

#pragma mark -
#pragma mark Setters
//更新最后刷新时间
- (void)refreshLastUpdatedDate {
    
    if ([_delegate respondsToSelector:@selector(egoRefreshTableDataSourceLastUpdated:)]) {
        
        //        NSString *lastRefresh_time_userDefaults = [NSString stringWithFormat:@"EGORefreshTableView_LastRefresh_%@",_ctlClass];
        //        NSString *lastRefresh_time = [[NSUserDefaults standardUserDefaults] objectForKey:lastRefresh_time_userDefaults];
        NSDate *date = [_delegate egoRefreshTableDataSourceLastUpdated:self];
        
        [NSDateFormatter setDefaultFormatterBehavior:NSDateFormatterBehaviorDefault];
        NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
        //		[dateFormatter setDateStyle:NSDateFormatterShortStyle];
        //		[dateFormatter setTimeStyle:NSDateFormatterShortStyle];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        
        NSString *lastUpdated = NSLocalizedString(@"最后更新时间:", @"");
        _lastUpdatedLabel.text = [NSString stringWithFormat:@"%@ %@",lastUpdated, [dateFormatter stringFromDate:date]];
        
        [[NSUserDefaults standardUserDefaults] setObject:_lastUpdatedLabel.text forKey:@"EGORefreshTableView_LastRefresh"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
    } else {
        _lastUpdatedLabel.text = nil;
    }
}

- (void)setState:(EGOPullRefreshState)aState {
    
    switch (aState) {
        case EGOOPullRefreshPulling:
            
            //			_statusLabel.text = NSLocalizedString(@"Release to refresh...", @"Release to refresh status");
            _statusLabel.text = NSLocalizedString(@"松开后刷新", @"");
            [CATransaction begin];
            [CATransaction setAnimationDuration:FLIP_ANIMATION_DURATION];
            _arrowImage.transform = CATransform3DMakeRotation((M_PI / 180.0) * 180.0f, 0.0f, 0.0f, 1.0f);
            [CATransaction commit];
            
            break;
        case EGOOPullRefreshNormal:
            
            if (_state == EGOOPullRefreshPulling) {
                [CATransaction begin];
                [CATransaction setAnimationDuration:FLIP_ANIMATION_DURATION];
                _arrowImage.transform = CATransform3DIdentity;
                [CATransaction commit];
            }
            else {
                //                _circleView.transform = CGAffineTransformIdentity;
                _circleView.progress = 0;
                [_circleView setNeedsDisplay];
            }
            
            //			_statusLabel.text = NSLocalizedString(@"Pull down to refresh...", @"Pull down to refresh status");
            _statusLabel.text = NSLocalizedString(@"下拉加载消息", @"");
            [_activityView stopAnimating];
            [CATransaction begin];
            [CATransaction setValue:(id)kCFBooleanTrue forKey:kCATransactionDisableActions];
            _arrowImage.hidden = NO;
            _arrowImage.transform = CATransform3DIdentity;
            [CATransaction commit];
            
            [self refreshLastUpdatedDate];
            
            break;
            
        case EGOOPullRefreshLoading:
            
            //			_statusLabel.text = NSLocalizedString(@"Loading...", @"Loading Status");
            _statusLabel.text = NSLocalizedString(@"加载中...", @"");
            [_activityView startAnimating];
            [CATransaction begin];
            [CATransaction setValue:(id)kCFBooleanTrue forKey:kCATransactionDisableActions];
            _arrowImage.hidden = YES;
            [CATransaction commit];
            
            CABasicAnimation* rotate =  [CABasicAnimation animationWithKeyPath: @"transform.rotation.z"];
            rotate.removedOnCompletion = FALSE;
            rotate.fillMode = kCAFillModeForwards;
            
            //Do a series of 5 quarter turns for a total of a 1.25 turns
            //(2PI is a full turn, so pi/2 is a quarter turn)
            [rotate setToValue: [NSNumber numberWithFloat: M_PI / 2]];
            rotate.repeatCount = 80;
            
            rotate.duration = 0.25;
            //            rotate.beginTime = start;
            rotate.cumulative = TRUE;
            rotate.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
            
            [_circleView.layer addAnimation:rotate forKey:@"rotateAnimation"];
            
            break;
        default:
            break;
    }
    
    _state = aState;
}


#pragma mark -
#pragma mark ScrollView Methods

- (void)egoRefreshScrollViewWillBeginScroll:(UIScrollView *)scrollView
{
    BOOL _loading = NO;
    if ([_delegate respondsToSelector:@selector(egoRefreshTableDataSourceIsLoading:)]) {
        _loading = [_delegate egoRefreshTableDataSourceIsLoading:self];
    }
    if (!_loading) {
        [self setState:EGOOPullRefreshNormal];
    }
}

- (void)egoRefreshScrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (_state == EGOOPullRefreshLoading) {
        
        CGFloat offset = MAX(scrollView.contentOffset.y * -1, 0);
        offset = MIN(offset, 60);
        scrollView.contentInset = UIEdgeInsetsMake(offset, 0.0f, 0.0f, 0.0f);
        
    } else if (scrollView.isDragging) {
        
        BOOL _loading = NO;
        if ([_delegate respondsToSelector:@selector(egoRefreshTableDataSourceIsLoading:)]) {
            _loading = [_delegate egoRefreshTableDataSourceIsLoading:self];
        }
        
        //		if (_state == EGOOPullRefreshPulling && scrollView.contentOffset.y > -65.0f && scrollView.contentOffset.y < 0.0f && !_loading) {
        //			[self setState:EGOOPullRefreshNormal];
        //		} else if (_state == EGOOPullRefreshNormal && scrollView.contentOffset.y < -65.0f && !_loading) {
        //			[self setState:EGOOPullRefreshPulling];
        //		}
        
        if (_state == EGOOPullRefreshPulling && scrollView.contentOffset.y > -65.0f && scrollView.contentOffset.y < 0.0f && !_loading) {
            [self setState:EGOOPullRefreshNormal];
        } else if (_state == EGOOPullRefreshNormal && scrollView.contentOffset.y < -15.0f && !_loading) {
            CGFloat moveY = fabs(scrollView.contentOffset.y);
            if (moveY > 65)
                moveY = 65;
            _circleView.progress = (moveY-20) / (65-20);
            [_circleView setNeedsDisplay];
            
            if (scrollView.contentOffset.y < -65.0f) {
                [self setState:EGOOPullRefreshPulling];
            }
        }
        
        if (scrollView.contentInset.top != 0) {
            scrollView.contentInset = UIEdgeInsetsZero;
        }
        
    }
}

- (void)egoRefreshScrollViewDidEndDragging:(UIScrollView *)scrollView {
    
    BOOL _loading = NO;
    if ([_delegate respondsToSelector:@selector(egoRefreshTableDataSourceIsLoading:)]) {
        _loading = [_delegate egoRefreshTableDataSourceIsLoading:self];
    }
    
    if (scrollView.contentOffset.y <= - 65.0f && !_loading) {
        
        if ([_delegate respondsToSelector:@selector(egoRefreshTableDidTriggerRefresh:)]) {
            [_delegate egoRefreshTableDidTriggerRefresh:0];
        }
        
        [self setState:EGOOPullRefreshLoading];
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.2];
        scrollView.contentInset = UIEdgeInsetsMake(60.0f, 0.0f, 0.0f, 0.0f);
        [UIView commitAnimations];
        
    }
}

- (void)egoRefreshScrollViewDataSourceDidFinishedLoading:(UIScrollView *)scrollView {
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    [scrollView setContentInset:UIEdgeInsetsMake(0.0f, 0.0f, 0.0f, 0.0f)];
    [UIView commitAnimations];
    
    [self setState:EGOOPullRefreshNormal];
    
    double delayInSeconds = 0.2;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [_circleView.layer removeAllAnimations];
    });
}

#pragma mark 强制更新时启动刷新代理
- (void)forceToRefresh:(UIScrollView *)scrollView {
    BOOL _loading = NO;
    if ([_delegate respondsToSelector:@selector(egoRefreshTableDataSourceIsLoading:)]) {
        _loading = [_delegate egoRefreshTableDataSourceIsLoading:self];
    }
    
    if (!_loading) {
        if ([_delegate respondsToSelector:@selector(egoRefreshTableDidTriggerRefresh:)]) {
            [_delegate egoRefreshTableDidTriggerRefresh:0];
        }
        
        _circleView.progress = 1;
        [_circleView setNeedsDisplay];
        
        [self setState:EGOOPullRefreshLoading];
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.2];
        scrollView.contentInset = UIEdgeInsetsMake(60.0f, 0.0f, 0.0f, 0.0f);
        scrollView.contentOffset = CGPointMake(scrollView.contentOffset.x, -65.0f);
        [UIView commitAnimations];
    }
}

#pragma mark -
#pragma mark Dealloc

- (void)dealloc {
    _delegate = nil;
    _activityView = nil;
    _statusLabel = nil;
    _arrowImage = nil;
    _lastUpdatedLabel = nil;
    [super dealloc];
}


@end
