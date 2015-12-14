//
//  WYBaseViewController.h
//  BaseProject
//
//  Created by 何长春 on 15/12/14.
//  Copyright © 2015年 Serlight. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CompletedBlock)();

@interface WYBaseViewController : UIViewController

@property (nonatomic, strong) UIViewController *rootViewController;

//获取app的root view Controller, 一般结构里面就是TabbarViewController;
- (UIViewController *)getCurrentRootViewController;

//当取消登陆的时候跳转到指定的页面
- (void)cancelLoginJumpToViewController:(CompletedBlock)completedBlock;

//显示hud在
- (void)showHudOnView:(UIView *)view message:(NSString *)message;

- (void)showHudOnWindow:(UIWindow *)window message:(NSString *)message;

- (void)showInfoWithStatus:(NSString *)info;

- (void)showSuccessWithStatus:(NSString *)info;

- (void)showErrorWithStatus:(NSString *)info;

@end
