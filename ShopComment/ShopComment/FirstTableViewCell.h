//
//  FirstTableViewCell.h
//  购物评论
//
//  Created by SINOKJ on 16/4/14.
//  Copyright © 2016年 Dyf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstTableViewCell : UITableViewCell
/**
 *  评论人数 根据需要 传数组或者字典 自己改改
 */
@property (nonatomic, strong) NSDictionary *numberDic;
@property (nonatomic, copy) void (^Block)(NSInteger tag);
@end
