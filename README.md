# MSWatchKitNotifications

### Usage

In WatchKit:

```objc
   UILocalNotification* notification = [UILocalNotification new];
   notification.alertTitle = @"Notification From WatchKit";
   notification.alertBody = @"Notification";
   
   [WKInterfaceController presentLocalNotificationNow:notification completion:nil];
```

In your app delegate’s `application:handleWatchKitExtensionRequest:reply:`
```objc
  BOOL notificationHandled = [MSWatchKitNotificationHandler handleNotificationsFromWatchKit:userInfo replyBlock:reply];
   
   if (!notificationHandled) {
      NSLog(@"Client App should handle this request");
   }
```


To run the example project, clone the repo, and run `pod install` from the Example directory first.

### Requirements

iOS 8.2 

### Installation

MSWatchKitNotifications is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following to your Podfile:

```
#for your main app target
pod "MSWatchKitNotifications"

#for your extension
target 'MyApp WatchKit Extension', :exclusive => true do
   pod "MSWatchKitNotifications/Extension"
end

  ```

Both your app and WatchKit extension need to be integrated via your podfile.

### Author

Mike Simons, [@waltflanagan](http://twitter.com/waltflanagan)

## License

MSWatchKitNotifications is available under the MIT license. See the LICENSE file for more info.

