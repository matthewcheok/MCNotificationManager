//
//  MCNotificationManager.m
//  MCNotificationManagerDemo
//
//  Created by Matthew Cheok on 10/2/14.
//  Copyright (c) 2014 Matthew Cheok. All rights reserved.
//

#import "MCNotificationManager.h"
#import "MCNotificationView.h"
#import "MCTransparentView.h"

static NSTimeInterval const kMCNotificationManagerAnimationDuration    = 0.3;
static NSTimeInterval const kMCNotificationManagerPresentationDuration = 3;

@interface MCNotificationManager ()

@property (strong, nonatomic) NSMutableArray *queue;
@property (strong, nonatomic) UIView *bannerView;

@end

@implementation MCNotificationManager

+ (instancetype)sharedInstance {
	static dispatch_once_t pred = 0;
	__strong static id _sharedObject = nil;
	dispatch_once(&pred, ^{
	    _sharedObject = [[self alloc] init];
	});
	return _sharedObject;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _queue = [NSMutableArray array];
    }
    return self;
}

#pragma mark - Methods

- (void)showNotification:(MCNotification *)notification {
    [self.queue addObject:notification];
    [self processNotifications];
}

- (void)processNotifications {
    if ([self.queue count] > 0 && !self.bannerView) {
        MCNotification *notification = [self.queue firstObject];
        [self.queue removeObjectAtIndex:0];
        
        MCNotificationView *view = [MCNotificationView view];
        view.notification = notification;
        
        if (0 == notification.duration)
            notification.duration = kMCNotificationManagerPresentationDuration;
        
        UIView *containerView = [self containerViewInKeyWindow];
        
        // create banner view
        UIToolbar *bannerView = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(containerView.bounds), CGRectGetHeight(view.frame))];
        bannerView.barStyle = UIBarStyleBlack;
        bannerView.barTintColor = view.notification.backgroundColor;
        
        // center notification view in banner
        view.center = CGPointMake(CGRectGetWidth(bannerView.bounds)/2,
                                  CGRectGetHeight(bannerView.bounds)/2);
        
        // create view hierarchy
        [bannerView addSubview:view];
        self.bannerView = bannerView;
        
        [containerView addSubview:self.bannerView];
        self.bannerView.transform = CGAffineTransformMakeTranslation(0, -CGRectGetHeight(self.bannerView.frame));
        
        __weak typeof(self) weakSelf = self;
        [UIView animateWithDuration:kMCNotificationManagerAnimationDuration delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            typeof(self) strongSelf = weakSelf;
            strongSelf.bannerView.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            typeof(self) strongSelf = weakSelf;
		    [strongSelf performSelector:@selector(hideNotification) withObject:nil afterDelay:notification.duration];
        }];
    }
}

- (void)hideNotification {
    [[self class] cancelPreviousPerformRequestsWithTarget:self selector:@selector(hideNotification) object:nil];
    
    if (self.bannerView) {
        __weak typeof(self) weakSelf = self;
        [UIView animateWithDuration:kMCNotificationManagerAnimationDuration delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            typeof(self) strongSelf = weakSelf;
            strongSelf.bannerView.transform = CGAffineTransformMakeTranslation(0, -CGRectGetHeight(strongSelf.bannerView.frame));
        } completion:^(BOOL finished) {
            typeof(self) strongSelf = weakSelf;
            [[strongSelf.bannerView superview] removeFromSuperview];
            strongSelf.bannerView = nil;
            
            [strongSelf processNotifications];
        }];
    }
}

#pragma mark - Utility

static CGFloat RotationAngleAccountingForOrientation(UIInterfaceOrientation orientation) {
	switch (orientation) {
		case UIInterfaceOrientationLandscapeLeft:
			return -M_PI / 2;
			break;
            
		case UIInterfaceOrientationLandscapeRight:
			return M_PI / 2;
			break;
            
		case UIInterfaceOrientationPortraitUpsideDown:
			return M_PI;
			break;
            
		default:
			return 0;
			break;
	}
}

- (UIView *)containerViewInKeyWindow {
	UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;

	UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
	CGRect bounds = keyWindow.bounds;
	if (UIInterfaceOrientationIsLandscape(orientation)) {
		bounds.size = CGSizeMake(CGRectGetHeight(bounds), CGRectGetWidth(bounds));
	}

	CGAffineTransform transform = CGAffineTransformIdentity;
	if (UIInterfaceOrientationIsLandscape(orientation)) {
		CGFloat offset = fabs(CGRectGetWidth(bounds) - CGRectGetHeight(bounds)) / 2.0;
		transform = CGAffineTransformTranslate(transform, -offset, offset);
	}
	transform = CGAffineTransformRotate(transform, RotationAngleAccountingForOrientation(orientation));
    
    UIView *containerView = [[MCTransparentView alloc] initWithFrame:bounds];
    containerView.transform = transform;
    
    [keyWindow addSubview:containerView];
    
    return containerView;
}

@end
