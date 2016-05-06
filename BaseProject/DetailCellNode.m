//
//  DetailCellNode.m
//  BaseProject
//
//  Created by 何长春 on 16/4/27.
//  Copyright © 2016年 Serlight. All rights reserved.
//

#import "DetailCellNode.h"
#import <ASNetworkImageNode.h>
#import <AsyncDisplayKit/AsyncDisplayKit.h>

@implementation DetailCellNode

- (instancetype)init {
    self = [super init];
    if (self) {
        _imageNode = [[ASNetworkImageNode alloc] init];
        _imageNode.backgroundColor = ASDisplayNodeDefaultPlaceholderColor();
        [self addSubnode:_imageNode];
    }
    
    return self;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    self.imageNode.position = CGPointZero;
    self.imageNode.sizeRange = ASRelativeSizeRangeMakeWithExactCGSize(constrainedSize.max);
    return [ASStaticLayoutSpec staticLayoutSpecWithChildren:@[self.imageNode]];
}

- (void)layoutDidFinish {
    [super layoutDidFinish];
    
    self.imageNode.URL = [self imageURL];
}

- (NSURL *)imageURL {
    CGSize imageSize = self.calculatedSize;
    NSString *imageURLString = [NSString stringWithFormat:@"http://lorempixel.com/%ld/%ld/%@/%ld", (NSInteger)imageSize.width, (NSInteger)imageSize.height, self.imageCategory, self.row];
    return [NSURL URLWithString:imageURLString];
}

@end
