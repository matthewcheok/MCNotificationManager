//
//  MCNotificationManager.h
//  MCNotificationManagerDemo
//
//  Created by Matthew Cheok on 10/2/14.
//  Copyright (c) 2014 Matthew Cheok. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MCNotification.h"

@interface MCNotificationManager : NSObject

+ (instancetype)sharedInstance;

- (void)showNotification:(MCNotification *)notification;
- (void)hideNotification;

@end
