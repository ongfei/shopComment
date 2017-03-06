//
//  FirstTableViewCell.m
//  购物评论
//
//  Created by SINOKJ on 16/4/14.
//  Copyright © 2016年 ;. All rights reserved.
//

#import "FirstTableViewCell.h"
#define SCRWIDTH [UIScreen mainScreen].bounds.size.width

@interface FirstTableViewCell ()
@property (nonatomic, strong) UIButton *btn1;
@property (nonatomic, strong) UILabel *lable1;
@property (nonatomic, strong) UIButton *btn2;
@property (nonatomic, strong) UILabel *lable2;
@property (nonatomic, strong) UIButton *btn3;
@property (nonatomic, strong) UILabel *lable3;
@property (nonatomic, strong) UIButton *btn4;
@property (nonatomic, strong) UILabel *lable4;
@property (nonatomic, strong) UIButton *btn5;
@property (nonatomic, strong) UILabel *lable5;
@end
@implementation FirstTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self prepareLayoutV];
    }
    return self;
}

- (void)prepareLayoutV {
    NSArray *arr = @[@"全部评论",@"好评",@"中评",@"差评",@"晒图"];
    
    self.btn1 = [self customButtonWithTiTle:arr[0] andFrame:CGRectMake(10 , 3, (SCRWIDTH - 10) / 5, 40)];
    self.btn1.tag = 10001;
    self.lable1 = [self customLabelWithFrame:self.btn1.frame withTag:1001];
    [self.btn1 addSubview:self.lable1];
    for (UIView *view in self.btn1.subviews) {
        if ([view isKindOfClass:[UILabel class]]) {
            [(UILabel *)view setTextColor:[UIColor colorWithRed:255/255.0 green:101/255.0 blue:1/255.0 alpha:1]];
        }
    }
    
    self.btn2 = [self customButtonWithTiTle:arr[1] andFrame:CGRectMake(10 + ((SCRWIDTH - 10) / 5), 3, (SCRWIDTH - 10) / 5, 40)];
    self.btn2.tag = 10002;
    self.lable2 = [self customLabelWithFrame:self.btn2.frame withTag:1002];
    [self.btn2 addSubview:self.lable2];
    
    self.btn3 = [self customButtonWithTiTle:arr[2] andFrame:CGRectMake(10 + 2 * ((SCRWIDTH - 10) / 5) , 3, (SCRWIDTH - 10) / 5, 40)];
    self.btn3.tag = 10003;
    self.lable3 = [self customLabelWithFrame:self.btn3.frame withTag:1003];
    [self.btn3 addSubview:self.lable3];
    
    self.btn4 = [self customButtonWithTiTle:arr[3] andFrame:CGRectMake(10 + 3 * ((SCRWIDTH - 10) / 5) , 3, (SCRWIDTH - 10) / 5, 40)];
    self.btn4.tag = 10004;
    self.lable4 = [self customLabelWithFrame:self.btn4.frame withTag:1004];
    [self.btn4 addSubview:self.lable4];
    
    self.btn5 = [self customButtonWithTiTle:arr[4] andFrame:CGRectMake(10 + 4 * ((SCRWIDTH - 10) / 5) , 3, (SCRWIDTH - 10) / 5, 40)];
    self.btn5.tag = 10005;
    self.lable5 = [self customLabelWithFrame:self.btn5.frame withTag:1005];
    [self.btn5 addSubview:self.lable5];
    
}
- (UIButton *)customButtonWithTiTle:(NSString *)tit andFrame:(CGRect)frame {
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    btn.frame = frame;
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, btn.frame.size.width, 16)];
    label.font = [UIFont systemFontOfSize:13];
    label.userInteractionEnabled = YES;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = tit;
    [label setTextColor:[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1]];
    [btn addSubview:label];
    [self.contentView addSubview:btn];
    return btn;
}
- (UILabel *)customLabelWithFrame:(CGRect)frame withTag:(NSInteger)tag {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 19, frame.size.width, 15)];
    label.font = [UIFont systemFontOfSize:11];
    label.userInteractionEnabled = YES;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"212121";
    [label setTextColor:[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1]];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelClick:)];
    
    [label addGestureRecognizer:tap];
    
    label.tag = tag;
    
    return label;
}

- (void)labelClick:(UITapGestureRecognizer *)tap {
    
    UIButton *bt = [self viewWithTag:tap.view.tag + 9000];
    
    [self btnClick:bt];
}

- (void)btnClick:(UIButton *)btn {
    for (UIButton *bt in self.contentView.subviews) {
        for (UIView *view in bt.subviews) {
            if ([view isKindOfClass:[UILabel class]]) {
                [(UILabel *)view setTextColor:[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1]];
            }
        }
    }
    for (UIView *view in btn.subviews) {
        if ([view isKindOfClass:[UILabel class]]) {
            [(UILabel *)view setTextColor:[UIColor colorWithRed:255/255.0 green:101/255.0 blue:1/255.0 alpha:1]];
        }
    }
    self.Block(btn.tag);
}
-(void)setNumberDic:(NSDictionary *)numberDic {
    if (_numberDic != numberDic) {
        _numberDic = nil;
        _numberDic = numberDic;
#warning //全部评论 ..等等对应起来
        
        self.lable1.text = numberDic[@""];
        self.lable2.text = numberDic[@""];
        self.lable3.text = numberDic[@""];
        self.lable4.text = numberDic[@""];
        self.lable5.text = numberDic[@""];
    }
}
@end
