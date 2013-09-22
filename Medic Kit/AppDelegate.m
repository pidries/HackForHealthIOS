//
//  AppDelegate.m
//  Medic Kit
//
//  Created by Jelle Vandebeeck on 20/09/13.
//  Copyright (c) 2013 fousa. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>

#import "AppDelegate.h"

#import "ZBarImageScanner.h"
#import "ZBarReaderView.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // Preload the camera view
    [self setReaderView];
    
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:0.200 green:0.592 blue:0.204 alpha:1.000]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName : [UIColor whiteColor] }];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    return YES;
}

#pragma mark - QR Reader

- (void)setReaderView {
    ZBarImageScanner *scanner = [ZBarImageScanner new];
    
    _readerView = [[ZBarReaderView alloc] initWithImageScanner:scanner];
    _readerView.trackingColor = [UIColor colorWithRed:0.180 green:0.357 blue:0.694 alpha:1.000];
    _readerView.device = [self camera];
    [_readerView start];
}

#pragma mark - Camera

- (AVCaptureDevice *)camera {
    for (AVCaptureDevice *device in [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo]) {
        if (device.position == AVCaptureDevicePositionBack) {
            return device;
        }
    }
    
    return [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
    //minimize app should clear lists to default data
    [[NSNotificationCenter defaultCenter] postNotificationName:kDidEnterBackgroundNotification object:nil];
    
    NSDate *alertTime = [[NSDate date]
                         dateByAddingTimeInterval:10];
    UIApplication* app = [UIApplication sharedApplication];
    UILocalNotification* notifyAlarm = [[UILocalNotification alloc]
                                        init];
    if (notifyAlarm)
    {
        notifyAlarm.fireDate = alertTime;
        notifyAlarm.timeZone = [NSTimeZone defaultTimeZone];
        notifyAlarm.repeatInterval = 0;
        notifyAlarm.soundName = UILocalNotificationDefaultSoundName;
        notifyAlarm.alertBody = @"Pill notification: Sinutab";
        [app scheduleLocalNotification:notifyAlarm];
    }
}
@end
