//
//  SecondTableViewCell.m
//  购物评论
//
//  Created by SINOKJ on 16/4/14.
//  Copyright © 2016年 Dyf. All rights reserved.
//

#import "SecondTableViewCell.h"
#define SCRWIDTH [UIScreen mainScreen].bounds.size.width


@interface SecondTableViewCell ()
/**
 *  放星星那一行
 */
@property (nonatomic, strong) UIView *bgview;
@property (nonatomic, strong) UIView *textbgView;
@end
@implementation SecondTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self prepareLayoutV];
    }
    return self;
}

- (void)prepareLayoutV {
    self.bgview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCRWIDTH, 29)];
    self.bgview.backgroundColor = [UIColor colorWithRed:0.4824 green:1.0 blue:0.0287 alpha:1.0];
    [self.contentView addSubview:self.bgview];
    
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.bgview.frame), SCRWIDTH, 1)];
    v.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:v];
    
    self.textbgView = [[UIView alloc] initWithFrame:CGRectMake(10, 0, SCRWIDTH - 20, 66)];
    [self.contentView addSubview:self.textbgView];
    
}

- (void)setArr:(NSArray *)arr {
    if (_arr != arr) {
        _arr = nil;
        _arr = arr;
        [self layout];
    }
}
- (void)layout {
    for (UILabel *la in self.textbgView.subviews) {
        [la removeFromSuperview];
    }
    CGFloat wtotle = 10;
    CGFloat htotle = 32;
    for (int i = 0; i < self.arr.count; i++) {
        CGFloat wid = [self getWidthWithLabelText:_arr[i] font:10];
        if (wtotle > SCRWIDTH - wid) {
            wtotle = 10;
            htotle = htotle + 17 + 3;
        }
        [self customForLabelWithText:_arr[i] andFrame:CGRectMake(wtotle , htotle, wid + 3, 17)];
       wtotle = wid + wtotle + 10;
    }
}
- (UILabel *)customForLabelWithText:(NSString *)text andFrame:(CGRect)frame {
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.frame = frame;
    label.layer.cornerRadius = 4;
    label.layer.borderWidth = 1;
    label.font = [UIFont systemFontOfSize:10];
    label.layer.borderColor = [[UIColor orangeColor] CGColor];
    label.textAlignment = NSTextAlignmentCenter;
    [self.textbgView addSubview:label];
    return label;
}
-(CGFloat)getWidthWithLabelText:(NSString *)text font:(CGFloat)f{
    UIFont * font = [UIFont systemFontOfSize:f];
    CGSize size = [text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName, nil]];
    CGFloat w = size.width;
    return w;
}
@end
