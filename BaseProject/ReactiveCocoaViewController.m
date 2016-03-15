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
    
    [[RACSignal combineLatest:@[self.nameTextField.rac_textSignal, self.passwordTextField.rac_textSignal]
                      reduce:^(NSString *nameText, NSString *password){
                          return @(nameText.length > 3 && password.length > 6);
                      }] setKeyPath:@"enabled" onObject:self.loginButton];
}

- (IBAction)tapInLoginButton:(id)sender {
}



@end
