//
//  MCNotificationView.h
//  MCNotificationManagerDemo
//
//  Created by Matthew Cheok on 10/2/14.
//  Copyright (c) 2014 Matthew Cheok. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MCNotification.h"

@interface MCNotificationView : UIView

@property (strong, nonatomic) MCNotification *notification;

+ (instancetype)view;

@end
