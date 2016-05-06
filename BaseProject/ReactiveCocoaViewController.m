//
//  ReactiveCocoaViewController.m
//  BaseProject
//
//  Created by 何长春 on 16/1/9.
//  Copyright © 2016年 Serlight. All rights reserved.
//

#import "ReactiveCocoaViewController.h"
#import <ReactiveCocoa.h>

@interface ReactiveCocoaViewController () <UIAlertViewDelegate>

@property (nonatomic, assign) BOOL isShow;

@end

@implementation ReactiveCocoaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isShow = NO;
    RAC(self.loginButton, enabled) = [RACSignal combineLatest:@[self.nameTextField.rac_textSignal, self.passwordTextField.rac_textSignal]
                                                       reduce:^(NSString *name, NSString *password) {
                                                           
                                                           BOOL status = name.length > 3 && password.length > 6;
                                                           if (!self.isShow && status) {
                                                               return  @(status);
                                                           } else {
                                                               return @(NO);
                                                           }
                                                       }];
}

- (IBAction)tapInLoginButton:(id)sender {
    self.isShow = YES;
    [self.view endEditing:YES];
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"Title"
                                                                     message:@"Message"
                                                              preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel"
                                                           style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction * _Nonnull action) {
                                                             [alertVC dismissViewControllerAnimated:YES completion:^{
                                                                 [self.navigationController popViewControllerAnimated:YES];
                                                             }];
                                                             
                                                         }];
    UIAlertAction *destoryAction = [UIAlertAction actionWithTitle:@"Destory"
                                                            style:UIAlertActionStyleDestructive
                                                          handler:^(UIAlertAction * _Nonnull action) {
                                                              [alertVC dismissViewControllerAnimated:YES completion:^{
                                                                  [self.navigationController popViewControllerAnimated:YES];
                                                              }];
                                                          }];
    
    [alertVC addAction:cancelAction];
    [alertVC addAction:destoryAction];
    [self presentViewController:alertVC
                       animated:YES completion:^{
                           [self.passwordTextField resignFirstResponder];
                           [self.nameTextField resignFirstResponder];
                       }];
    
    
//    UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"确定"
//                                                        message:@"确定登陆吗?"
//                                                       delegate:self
//                                              cancelButtonTitle:@"不登陆"
//                                              otherButtonTitles:@"登陆", nil];
//    [self.nameTextField resignFirstResponder];
//    [self.passwordTextField resignFirstResponder];
//    [alertview show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex {
//    [self.nameTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
}

@end
