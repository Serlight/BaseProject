//
//  WeiboDemoViewController.m
//  BaseProject
//
//  Created by 何长春 on 16/4/27.
//  Copyright © 2016年 Serlight. All rights reserved.
//

#import "WeiboDemoViewController.h"
#import "DetailASViewController.h"
#import "DetailRootNode.h"

@interface WeiboDemoViewController () <ASTableDataSource, ASTableDelegate>

@property (nonatomic, copy) NSArray *imageCategories;
@property (nonatomic, strong, readonly) ASTableNode *tableNode;

@end

@implementation WeiboDemoViewController

- (instancetype)init {
    self = [super initWithNode:[ASTableNode new]];
    if (self) {
        _imageCategories = @[@"abstract", @"animals", @"business", @"cats", @"city", @"food", @"nightlife", @"fashion", @"people", @"nature", @"sports", @"technics", @"transport"];
    }
    
    return self;
}

- (void)dealloc {
    self.tableNode.delegate = nil;
    self.tableNode.dataSource = nil;
//    self.tableNode.view.tableFooterView = [ASDisplayNode new];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Image Categories";
    self.tableNode.delegate = self;
    self.tableNode.dataSource = self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.tableNode.view deselectRowAtIndexPath:self.tableNode.view.indexPathForSelectedRow animated:YES];
}

- (ASTableNode *)tableNode {
    return (ASTableNode *)self.node;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.imageCategories.count;
}

- (ASCellNodeBlock)tableView:(ASTableView *)tableView nodeBlockForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *imageCategory = self.imageCategories[indexPath.row];
    return ^{
        ASTextCellNode *textCellNode = [ASTextCellNode new];
        textCellNode.text = [imageCategory capitalizedString];
        return textCellNode;
    };
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *imageCategory = self.imageCategories[indexPath.row];
    DetailRootNode *detailRootNode = [[DetailRootNode alloc] initWithImageCategory:imageCategory];
    DetailASViewController *detailVC = [[DetailASViewController alloc] initWithNode:detailRootNode];
    detailVC.title = [imageCategory capitalizedString];
    [self.navigationController pushViewController:detailVC animated:YES];
}

@end
