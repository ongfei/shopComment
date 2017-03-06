//
//  FourTableViewCell.h
//  购物评论
//
//  Created by SINOKJ on 16/4/14.
//  Copyright © 2016年 Dyf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FourTableViewCell : UITableViewCell
@property (nonatomic, strong) NSString *str;
+(CGFloat)getCellHeightWithstr:(NSString *)str;

@end
