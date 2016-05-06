//
//  DetailRootNode.m
//  BaseProject
//
//  Created by 何长春 on 16/4/27.
//  Copyright © 2016年 Serlight. All rights reserved.
//

#import "DetailRootNode.h"
#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import "DetailCellNode.h"

static const NSInteger kImageHeight = 200;

@interface DetailRootNode () <ASCollectionDataSource, ASCollectionDelegate>

@property (nonatomic, copy) NSString *imageCategory;
@property (nonatomic, strong) ASCollectionNode *collectionNode;

@end

@implementation DetailRootNode

- (instancetype)initWithImageCategory:(NSString *)imageCategory {
    self = [super init];
    if (self) {
        _imageCategory = imageCategory;
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        _collectionNode = [[ASCollectionNode alloc] initWithCollectionViewLayout:layout];
        _collectionNode.delegate = self;
        _collectionNode.dataSource = self;
        _collectionNode.backgroundColor = [UIColor whiteColor];
        self.usesImplicitHierarchyManagement = YES;
    }
    
    return self;
}

- (void)dealloc {
    _collectionNode.delegate = nil;
    _collectionNode.dataSource = nil;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    self.collectionNode.position = CGPointZero;
    self.collectionNode.sizeRange = ASRelativeSizeRangeMakeWithExactCGSize(constrainedSize.max);
    return [ASStaticLayoutSpec staticLayoutSpecWithChildren:@[self.collectionNode]];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (ASCellNodeBlock)collectionView:(ASCollectionView *)collectionView nodeBlockForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *imageCategory = self.imageCategory;
    return ^{
        DetailCellNode *cellNode = [[DetailCellNode alloc] init];
        cellNode.row = indexPath.item;
        cellNode.imageCategory = imageCategory;
        return cellNode;
    };
}

- (ASSizeRange)collectionView:(ASCollectionView *)collectionView constrainedSizeForNodeAtIndexPath:(NSIndexPath *)indexPath {
    CGSize imageSize = CGSizeMake(CGRectGetWidth(collectionView.frame), kImageHeight);
    return ASSizeRangeMake(imageSize, imageSize);
}

@end
