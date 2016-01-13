//
//  ViewController.m
//  BaseProject
//
//  Created by 何长春 on 15/12/14.
//  Copyright © 2015年 Serlight. All rights reserved.
//


#import "ViewController.h"
#import "JSFirstViewcontroller.h"
#import "ChildNewsObject.h"
#import "ReactiveCocoaViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate> {
    UIStoryboard *_mainStoryBoard;
}

@property (nonatomic, strong) UITableView *table;

@property (nonatomic, strong) NSArray *datas;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.table = [[UITableView alloc]initWithFrame:self.view.bounds style:(UITableViewStylePlain)];
    self.table.delegate = self;
    self.table.dataSource = self;
    self.table.tableFooterView = [[UIView alloc] init];
    [self.view addSubview:self.table];
}

- (NSArray *)datas {
    _datas = @[@"JS LableView",
               @"JS TableViewController",
               @"Reactive Cocoa",
               ];
    return _datas;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(!cell){
        cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.datas[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        JSFirstViewcontroller *vc = [[JSFirstViewcontroller alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.row == 1) {
        [self gotoJSViewController];
    } else if (indexPath.row == 2) {
        ReactiveCocoaViewController *reactiveVC = [_mainStoryBoard instantiateViewControllerWithIdentifier:@"ReactiveCocoaViewController"];
        [self.navigationController pushViewController:reactiveVC animated:YES];
    }
}


- (void)gotoJSViewController {
    
}

@end
