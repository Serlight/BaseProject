//
//  JSFirstViewcontroller.m
//  JSPatchDemo
//
//  Created by guan on 15/12/14.
//  Copyright © 2015年 微易. All rights reserved.
//

#import "JSFirstViewcontroller.h"
#import <WebViewJavascriptBridge.h>

@implementation JSFirstViewcontroller

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:webView];
    
    WebViewJavascriptBridgeBase *jb = [WebViewJavascriptBridge bridgeForWebView:webView];
}

@end
