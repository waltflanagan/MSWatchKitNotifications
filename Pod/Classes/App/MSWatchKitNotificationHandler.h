//
//  MSWatchKitNotificationHandler.h
//  Pods
//
//  Created by Mike Simons on 3/8/15.
//
//

#import <Foundation/Foundation.h>

@interface MSWatchKitNotificationHandler : NSObject

+(BOOL) handleNotificationsFromWatchKit:(NSDictionary*) userInfo replyBlock:(void(^)(NSDictionary*))reply;

@end
