//
// Created by Cyandnow on 2018/6/25.
// Copyright (c) 2018 Cyandnow. All rights reserved.
//

#import "AppDelegate+CYNSetupPush.h"
#import <JPush/JPUSHService.h>

#ifdef NSFoundationVersionNumber_iOS_9_x_Max

#import <UserNotifications/UserNotifications.h>

#endif

@interface AppDelegate ()
        <
        JPUSHRegisterDelegate
        >

@end

@implementation AppDelegate (CYNSetupPush)

static NSString *const appKey = @"9fe78de93f64560c17655bc5";
static NSString *const channel = @"Publish channel";
static BOOL isProduction = NO;


- (void)cyn_setupPushWithOptions:(NSDictionary *)launchOptions {
    JPUSHRegisterEntity *entity = [[JPUSHRegisterEntity alloc] init];
    entity.types = JPAuthorizationOptionAlert | JPAuthorizationOptionBadge | JPAuthorizationOptionSound;

    [JPUSHService registerForRemoteNotificationConfig:entity delegate:self];

    [JPUSHService setupWithOption:launchOptions
                           appKey:appKey
                          channel:channel
                 apsForProduction:isProduction];

    //2.1.9版本新增获取registration id block接口。
    [JPUSHService registrationIDCompletionHandler:^(int resCode, NSString *registrationID) {
        if (resCode == 0) {
            NSLog(@"registrationID获取成功：%@", registrationID);
        } else {
            NSLog(@"registrationID获取失败，code：%d", resCode);
        }
    }];
}


- (void)                             application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    NSLog(@"%@", [NSString stringWithFormat:@"Device Token: %@", deviceToken]);
    [JPUSHService registerDeviceToken:deviceToken];
}

- (void)                             application:(UIApplication *)application
didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    NSLog(@"did Fail To Register For Remote Notifications With Error: %@", error);
}

#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_7_1

- (void)                application:(UIApplication *)application
didRegisterUserNotificationSettings:
        (UIUserNotificationSettings *)notificationSettings {
}

// Called when your app has been activated by the user selecting an action from
// a local notification.
// A nil action identifier indicates the default action.
// You should call the completion handler as soon as you've finished handling
// the action.
- (void)       application:(UIApplication *)application
handleActionWithIdentifier:(NSString *)identifier
      forLocalNotification:(UILocalNotification *)notification
         completionHandler:(void (^)())completionHandler {
}

// Called when your app has been activated by the user selecting an action from
// a remote notification.
// A nil action identifier indicates the default action.
// You should call the completion handler as soon as you've finished handling
// the action.
- (void)       application:(UIApplication *)application
handleActionWithIdentifier:(NSString *)identifier
     forRemoteNotification:(NSDictionary *)userInfo
         completionHandler:(void (^)())completionHandler {
}

#endif

- (void)         application:(UIApplication *)application
didReceiveRemoteNotification:(NSDictionary *)userInfo {
    [JPUSHService handleRemoteNotification:userInfo];
    NSLog(@"iOS6及以下系统，收到通知:%@", [self logDic:userInfo]);
}

- (void)         application:(UIApplication *)application
didReceiveRemoteNotification:(NSDictionary *)userInfo
      fetchCompletionHandler:
              (void (^)(UIBackgroundFetchResult))completionHandler {
    [JPUSHService handleRemoteNotification:userInfo];
    NSLog(@"iOS7及以上系统，收到通知:%@", [self logDic:userInfo]);

    if ([[UIDevice currentDevice].systemVersion floatValue] < 10.0 || application.applicationState > 0) {

    }

    completionHandler(UIBackgroundFetchResultNewData);
}

- (void)        application:(UIApplication *)application
didReceiveLocalNotification:(UILocalNotification *)notification {
    [JPUSHService showLocalNotificationAtFront:notification identifierKey:nil];
}

#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#pragma mark- JPUSHRegisterDelegate

- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center
        willPresentNotification:(UNNotification *)notification
          withCompletionHandler:(void (^)(NSInteger))completionHandler {
    NSDictionary *userInfo = notification.request.content.userInfo;

    UNNotificationRequest *request = notification.request; // 收到推送的请求
    UNNotificationContent *content = request.content; // 收到推送的消息内容

    NSNumber *badge = content.badge;  // 推送消息的角标
    NSString *body = content.body;    // 推送消息体
    UNNotificationSound *sound = content.sound;  // 推送消息的声音
    NSString *subtitle = content.subtitle;  // 推送消息的副标题
    NSString *title = content.title;  // 推送消息的标题

    if ([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [JPUSHService handleRemoteNotification:userInfo];
        NSLog(@"iOS10 前台收到远程通知:%@", [self logDic:userInfo]);


    } else {
        // 判断为本地通知
        NSLog(@"iOS10 前台收到本地通知:{\nbody:%@，\ntitle:%@,\nsubtitle:%@,\nbadge：%@，\nsound：%@，\nuserInfo：%@\n}", body, title, subtitle, badge, sound, userInfo);
    }
    completionHandler(UNNotificationPresentationOptionBadge | UNNotificationPresentationOptionSound | UNNotificationPresentationOptionAlert); // 需要执行这个方法，选择是否提醒用户，有Badge、Sound、Alert三种类型可以设置
}

- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center
 didReceiveNotificationResponse:(UNNotificationResponse *)response
          withCompletionHandler:(void (^)())completionHandler {

    NSDictionary *userInfo = response.notification.request.content.userInfo;
    UNNotificationRequest *request = response.notification.request; // 收到推送的请求
    UNNotificationContent *content = request.content; // 收到推送的消息内容

    NSNumber *badge = content.badge;  // 推送消息的角标
    NSString *body = content.body;    // 推送消息体
    UNNotificationSound *sound = content.sound;  // 推送消息的声音
    NSString *subtitle = content.subtitle;  // 推送消息的副标题
    NSString *title = content.title;  // 推送消息的标题

    if ([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [JPUSHService handleRemoteNotification:userInfo];
        NSLog(@"iOS10 收到远程通知:%@", [self logDic:userInfo]);
    } else {
        // 判断为本地通知
        NSLog(@"iOS10 收到本地通知:{\nbody:%@，\ntitle:%@,\nsubtitle:%@,\nbadge：%@，\nsound：%@，\nuserInfo：%@\n}", body, title, subtitle, badge, sound, userInfo);
    }

    completionHandler();  // 系统要求执行这个方法
}

#endif

// log NSSet with UTF8
// if not ,log will be \Uxxx
- (NSString *)logDic:(NSDictionary *)dic {
    if (![dic count]) {
        return nil;
    }
    NSString *tempStr1 =
            [[dic description] stringByReplacingOccurrencesOfString:@"\\u"
                                                         withString:@"\\U"];
    NSString *tempStr2 =
            [tempStr1 stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
    NSString *tempStr3 =
            [[@"\"" stringByAppendingString:tempStr2] stringByAppendingString:@"\""];
    NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];
    NSString *str =
            [NSPropertyListSerialization propertyListFromData:tempData
                                             mutabilityOption:NSPropertyListImmutable
                                                       format:NULL
                                             errorDescription:NULL];
    return str;
}


@end