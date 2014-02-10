//
//  MCNotification.m
//  MCNotificationManagerDemo
//
//  Created by Matthew Cheok on 10/2/14.
//  Copyright (c) 2014 Matthew Cheok. All rights reserved.
//

#import "MCNotification.h"

@implementation MCNotification

+ (instancetype)notification {
    return [[self alloc] init];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _tintColor = [UIColor whiteColor];
    }
    return self;
}

@end
