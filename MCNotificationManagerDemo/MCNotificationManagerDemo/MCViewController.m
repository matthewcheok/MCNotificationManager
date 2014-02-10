//
//  MCViewController.m
//  MCNotificationManagerDemo
//
//  Created by Matthew Cheok on 10/2/14.
//  Copyright (c) 2014 Matthew Cheok. All rights reserved.
//

#import "MCViewController.h"
#import "MCNotificationManager.h"

@interface MCViewController ()

@end

@implementation MCViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)showConnection:(id)sender {
    MCNotification *notification = [MCNotification notification];
    notification.image = [UIImage imageNamed:@"IconFlash"];
	notification.text = @"Whoops!";
	notification.detailText = @"Cannot connect to server";
    
	[[MCNotificationManager sharedInstance] showNotification:notification];
}

- (IBAction)showCloud:(id)sender {
    MCNotification *notification = [MCNotification notification];
    notification.image = [UIImage imageNamed:@"IconCloud"];
	notification.text = @"Sync";
	notification.detailText = @"Cloud syncing in progress";
    notification.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    notification.tintColor = [UIColor colorWithRed:0.239 green:0.306 blue:0.494 alpha:1];
    
	[[MCNotificationManager sharedInstance] showNotification:notification];
}

- (IBAction)showLike:(id)sender {
    MCNotification *notification = [MCNotification notification];
    notification.image = [UIImage imageNamed:@"IconLike"];
	notification.text = @"Liked!";
	notification.detailText = @"";
    notification.backgroundColor = [UIColor colorWithRed:0.239 green:0.306 blue:0.494 alpha:1];
    
	[[MCNotificationManager sharedInstance] showNotification:notification];
}

- (IBAction)showChat:(id)sender {
    MCNotification *notification = [MCNotification notification];
    notification.image = [UIImage imageNamed:@"IconChat"];
	notification.text = @"Tom";
	notification.detailText = @"How are things going? :)";
    notification.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    notification.tintColor = [UIColor colorWithWhite:0.25 alpha:1];
    
	[[MCNotificationManager sharedInstance] showNotification:notification];
}

- (IBAction)showArchived:(id)sender {
    MCNotification *notification = [MCNotification notification];
    notification.image = [UIImage imageNamed:@"IconBox"];
	notification.text = @"Archived";
	notification.detailText = @"Your data has been saved";
    notification.backgroundColor = [UIColor colorWithRed:0.722 green:0.776 blue:0.498 alpha:1];
    notification.tintColor = [UIColor blackColor];
    
	[[MCNotificationManager sharedInstance] showNotification:notification];
}

@end
