//
//  TestTableViewController.m
//  BaseProject
//
//  Created by 何长春 on 16/2/1.
//  Copyright © 2016年 Serlight. All rights reserved.
//

#import "TestTableViewController.h"
#import "TestTableViewCell.h"
#import <NimbusModels.h>

@interface TestTableViewController ()

@end

@implementation TestTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NICellObject *)createTestTableViewInfo:(BXInsureProduct *)product
{
    NICellObject *cellObject = [TestTableViewCell createObject:self userInfo:nil];
    
    TestTableViewCellUserInfo *userInfo = (TestTableViewCellUserInfo *)cellObject.userInfo;
    userInfo.product = product;
    return cellObject;
}

@end
