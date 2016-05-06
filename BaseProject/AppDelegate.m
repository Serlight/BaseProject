//
//  AppDelegate.m
//  BaseProject
//
//  Created by 何长春 on 15/12/14.
//  Copyright © 2015年 Serlight. All rights reserved.
//

#import "AppDelegate.h"
#import <JSPatch/JPEngine.h>
#import "WeiboDemoViewController.h"
#import "AsyncTableViewController.h"

#define DEMOTEXTPATH [NSString stringWithFormat:@"%@/Documents/demo.js",NSHomeDirectory()]

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    AsyncTableViewController *rootVC = [AsyncTableViewController new];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:rootVC];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
