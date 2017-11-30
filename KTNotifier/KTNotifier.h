//
//  KTNotifier.h
//  KTNotifier
//
//  Created by Karthus on 2017/10/25.
//  Copyright © 2017年 karthus. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol KTNotifierDelegate <NSObject>

- (void)userNotificationCenter:(NSUserNotificationCenter *)center didDeliverNotification:(NSUserNotification *)notification;

- (void)userNotificationCenter:(NSUserNotificationCenter *)center didActivateNotification:(NSUserNotification *)notification ;

@end


/**
 *  The 'KTNotifier' class enables you to show notifications in Dock and NotificationCenter on macOS
 */
@interface KTNotifier : NSObject <NSUserNotificationCenterDelegate>

/**
 * Defines whether to show notifications in NotificationCenter in macOS. The default value is 'YES'.
 */
@property (assign, nonatomic) BOOL showInNotificationCenter;

/**
 * Defines whether to show details in the notification. The default value is 'YES'.
 */
@property (assign, nonatomic) BOOL showDetails;


@property (assign) id <KTNotifierDelegate> delegate;

/**
 * shared instance of KTNotifier
 */
+ (KTNotifier *)sharedNotifier;


/**
 *  Show the specified notification on Dock.
 *  The value of 'infomativeText' defines the text to show on the Dock icon,
 *  generally, it is a integer value that represents how many new messages there are.
 */
- (void)showDockNotification: (NSString *)infomativeText;




/**
 *  Show the specified notification in user notification center
 */
- (void)showNotificationWithTitle:(NSString *)title
                     withSubTitle:(NSString *)subTitle
              withInformativeText:(NSString *)informativeText;

@end
