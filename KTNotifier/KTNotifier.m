//
//  KTNotifier.m
//  KTNotifier
//
//  Created by Karthus on 2017/10/25.
//  Copyright © 2017年 karthus. All rights reserved.
//

#import "KTNotifier.h"
#import <AppKit/AppKit.h>

@implementation KTNotifier

@synthesize delegate;

+ (KTNotifier *)sharedNotifier
{
    static KTNotifier* _sharedNotifier = nil;
    
    if (_sharedNotifier == nil)
    {
        _sharedNotifier = [[self alloc] init];
        _sharedNotifier.showInNotificationCenter = YES;
        _sharedNotifier.showDetails = YES;
    }
    return _sharedNotifier;
}

- (void)showDockNotification:(NSString *)infomativeText
{
    [[[NSApplication sharedApplication] dockTile] setBadgeLabel:infomativeText];
}

-(void)showNotificationWithTitle:(NSString *)title
                    withSubTitle:(NSString *)subTitle
             withInformativeText:(NSString *)informativeText
{
    if (_showInNotificationCenter == NO)
    {
        return;
    }
    
    NSUserNotification *notification = [[NSUserNotification alloc] init];
    [notification setTitle:title];
    [notification setSubtitle:subTitle];
    if (_showDetails)
    {
        [notification setInformativeText:informativeText];
    }
    
    NSUserNotificationCenter *userNotificationCenter = [NSUserNotificationCenter defaultUserNotificationCenter];
    userNotificationCenter.delegate = self;
    [userNotificationCenter scheduleNotification:notification];
}

#pragma mark NSUserNotificationCenterDelegate
- (BOOL)userNotificationCenter:(NSUserNotificationCenter *)center shouldPresentNotification:(NSUserNotification *)notification {
    return YES;
}

- (void)userNotificationCenter:(NSUserNotificationCenter *)center didActivateNotification:(NSUserNotification *)notification {
    if (delegate && [delegate respondsToSelector:@selector(userNotificationCenter:didActivateNotification:)] == YES) {
        [delegate userNotificationCenter:center didActivateNotification:notification];
    }
}

- (void)userNotificationCenter:(NSUserNotificationCenter *)center didDeliverNotification:(NSUserNotification *)notification {
    if (delegate && [delegate respondsToSelector:@selector(userNotificationCenter:didDeliverNotification:)] == YES) {
        [delegate userNotificationCenter:center didDeliverNotification:notification];
    }
}

@end
