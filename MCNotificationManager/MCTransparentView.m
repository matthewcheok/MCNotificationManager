//
//  MCTransparentView.m
//  MCNotificationManagerDemo
//
//  Created by Matthew Cheok on 10/2/14.
//  Copyright (c) 2014 Matthew Cheok. All rights reserved.
//

#import "MCTransparentView.h"

@implementation MCTransparentView

- (id)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		// Initialization code
	}
	return self;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
	UIView *view = [super hitTest:point withEvent:event];
	return view == self ? nil : view;
}

@end
