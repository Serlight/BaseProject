//
//  KittenNode.h
//  BaseProject
//
//  Created by 何长春 on 16/4/29.
//  Copyright © 2016年 Serlight. All rights reserved.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>

@interface KittenNode : ASCellNode

- (instancetype)initWithKittenOfSize:(CGSize)size;

- (void)toggleImageEnlargement;

@end
