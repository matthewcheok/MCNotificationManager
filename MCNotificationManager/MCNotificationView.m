//
//  MCNotificationView.m
//  MCNotificationManagerDemo
//
//  Created by Matthew Cheok on 10/2/14.
//  Copyright (c) 2014 Matthew Cheok. All rights reserved.
//

#import "MCNotificationView.h"

CGFloat const kMCNotificationDefaultViewWidth     = 300;
CGFloat const kMCNotificationDefaultViewHeight    = 64;
static CGFloat const kMCNotificationViewPadding   = 10;
static CGFloat const kMCNotificationViewImageSize = 44;

@interface MCNotificationView ()

@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UILabel *textLabel;
@property (strong, nonatomic) UILabel *detailTextLabel;

@end

@implementation MCNotificationView

- (instancetype)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		_imageView = [[UIImageView alloc] init];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
		_imageView.tintColor = [UIColor whiteColor];
		[self addSubview:_imageView];
        
		_textLabel = [[UILabel alloc] init];
		_textLabel.textColor = [UIColor whiteColor];
		_textLabel.font = [UIFont boldSystemFontOfSize:15];
		[self addSubview:_textLabel];
        
        _detailTextLabel = [[UILabel alloc] init];
        _detailTextLabel.textColor = [UIColor whiteColor];
        _detailTextLabel.font = [UIFont systemFontOfSize:13];
        [self addSubview:_detailTextLabel];
	}
	return self;
}

- (void)layoutSubviews {
	[super layoutSubviews];
	CGRect bounds = self.bounds;
    CGFloat offset = (CGRectGetWidth(bounds)-kMCNotificationDefaultViewWidth)/2;
    
	bounds.origin.y += 20; bounds.size.height -= 20;
	self.imageView.frame = CGRectMake(offset,
                                      20, // status bar height
                                      kMCNotificationViewImageSize,
                                      kMCNotificationViewImageSize);
    
    if (!self.detailTextLabel.text ||
        [self.detailTextLabel.text isEqualToString:@""]) {
        self.textLabel.frame = CGRectMake(offset+kMCNotificationViewImageSize+kMCNotificationViewPadding,
                                          20,
                                          kMCNotificationDefaultViewWidth-kMCNotificationViewImageSize-kMCNotificationViewPadding,
                                          44);
    }
    else {
        self.textLabel.frame = CGRectMake(offset+kMCNotificationViewImageSize+kMCNotificationViewPadding,
                                          20+22-[self.textLabel.font lineHeight],
                                          kMCNotificationDefaultViewWidth-kMCNotificationViewImageSize-kMCNotificationViewPadding,
                                          22);
        self.detailTextLabel.frame = CGRectMake(offset+kMCNotificationViewImageSize+kMCNotificationViewPadding,
                                                20+20,
                                                kMCNotificationDefaultViewWidth-kMCNotificationViewImageSize-kMCNotificationViewPadding,
                                                22);
    }
}

#pragma mark - Properties

- (void)setNotification:(MCNotification *)notification {
    _notification = notification;
    
    self.imageView.image = notification.image;
	self.textLabel.text = notification.text;
    if (notification.attributedText) {
        self.textLabel.attributedText = notification.attributedText;
    }
    if (notification.attributedDetailText) {
        self.detailTextLabel.attributedText = notification.attributedDetailText;
    }
    
    self.imageView.tintColor = notification.tintColor;
    self.textLabel.textColor = notification.textColor;
    if (notification.textFont) {
        self.textLabel.font = notification.textFont;
    }
    if (notification.detailTextFont) {
        self.detailTextLabel.font = notification.detailTextFont;
    }
    self.detailTextLabel.textColor = notification.textColor;
    
    if (self.frame.size.width != notification.height) {
        [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, notification.height)];
    }
    
    [self addTarget:notification.target action:notification.action forControlEvents:notification.controlEvents];
    
    [self setNeedsLayout];
}

@end
