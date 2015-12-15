//
//  WYBaseViewController.m
//  BaseProject
//
//  Created by 何长春 on 15/12/14.
//  Copyright © 2015年 Serlight. All rights reserved.
//

#import "WYBaseViewController.h"
#import "AppDelegate.h"

@interface WYBaseViewController ()

@end

@implementation WYBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    self.rootViewController = (UIViewController *)app.window.rootViewController;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (UIViewController *)getCurrentRootViewController {
    return nil;
}

- (void)cancelLoginJumpToViewController:(CompletedBlock)completedBlock {
    
}

- (void)showHudOnView:(UIView *)view message:(NSString *)message {
    
}

- (void)showHudOnWindow:(UIWindow *)window message:(NSString *)message {
    
}

- (void)showInfoWithStatus:(NSString *)info {
    
}

- (void)showSuccessWithStatus:(NSString *)info {
    
}

- (void)showErrorWithStatus:(NSString *)info {
    
}

- (void)addCloseButtonToNavigationBar {
    
}

- (void)addCustomeBackButton {
    
}



@end
