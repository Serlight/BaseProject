////
////  BaseWebViewController.m
////  BaseProject
////
////  Created by 何长春 on 16/1/11.
////  Copyright © 2016年 Serlight. All rights reserved.
////
//
//#import "BaseWebViewController.h"
//#import <WebViewJavascriptBridge.h>
//
//#define weakSelf() __weak __typeof__(self) weakSelf = self
//#define strongSelf() __strong __typeof(self) self = weakSelf
//
//@interface BaseWebViewController () <UIWebViewDelegate, ChooseClientViewControllerDelegate> {
//    
//}
//
//@property (nonatomic, strong) UIWebView *webView;
//
//@property (nonatomic, strong) WebViewJavascriptBridge *javascriptBridge;
//
////cache local crm info
//@property (nonatomic, strong) NSMutableDictionary *crmInfo;
//
//@end
//
//@implementation BaseWebViewController
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor whiteColor];
//    _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
//    _webView.delegate = self;
//    [self.view addSubview:_webView];
//    
//    [self setupBaseBridge];
//}
//
//- (void)setupBaseBridge {
//    weakSelf();
//    
//    //显示右上角收藏按钮
//    [self.javascriptBridge registerHandler:kjsShowFavouriteItem
//                               handler:^(id data, WVJBResponseCallback responseCallback) {
//                                   strongSelf();
//                                   if (data && self.baseWebViewDelegate) {
//                                       
//                                   }
//                               }];
//    
//    //显示右上角分享按钮
//    [self.javascriptBridge registerHandler:kjsShowShareItem
//                               handler:^(id data, WVJBResponseCallback responseCallback) {
//                                   strongSelf();
//                                   if (data && self.baseWebViewDelegate) {
//                                   }
//                               }];
//    
//    //获取CRM信息
//    [self.javascriptBridge registerHandler:kiOSGetContactInfo
//                               handler:^(id data, WVJBResponseCallback responseCallback) {
//                                   strongSelf();
//                                   if (data && self.baseWebViewDelegate) {
//                                       [self.crmInfo setObject:data forKey:@"type"];
//                                   }
//                                   ChooseClientViewController *chooseClient = [[ChooseClientViewController alloc] init];
//                                   chooseClient.delegate = self;
//                                   self.hidesBottomBarWhenPushed = YES;
//                                   [self.navigationController pushViewController:chooseClient animated:YES];
//                               }];
//    
//    //跳转到登陆界面
//    [self.javascriptBridge registerHandler:kjsGotoView
//                                   handler:^(id data, WVJBResponseCallback responseCallback) {
//                                       if (data && [data isEqualToString:@"login"]) {
//                                           strongSelf();
//                                           [self goToLoginViewController];
//                                       }
//                                   }];
//    
//    //跳转到一个指定的页面
//    [self.javascriptBridge registerHandler:kjsGoToH5Detail
//                               handler:^(id data, WVJBResponseCallback responseCallback) {
//                                   strongSelf();
//                                   if (data && self.baseWebViewDelegate) {
//                                   }
//                               }];
//    
//    //弹起分享框
//    [self.javascriptBridge registerHandler:kjsiOSShare
//                               handler:^(id data, WVJBResponseCallback responseCallback) {
//                                   strongSelf();
//                                   if (data && self.baseWebViewDelegate) {
//                                   }
//                               }];
//    
//    //分享到
//    [self.javascriptBridge registerHandler:kShareNews
//                                   handler:^(id data, WVJBResponseCallback responseCallback) {
//                                       strongSelf();
//                                       if (data && self.baseWebViewDelegate) {
//                                       }
//                                   }];
//    
//    //录音按钮
//    //data 包含最大时长
//    [self.javascriptBridge registerHandler:@""
//                                   handler:^(id data, WVJBResponseCallback responseCallback) {
//                                       
//                                   }];
//    
//    //跳转到
//    [self.javascriptBridge registerHandler:@""
//                                   handler:^(id data, WVJBResponseCallback responseCallback) {
//                                   }];
//    
//}
//
//- (void)addBridgeHandler:(NSString *)handlerName handleCompleteBlock:(JSHandleCompletionBlock)block {
//    if (self.webView) {
//        weakSelf();
//        [self.javascriptBridge registerHandler:handlerName
//                                       handler:^(id data, WVJBResponseCallback responseCallback) {
//                                           strongSelf();
//                                           if (data && self.baseWebViewDelegate) {
//                                               if ([data isKindOfClass:[NSDictionary class]]) {
//                                                   block(data);
//                                               }
//                                           }
//                                       }];
//    }
//}
//
//- (void)goToLoginViewController {
//    [BXSalesUser clearCachedAuthInfo];
//    [LoginViewController presentLoginViewControllerWithBlock:^(BOOL result) {
//        if (result) {
//            [self loadContent];
//        } else {
//            [self goToRootViewController];
//        }
//    }];
//}
//
//- (void)goToRootViewController {
//    MainTabViewController *mainTab = (MainTabViewController *)[[UIApplication sharedApplication].keyWindow rootViewController];
//    
//    [mainTab setSelectedIndex:0];
//    [self.navigationController popViewControllerAnimated:YES];
//}
//
//- (void)loadContent {
//    if (_requestUrl) {
//        NSURLRequest *request = [NSURLRequest requestWithURL:_requestUrl];
//        [self.webView loadRequest:request];
//    } else {
//        if (_htmlContent) {
//            [self.webView loadHTMLString:_htmlContent baseURL:nil];
//        }
//    }
//}
//
//#pragma mark choose client delegate
//- (void)getChooseClientResult:(BXSalesClient *)client {
//    [self.crmInfo addEntriesFromDictionary:[client getRawJSONObject]];
//    [self.javascriptBridge callHandler:@"jsUpdateContactInfo" data:self.crmInfo
//                      responseCallback:^(id responseData) {
//                      }];
//}
//
//#pragma mark webViewDeleagte
//-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
//    return YES;
//}
//
//- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
//   
//}
//
//-(void)webViewDidFinishLoad:(UIWebView *)webView {
//    
//}
//
//- (void)webViewDidStartLoad:(UIWebView *)webView {
//    
//}
//
//- (void)viewDidDisappear:(BOOL)animated {
//    [super viewDidDisappear:animated];
//    [self.webView stopLoading];
//}
//
//#pragma mark setter method
//- (UIWebView *)webView {
//    if (!_webView) {
//        _webView = [[UIWebView alloc] init];
//        _webView.backgroundColor = [UIColor clearColor];
//        [_webView setOpaque:NO];
//    }
//    
//    return _webView;
//}
//
//-(WebViewJavascriptBridge *)javascriptBridge {
//    if (!_javascriptBridge) {
//        _javascriptBridge = [WebViewJavascriptBridge bridgeForWebView:self.webView
//                                                              handler:^(id data, WVJBResponseCallback responseCallback) {
//                                                                  responseCallback(@"");
//                                                              }];
//    }
//    return _javascriptBridge;
//}
//
//- (NSMutableDictionary *)crmInfo {
//    if (!_crmInfo) {
//        _crmInfo = [NSMutableDictionary dictionary];
//    }
//    return _crmInfo;
//}
//
//@end
