//
//  MCNotification.h
//  MCNotificationManagerDemo
//
//  Created by Matthew Cheok on 10/2/14.
//  Copyright (c) 2014 Matthew Cheok. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MCNotification : NSObject

@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) NSString *text;
@property (strong, nonatomic) NSString *detailText;

@property (strong, nonatomic) UIColor *tintColor;
@property (strong, nonatomic) UIColor *backgroundColor;

+ (instancetype)notification;

@end
