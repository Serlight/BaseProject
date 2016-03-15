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
//    [JPEngine startEngine];
//    
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://localhost:8000/demo.js"]];
//    request.HTTPMethod = @"GET";
//    
//    NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request
//                                    completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//                                        if(data) {
//                                            NSString *str = [[NSString alloc]initWithData:data encoding:4];
//                                            NSLog(@"str = %@",str);
//                                            [[NSFileManager defaultManager] createFileAtPath:DEMOTEXTPATH contents:data attributes:nil];
//                                        }
//                                    }];
//    [task resume];
//    if([[NSFileManager defaultManager] fileExistsAtPath:DEMOTEXTPATH]) {
//        [JPEngine evaluateScriptWithPath:DEMOTEXTPATH];
//    }
    return YES;
}

@end
