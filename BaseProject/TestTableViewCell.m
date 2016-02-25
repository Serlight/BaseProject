//
//  TestTableViewCell.m
//  BaseProject
//
//  Created by 何长春 on 16/2/1.
//  Copyright © 2016年 Serlight. All rights reserved.
//

#import "TestTableViewCell.h"
#import <NimbusModels.h>

@interface TestTableViewCellUserInfo ()
@property(nonatomic, copy) NSString *code;
@property(nonatomic, copy) NSString *adsStr;

@end

@implementation TestTableViewCell

- (void)awakeFromNib {
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupViews];
    }
    
    return self;
}

- (void)setupViews {
    _contentLabel = [[UILabel alloc] initWithFrame:self.contentView.frame];
    [self.contentView addSubview:_contentLabel];
    _contentLabel.backgroundColor = [UIColor redColor];
}

- (BOOL)shouldUpdateCellWithObject:(id)object {
    NICellObject *obj = (NICellObject *)object;
    self.info = (User *)obj.userInfo;
    self.contentLabel.text = self.info.name;
    return YES;
}

+ (CGFloat)heightForObject:(id)object atIndexPath:(NSIndexPath *)indexPath tableView:(UITableView *)tableView {
    return 100;
}

+ (NICellObject *)createObject:(id)delegate userInfo:(id)userInfo
{
    NICellObject *cellObject = [[NICellObject alloc] initWithCellClass:[self class] userInfo:userInfo];
    return cellObject;
}

@end

@implementation User

- (id)initWithName:(NSString *)name age:(NSInteger)age {
    if (self = [[User alloc] init]) {
        _name = name;
        _age = age;
    }
    
    return self;
}

@end

@implementation TestTableViewCellUserInfo

- (void)setUser:(User *)user {
    _user = user;
}

@end
