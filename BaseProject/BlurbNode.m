//
//  BlurbNode.m
//  BaseProject
//
//  Created by 何长春 on 16/4/28.
//  Copyright © 2016年 Serlight. All rights reserved.
//

#import "BlurbNode.h"
#import "AppDelegate.h"
#import <AsyncDisplayKit.h>
#import <ASDisplayNode+Subclasses.h>
#import <ASHighlightOverlayLayer.h>
#import <ASInsetLayoutSpec.h>
#import <ASCenterLayoutSpec.h>
#import <ASTextNode.h>

static CGFloat kTextPadding = 10.0f;
static NSString *kLinkAttributeName = @"PlaceKittenNodeLinkAttributeName";

@interface BlurbNode() <ASTextNodeDelegate> {
    ASTextNode *_textNode;
}

@end

@implementation BlurbNode

-(instancetype)init {
    self = [super init];
    if (self) {
        _textNode = [[ASTextNode alloc] init];
        
        _textNode.delegate = self;
        _textNode.userInteractionEnabled = YES;
        _textNode.linkAttributeNames = @[ kLinkAttributeName ];
        
        NSString *blurb = @"kittens courtesy placekitten.com \U0001F638";
        NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:blurb];
        [string addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Light" size:16.0f] range:NSMakeRange(0, blurb.length)];
        [string addAttributes:@{kLinkAttributeName: [NSURL URLWithString:@"http://placekitten.com/"],
                                NSForegroundColorAttributeName: [UIColor grayColor],
                                NSUnderlineStyleAttributeName: @(NSUnderlineStyleSingle | NSUnderlinePatternDot)}
                        range:[blurb rangeOfString:@"placekitten.com"]];
        _textNode.attributedString = string;
        [self addSubnode:_textNode];
    }
    
    return self;
}

- (void)didLoad {
    self.layer.as_allowsHighlightDrawing = YES;
    [super didLoad];
}

#if UseAutomaticLayout
- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    ASCenterLayoutSpec *centerSpec = [[ASCenterLayoutSpec alloc] init];
    centerSpec.centeringOptions = ASCenterLayoutSpecCenteringX;
    centerSpec.sizingOptions = ASCenterLayoutSpecSizingOptionMinimumXY;
    centerSpec.child = _textNode;
    
    UIEdgeInsets paddings = UIEdgeInsetsMake(kTextPadding, kTextPadding, kTextPadding, kTextPadding);
    return [ASInsetLayoutSpec insetLayoutSpecWithInsets:paddings child:centerSpec];
}

#else
- (CGSize)calculateSizeThatFits:(CGSize)constrainedSize {
    CGSize measuredSize = [_textNode measure:CGSizeMake(constrainedSize.width - 2 * kTextPadding,
                                                        constrainedSize.height - 2 * kTextPadding)];
    return CGSizeMake(constrainedSize.width, measuredSize.height + 2 *kTextPadding);
}

- (void)layout {
    [super layout];
    CGSize textNodeSize = _textNode.calculatedSize;
    _textNode.frame = CGRectMake(roundf((self.calculatedSize.width - textNodeSize.width)/ 2.0f),
                                 kTextPadding,
                                 textNodeSize.width,
                                 textNodeSize.height);
}

#endif

- (BOOL)textNode:(ASTextNode *)textNode shouldHighlightLinkAttribute:(NSString *)attribute value:(id)value atPoint:(CGPoint)point {
    return YES;
}

- (void)textNode:(ASTextNode *)textNode tappedLinkAttribute:(NSString *)attribute value:(id)value atPoint:(CGPoint)point textRange:(NSRange)textRange {
    [[UIApplication sharedApplication] canOpenURL:value];
}

@end
