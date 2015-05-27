//
//  WKInterfaceController+MSWatchKitNotifications.m
//  Pods
//
//  Created by Mike Simons on 3/8/15.
//
//

#import "WKInterfaceController+MSWatchKitNotifications.h"
#import "UILocalNotification+MSWatchKitNotificationSerialization.h"
#import "MSWatchKitNotificationsInternals.h"

@implementation WKInterfaceController (MSWatchKitNotifications)

+(void) scheduleNotification:(UILocalNotification*) notification completion:(void(^)(NSError* error))completion
{
   [WKInterfaceController openParentApplication:@{ MSWatchKitNotificationActionKey : MSWatchKitNotificationActionScheduleNotification,
                                                   MSWatchKitNotificationNotificationPayloadKey : [notification ms_serializedNotification]}
                                          reply:^(NSDictionary *replyInfo, NSError *replyError) {
                                             if(completion)
                                             {
                                                completion(replyError);
                                             }
                                          }];
}

+(void) presentLocalNotificationNow:(UILocalNotification*) notification completion:(void(^)(NSError* error))completion
{
   [WKInterfaceController openParentApplication:@{ MSWatchKitNotificationActionKey : MSWatchKitNotificationActionPresentNotificationNow,
                                                   MSWatchKitNotificationNotificationPayloadKey : [notification ms_serializedNotification]}
                                          reply:^(NSDictionary *replyInfo, NSError *replyError) {
                                             if(completion)
                                             {
                                                completion(replyError);
                                             }
                                          }];
}

+(void) cancelLocalNotification:(UILocalNotification*) notification completion:(void(^)(NSError* error))completion
{
   [WKInterfaceController openParentApplication:@{ MSWatchKitNotificationActionKey : MSWatchKitNotificationActionCancelNotification,
                                                   MSWatchKitNotificationNotificationPayloadKey : [notification ms_serializedNotification]}
                                          reply:^(NSDictionary *replyInfo, NSError *replyError) {
                                             if(completion)
                                             {
                                                completion(replyError);
                                             }
                                          }];
}

+(void) cancelAllLocalNotificationsWithCompletionHandler:(void(^)(NSError* error))completion
{
   [WKInterfaceController openParentApplication:@{ MSWatchKitNotificationActionKey : MSWatchKitNotificationActionCancelAllNotifications }
                                          reply:^(NSDictionary *replyInfo, NSError *replyError) {
                                             if(completion)
                                             {
                                                completion(replyError);
                                             }
                                          }];
}

+(void) scheduledNotificationsWithCompletionHandler:(void(^)(NSArray* notifications, NSError* error))completion
{
   [WKInterfaceController openParentApplication:@{ MSWatchKitNotificationActionKey : MSWatchKitNotificationActionRetreiveScheduledNotifications  }
                                          reply:^(NSDictionary *replyInfo, NSError *replyError) {
                                             if( replyInfo && completion )
                                             {
                                                NSArray* notificationDatas = replyInfo[MSWatchKitNotificationRetrievedNotifications];
                                                
                                                NSMutableArray* notifications = [NSMutableArray array];
                                                
                                                for (NSData* notificationData in notificationDatas) {
                                                   UILocalNotification* notification = [UILocalNotification ms_notificationFromSerializedData:notificationData];
           
                                                   [notifications addObject:notification];
                                                }
                                                
                                                completion(notifications, replyError);
                                             }
                                          }];
}


@end
