//
//  TestTableViewCell.m
//  BaseProject
//
//  Created by 何长春 on 16/2/1.
//  Copyright © 2016年 Serlight. All rights reserved.
//

#import "TestTableViewCell.h"
#import <NimbusModels.h>
#import <RpcProtocols/BXInsureProduct.h>

@interface TestTableViewCellUserInfo ()
@property(nonatomic, copy) NSString *code;
@property(nonatomic, copy) NSString *adsStr;

@end

@implementation TestTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (BOOL)shouldUpdateCellWithObject:(id)object {
    NICellObject *obj = (NICellObject *)object;
    self.info = (TestTableViewCellUserInfo *)obj.userInfo;
    
    return YES;
}

+ (CGFloat)heightForObject:(id)object atIndexPath:(NSIndexPath *)indexPath tableView:(UITableView *)tableView
{
    return 0;
}

+ (NICellObject *)createObject:(id)delegate userInfo:(id)userInfo
{
    NICellObject *cellObject = [[NICellObject alloc] initWithCellClass:[self class] userInfo:userInfo];
    return cellObject;
}

@end

@implementation TestTableViewCellUserInfo


- (void)setProduct:(BXInsureProduct *)product
{
    _product = product;
    self.code = [product getCode];
    self.adsStr = [product getAdsStr];
}

@end
