//
//  TestTableViewCell.h
//  BaseProject
//
//  Created by 何长春 on 16/2/1.
//  Copyright © 2016年 Serlight. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NICell;
@class BXInsureProduct;
@class NICellObject;

@interface TestTableViewCellUserInfo : NSObject

@property(nonatomic, strong) BXInsureProduct *product;


@end

@interface TestTableViewCell : UITableViewCell<NICell>

@property(nonatomic, strong) TestTableViewCellUserInfo *info;

+ (NICellObject *)createObject:(id)delegate userInfo:(id)userInfo;

@end
