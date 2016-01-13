//
//  BaseWebViewController.h
//  BaseProject
//
//  Created by 何长春 on 16/1/11.
//  Copyright © 2016年 Serlight. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^JSHandleCompletionBlock)(NSDictionary * data);

@protocol BaseWebViewDelegate <NSObject>

@optional
//add all bridge handler

@end

@interface BaseWebViewController : UIViewController

@property (nonatomic, strong) NSURL *requestUrl; //webview request address
@property (nonatomic, copy) NSString *htmlContent; //webview show content
@property (nonatomic, weak) id<BaseWebViewDelegate> baseWebViewDelegate;

@property (nonatomic, assign) BOOL isProhibitUserSelect;
@property (nonatomic, assign) BOOL isProhibitUserLongPress;

- (void)loadContent;

//添加自己特殊的js 接口
- (void)addBridgeHandler:(NSString *)handlerName handleCompleteBlock:(JSHandleCompletionBlock)block;

@end
