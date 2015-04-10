//
//  InterfaceController.m
//  MSWatchKitNotifications WatchKit Extension
//
//  Created by Mike Simons on 3/8/15.
//  Copyright (c) 2015 Mike Simons. All rights reserved.
//

#import "InterfaceController.h"
#import <MSWatchKitNotifications/MSWatchKitNotifications.h>

@interface InterfaceController()

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

- (IBAction)notifyMe {

   UILocalNotification* notification = [UILocalNotification new];
   notification.alertTitle = @"Notification From WatchKit";
   notification.alertBody = @"Notification";
   notification.fireDate = [[NSDate date] dateByAddingTimeInterval:5.0];
   
   [WKInterfaceController scheduleNotification:notification completion:^(NSError *error) {
      NSLog(@"WIN");
   }];
   
   [WKInterfaceController scheduledNotificationsWithCompletionHandler:^(NSArray* notifications, NSError *error) {
      
   }];
}

- (IBAction)notifyMeNow {
   
   UILocalNotification* notification = [UILocalNotification new];
   notification.alertTitle = @"Notification From WatchKit";
   notification.alertBody = @"Notification";
   
   [WKInterfaceController presentLocalNotificationNow:notification completion:nil];
}

@end



