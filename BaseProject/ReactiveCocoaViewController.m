//
//  ReactiveCocoaViewController.m
//  BaseProject
//
//  Created by 何长春 on 16/1/9.
//  Copyright © 2016年 Serlight. All rights reserved.
//

#import "ReactiveCocoaViewController.h"
#import <ReactiveCocoa.h>

@interface ReactiveCocoaViewController ()

@end

@implementation ReactiveCocoaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    @weakify(self);
    
    RAC(self.loginButton, enabled) = [RACSignal combineLatest:@[
                                                                self.nameTextField.rac_textSignal,
                                                                self.passwordTextField.rac_textSignal,
//                                                                RACObserve(self, <#KEYPATH#>)
                                                                ] reduce:^(NSString *userName, NSString *password) {
                                                                    return @(userName.length > 0 && password.length > 0);
                                                                }];
    
    [[self.loginButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(UIButton *sender) {
        @strongify(self);
    }];
}

- (IBAction)tapInLoginButton:(id)sender {
}



@end
