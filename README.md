MCNotificationManager
=====================

Show your own banners like Notification Center within your app.


##Screenshot
![Screenshot](https://raw.github.com/matthewcheok/MCNotificationManager/master/screenshot1.png "Example of MCNotificationManager")
![Screenshot](https://raw.github.com/matthewcheok/MCNotificationManager/master/screenshot2.png "Example of MCNotificationManager")
![Screenshot](https://raw.github.com/matthewcheok/MCNotificationManager/master/screenshot3.png "Example of MCNotificationManager")


## Installation

Add the following to your [CocoaPods](http://cocoapods.org/) Podfile

    pod 'MCNotificationManager'

or clone as a git submodule,

or just copy files in the ```MCNotificationManager``` folder into your project.


## Using MCNotificationManager

First, setup your notification like this:

    MCNotification *notification = [MCNotification notification];
    notification.image = [UIImage imageNamed:@"IconChat"];
    notification.text = @"Tom";
    notification.detailText = @"How are things going? :)";
    notification.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    notification.tintColor = [UIColor colorWithWhite:0.25 alpha:1];

The `image`, `detailText`, `backgroundColor` and `tintColor` properties are optional.
Present your notification when ready:

    [[MCNotificationManager sharedInstance] showNotification:notification];

Notifications are automatically queued and presented one after the other.
This library works on iOS 7 and above on both iPhone and iPad.


## License

MCNotificationManager is under the MIT license.
