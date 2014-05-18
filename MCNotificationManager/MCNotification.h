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

@property (strong, nonatomic) NSDictionary *userInfo;
@property (assign, nonatomic) NSTimeInterval duration;

@property (weak, nonatomic, readonly) id target;
@property (assign, nonatomic, readonly) SEL action;
@property (assign, nonatomic, readonly) UIControlEvents controlEvents;

+ (instancetype)notification;
- (void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;

@end
