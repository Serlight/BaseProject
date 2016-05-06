//
//  DetailRootNode.h
//  BaseProject
//
//  Created by 何长春 on 16/4/27.
//  Copyright © 2016年 Serlight. All rights reserved.
//

#import <ASDisplayNode.h>

@class ASCollectionNode;

@interface DetailRootNode : ASDisplayNode

@property (nonatomic, strong, readonly) ASCollectionNode *collectionNode;

- (instancetype)initWithImageCategory:(NSString *)imageCategory;

@end
