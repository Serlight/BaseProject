//
//  AppDelegate.m
//  BaseProject
//
//  Created by 何长春 on 15/12/14.
//  Copyright © 2015年 Serlight. All rights reserved.
//

#import "AppDelegate.h"
#import <JSPatch/JPEngine.h>

#define DEMOTEXTPATH [NSString stringWithFormat:@"%@/Documents/demo.js",NSHomeDirectory()]

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [JPEngine startEngine];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://192.168.4.144/demo.js"]];
    request.HTTPMethod = @"POST";
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue currentQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        if(data) {
            NSString *str = [[NSString alloc]initWithData:data encoding:4];
            NSLog(@"str = %@",str);
            [[NSFileManager defaultManager] createFileAtPath:DEMOTEXTPATH contents:data attributes:nil];
        }
    }];
    
    if([[NSFileManager defaultManager] fileExistsAtPath:DEMOTEXTPATH]) {
        [JPEngine evaluateScriptWithPath:DEMOTEXTPATH];
        NSLog(@"~~~~~~~%@",[JPEngine context]);
    }
    return YES;
}

@end
