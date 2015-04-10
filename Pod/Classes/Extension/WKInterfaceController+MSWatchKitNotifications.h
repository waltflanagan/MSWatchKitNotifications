//
//  WKInterfaceController+MSWatchKitNotifications.h
//  Pods
//
//  Created by Mike Simons on 3/8/15.
//
//

@import WatchKit;

@interface WKInterfaceController (MSWatchKitNotifications)

+(void) scheduleNotification:(UILocalNotification*) notification completion:(void(^)(NSError* error))completion;
+(void) presentLocalNotificationNow:(UILocalNotification*) notification completion:(void(^)(NSError* error))completion;
+(void) cancelLocalNotification:(UILocalNotification*) notification completion:(void(^)(NSError* error))completion;
+(void) cancelAllLocalNotificationsWithCompletionHandler:(void(^)(NSError* error))completion;
+(void) scheduledNotificationsWithCompletionHandler:(void(^)(NSArray* notifications, NSError* error))completion;

@end
