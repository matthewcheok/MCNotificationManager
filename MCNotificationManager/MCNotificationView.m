//
//  MCNotificationView.m
//  MCNotificationManagerDemo
//
//  Created by Matthew Cheok on 10/2/14.
//  Copyright (c) 2014 Matthew Cheok. All rights reserved.
//

#import "MCNotificationView.h"

static CGFloat const kMCNotificationViewWidth     = 300;
static CGFloat const kMCNotificationViewHeight    = 64;
static CGFloat const kMCNotificationViewPadding   = 10;
static CGFloat const kMCNotificationViewImageSize = 44;

@interface MCNotificationView ()

@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UILabel *textLabel;
@property (strong, nonatomic) UILabel *detailTextLabel;

@end

@implementation MCNotificationView

+ (instancetype)view {
    return [[self alloc] initWithFrame:CGRectMake(0, 0, kMCNotificationViewWidth, kMCNotificationViewHeight)];
}

- (instancetype)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		_imageView = [[UIImageView alloc] init];
        _imageView.contentMode = UIViewContentModeRight;
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
    CGFloat offset = (CGRectGetWidth(bounds)-kMCNotificationViewWidth)/2;
    
	bounds.origin.y += 20; bounds.size.height -= 20;
	self.imageView.frame = CGRectMake(offset,
                                      20, // status bar height
                                      kMCNotificationViewImageSize,
                                      kMCNotificationViewImageSize);
    
    if (!self.detailTextLabel.text ||
        [self.detailTextLabel.text isEqualToString:@""]) {
        self.textLabel.frame = CGRectMake(offset+kMCNotificationViewImageSize+kMCNotificationViewPadding,
                                          20,
                                          kMCNotificationViewWidth-kMCNotificationViewImageSize-kMCNotificationViewPadding,
                                          44);
        self.textLabel.numberOfLines = 2;
    }
    else {
        self.textLabel.numberOfLines = 1;
        self.textLabel.frame = CGRectMake(offset+kMCNotificationViewImageSize+kMCNotificationViewPadding,
                                          20+22-[self.textLabel.font lineHeight],
                                          kMCNotificationViewWidth-kMCNotificationViewImageSize-kMCNotificationViewPadding,
                                          22);
        self.detailTextLabel.frame = CGRectMake(offset+kMCNotificationViewImageSize+kMCNotificationViewPadding,
                                                20+20,
                                                kMCNotificationViewWidth-kMCNotificationViewImageSize-kMCNotificationViewPadding,
                                                22);
    }
}

#pragma mark - Properties

- (void)setNotification:(MCNotification *)notification {
    _notification = notification;
    
    self.imageView.image = notification.image;
	self.textLabel.text = notification.text;
    self.detailTextLabel.text = notification.detailText;
    
    self.imageView.tintColor = notification.tintColor;
    self.textLabel.textColor = notification.tintColor;
    self.detailTextLabel.textColor = notification.tintColor;
    
    [self addTarget:notification.target action:notification.action forControlEvents:notification.controlEvents];
    
    [self setNeedsLayout];
}

@end
