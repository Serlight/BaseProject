//
//  TestTableViewController.m
//  BaseProject
//
//  Created by 何长春 on 16/2/1.
//  Copyright © 2016年 Serlight. All rights reserved.
//

#import "TestTableViewController.h"
#import "TestTableViewCell.h"
#import <NIMutableTableViewModel.h>
#import <NICellFactory.h>
#import <NITableViewActions.h>
#import "DetailViewController.h"

@interface TestTableViewController () <NITableViewModelDelegate>

@property (nonatomic, strong)NIMutableTableViewModel *tableViewModel;
@property (nonatomic, strong)NITableViewActions *tableViewActions;
@property (nonatomic, strong)NSArray *dataArray;
@property (nonatomic, strong)UITableView *tableView;

@end

@implementation TestTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.tableView];
    _dataArray = [NSArray array];
    _tableViewActions = [[NITableViewActions alloc] initWithTarget:self];
    _dataArray = @[@"first section",
                   [self createTestTableViewInfo:[[User alloc] initWithName:@"HCC" age:29]],
                   [self createTestTableViewInfo:[[User alloc] initWithName:@"CG" age:24]]];
    _tableViewModel = [[NIMutableTableViewModel alloc] initWithSectionedArray:_dataArray
                                                                     delegate:self];
    
    self.tableView.dataSource = _tableViewModel;
    self.tableView.delegate = self.tableViewActions;
    [self.tableView reloadData];
}

- (NICellObject *)createTestTableViewInfo:(User *)product
{
    NICellObject *cellObject = [TestTableViewCell createObject:self userInfo:nil];
    cellObject.userInfo = product;
//    User *userInfo = (User *)cellObject.userInfo;
//    userInfo = product;
    if ([product.name isEqualToString:@"HCC"]) {
        [_tableViewActions attachToObject:cellObject
                                 tapBlock:^BOOL(id object, id target, NSIndexPath *indexPath) {
                                     DetailViewController *detailVC = [[DetailViewController alloc] init];
                                     NICellObject *cellObject = (NICellObject *)object;
                                     detailVC.user = (User *)cellObject.userInfo;
                                     [self.navigationController pushViewController:detailVC animated:YES];
                                     return YES;
                                 }];
    } else {
        [_tableViewActions attachToObject:cellObject
                                 tapBlock:^BOOL(id object, id target, NSIndexPath *indexPath) {
                                     NSLog(@"Enter CG");
                                     return YES;
                                 }];
    }
    return cellObject;
}

- (void)tapInCGCell:(id)object {
    
    NSLog(@"Enter cell CG");
}

- (UITableViewCell *)tableViewModel:(NITableViewModel *)tableViewModel cellForTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath withObject:(id)object {
    UITableViewCell *cell = [NICellFactory tableViewModel:tableViewModel
                                         cellForTableView:tableView
                                              atIndexPath:indexPath
                                               withObject:object];
    
    return cell;
}

@end
