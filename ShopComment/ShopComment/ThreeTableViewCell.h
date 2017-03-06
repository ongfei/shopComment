//
//  ThreeTableViewCell.h
//  购物评论
//
//  Created by SINOKJ on 16/4/14.
//  Copyright © 2016年 Dyf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThreeTableViewCell : UITableViewCell

@property (nonatomic, strong) NSString *str;
@property (nonatomic, strong) NSArray *arr;
#warning 返回cell的高度 arrcount 是图片的个数 str 是cell里的主要内容
+(CGFloat)getCellHeightWithArrCount:(NSInteger)count andstr:(NSString *)str;
@end
