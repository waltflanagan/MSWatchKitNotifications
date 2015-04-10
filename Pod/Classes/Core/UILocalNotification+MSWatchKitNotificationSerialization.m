//
//  UILocalNotification+MSWatchKitNotificationSerialization.m
//  Pods
//
//  Created by Mike Simons on 3/8/15.
//
//

#import "UILocalNotification+MSWatchKitNotificationSerialization.h"

@implementation UILocalNotification (MSWatchKitNotificationSerialization)

-(NSData*) ms_serializedNotification
{
   return [NSKeyedArchiver archivedDataWithRootObject:self];
}

+(UILocalNotification*) ms_notificationFromSerializedData:(NSData*)data
{
   return [NSKeyedUnarchiver unarchiveObjectWithData:data];
}

@end
