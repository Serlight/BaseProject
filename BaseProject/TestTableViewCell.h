//
//  TestTableViewCell.h
//  BaseProject
//
//  Created by 何长春 on 16/2/1.
//  Copyright © 2016年 Serlight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Nimbus/NICellFactory.h>

@protocol NICell;
@protocol NINibCellObject;
@class NICellObject;

@interface User: NSObject

@property(nonatomic, copy) NSString *name;
@property(nonatomic, assign) NSInteger age;

- (id)initWithName:(NSString *)name age:(NSInteger)age;

@end

@interface TestTableViewCellUserInfo : NSObject

@property(nonatomic, strong) User *user;

@end

@interface TestTableViewCell : UITableViewCell<NICell>

@property (nonatomic, strong)UILabel *contentLabel;

@property(nonatomic, strong) User *info;

+ (NICellObject *)createObject:(id)delegate userInfo:(id)userInfo;

@end
