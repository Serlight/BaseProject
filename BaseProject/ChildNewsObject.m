//
//  ChildNewsObject.m
//  BaseProject
//
//  Created by 何长春 on 16/1/7.
//  Copyright © 2016年 Serlight. All rights reserved.
//

#import "ChildNewsObject.h"

@implementation ChildNewsObject

+ (void)load {
    NSLog(@"current in child Load");
}

+ (void)initialize {
    NSLog(@"current in child initialize");
}

@end
