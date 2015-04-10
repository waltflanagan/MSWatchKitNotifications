//
//  MSWatchKitNotificationHandler.m
//  Pods
//
//  Created by Mike Simons on 3/8/15.
//
//

#import "MSWatchKitNotificationHandler.h"
#import "UILocalNotification+MSWatchKitNotificationSerialization.h"
#import "MSWatchKitNotificationsInternals.h"

UILocalNotification* _notificationFromUserInfo(NSDictionary* userInfo)
{
   NSData* notificationData = userInfo[MSWatchKitNotificationNotificationPayloadKey];
   UILocalNotification* notification = [UILocalNotification ms_notificationFromSerializedData:notificationData];
   
   return notification;
}

@implementation MSWatchKitNotificationHandler

+(BOOL) handleNotificationsFromWatchKit:(NSDictionary*) userInfo replyBlock:(void(^)(NSDictionary*))reply
{
   BOOL handled = NO;
   NSString* action = userInfo[MSWatchKitNotificationActionKey];
 
   UILocalNotification* notification = _notificationFromUserInfo(userInfo);
   
   if( notification != nil )
   {
      if( [action isEqualToString:MSWatchKitNotificationActionScheduleNotification] )
      {
         [[UIApplication sharedApplication] scheduleLocalNotification:notification];
      }
      else if( [action isEqualToString:MSWatchKitNotificationActionPresentNotificationNow])
      {
         [[UIApplication sharedApplication] presentLocalNotificationNow:notification];
      }
      reply(nil);
      handled = YES;
   }
   else if ( [action isEqualToString:MSWatchKitNotificationActionCancelNotification] )
   {
      UILocalNotification* notification = _notificationFromUserInfo(userInfo);
      
      [[UIApplication sharedApplication] cancelLocalNotification:notification];
   }
   else if ( [action isEqualToString:MSWatchKitNotificationActionCancelAllNotifications] )
   {
      [[UIApplication sharedApplication] cancelAllLocalNotifications];
      reply(nil);
      handled = YES;
   }
   else if ( [action isEqualToString:MSWatchKitNotificationActionRetreiveScheduledNotifications] )
   {
      NSArray* notifications = [[UIApplication sharedApplication] scheduledLocalNotifications];
      
      NSMutableArray* notificationDatas = [NSMutableArray array];
      
      for (UILocalNotification* notification in notifications) {
         [notificationDatas addObject:[notification ms_serializedNotification]];
      }
      
      reply(@{MSWatchKitNotificationRetrievedNotifications : notificationDatas});
      handled = YES;
   }
   
   return handled;
}




@end
