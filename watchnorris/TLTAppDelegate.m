//
//  AppDelegate.m
//  watchnorris
//
//  Created by Charlie Nowacek on 2/18/15.
//  Copyright (c) 2015 Tilt. All rights reserved.
//

#import "TLTAppDelegate.h"

@interface TLTAppDelegate ()

@end

@implementation TLTAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (void)application:(UIApplication *)application handleWatchKitExtensionRequest:(NSDictionary *)userInfo reply:(void (^)(NSDictionary *))reply {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"WatchKitSaysHi" object:nil userInfo:userInfo];
}

@end
