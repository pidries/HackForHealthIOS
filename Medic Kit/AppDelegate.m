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

@end
