//
//  UILocalNotification+MSWatchKitNotificationSerialization.h
//  Pods
//
//  Created by Mike Simons on 3/8/15.
//
//

#import <UIKit/UIKit.h>

@interface UILocalNotification (MSWatchKitNotificationSerialization)

-(NSData*) ms_serializedNotification;
+(UILocalNotification*) ms_notificationFromSerializedData:(NSData*)data;

@end
