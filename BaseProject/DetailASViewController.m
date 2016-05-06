//
//  DetailASViewController.m
//  BaseProject
//
//  Created by 何长春 on 16/4/27.
//  Copyright © 2016年 Serlight. All rights reserved.
//

#import "DetailASViewController.h"
#import <AsyncDisplayKit.h>

@interface DetailASViewController ()

@end

@implementation DetailASViewController

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    [self.node.collectionNode.view.collectionViewLayout invalidateLayout];
}

@end
