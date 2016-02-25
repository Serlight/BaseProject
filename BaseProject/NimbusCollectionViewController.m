//
//  NimbusCollectionViewController.m
//  BaseProject
//
//  Created by 何长春 on 16/2/23.
//  Copyright © 2016年 Serlight. All rights reserved.
//

#import "NimbusCollectionViewController.h"
#import <NICollectionViewActions.h>
#import <NIMutableCollectionViewModel.h>

@interface NimbusCollectionViewController () <UICollectionViewDelegateFlowLayout, NICollectionViewModelDelegate>

@end

@implementation NimbusCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    return CGSizeMake(0, 0);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(0, 0);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(0, 0);
}

- (UICollectionViewCell *)collectionViewModel:(NICollectionViewModel *)collectionViewModel cellForCollectionView:(UICollectionView *)collectionView atIndexPath:(NSIndexPath *)indexPath withObject:(id)object {
    return nil;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
