//
//  ContentTableViewCell.h
//  BaseProject
//
//  Created by 何长春 on 15/12/15.
//  Copyright © 2015年 Serlight. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContentTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *detail1;
@property (weak, nonatomic) IBOutlet UILabel *detail2;
@end
