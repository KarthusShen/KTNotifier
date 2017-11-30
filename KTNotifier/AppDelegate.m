//
//  AppDelegate.m
//  KTNotifier
//
//  Created by Karthus on 2017/10/25.
//  Copyright © 2017年 karthus. All rights reserved.
//

#import "AppDelegate.h"
#import "KTNotifier.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (IBAction)ShowInDock:(id)sender
{
    static int i = 1;
    NSString *strTip = [NSString stringWithFormat:@"%d",i];
    [[KTNotifier sharedNotifier] showDockNotification:strTip];
    i++;
}

- (IBAction)ShowInNotificationCenter:(id)sender
{
    static int i = 1;
    NSString *strTip = [NSString stringWithFormat:@"%d",i];
    [[KTNotifier sharedNotifier] showNotificationWithTitle:@"工作宝"
                                              withSubTitle:@"王大锤"
                                       withInformativeText:strTip];
    i++;
}

@end
