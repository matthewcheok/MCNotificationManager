//
//  MCNotification.m
//  MCNotificationManagerDemo
//
//  Created by Matthew Cheok on 10/2/14.
//  Copyright (c) 2014 Matthew Cheok. All rights reserved.
//

#import "MCNotification.h"
#import "MCNotificationView.h"

extern CGFloat const kMCNotificationDefaultViewHeight;

@interface MCNotification()
@end

@implementation MCNotification

+ (instancetype)notification {
    return [[self alloc] init];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _tintColor = [UIColor whiteColor];
        _duration = 0;
    }
    return self;
}

- (CGFloat)height
{
    return _height ?: kMCNotificationDefaultViewHeight;
}

- (Class)viewClass
{
    if (!_viewClass) {
        return [MCNotificationView class];
    }
    return _viewClass;
}

- (void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents {
    _target = target;
    _action = action;
    _controlEvents = controlEvents;
}

@end
