//
//  TestCollectionViewController.m
//  BaseProject
//
//  Created by 何长春 on 16/2/23.
//  Copyright © 2016年 Serlight. All rights reserved.
//

#import "TestCollectionViewController.h"
#import "CollectionViewCell.h"
#import "CollectionHeaderReusableView.h"
#import "CollectionFooterReusableView.h"

@interface TestCollectionViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout> {
    CGFloat screenWidth;
}

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation TestCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    screenWidth = [[UIScreen mainScreen] bounds].size.width;
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    UINib *cellNib = [UINib nibWithNibName:@"CollectionViewCell" bundle:[NSBundle mainBundle]];
    [self.collectionView registerNib:cellNib forCellWithReuseIdentifier:@"cell"];
    
    UINib *headerNib = [UINib nibWithNibName:@"CollectionHeaderReusableView" bundle:[NSBundle mainBundle]];
    [self.collectionView registerNib:headerNib forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    
    UINib *footerNib = [UINib nibWithNibName:@"CollectionFooterReusableView" bundle:[NSBundle mainBundle]];
    [self.collectionView registerNib:footerNib forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer"];
    
    self.view.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.collectionView];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 10;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = (CollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    if (indexPath.section % 2 == 0) {
        cell.imageView.image = [UIImage imageNamed:@"Icon-60"];
    } else {
        cell.imageView.image = [UIImage imageNamed:@"head"];
    }
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        CollectionHeaderReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                                                      withReuseIdentifier:@"header"
                                                                                             forIndexPath:indexPath];
        headerView.titleLabel.text = [NSString stringWithFormat:@"Header - %zd", indexPath.section];
        return headerView;
    } else {
        CollectionHeaderReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                                                      withReuseIdentifier:@"footer"
                                                                                             forIndexPath:indexPath];
        footerView.titleLabel.text = [NSString stringWithFormat:@"Footer - %zd", indexPath.section];
        return footerView;
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    return CGSizeMake(screenWidth, 0);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(screenWidth, 20);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(60, 60);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 4;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 4;
}





@end
