//
//  ThreeTableViewCell.m
//  购物评论
//
//  Created by SINOKJ on 16/4/14.
//  Copyright © 2016年 Dyf. All rights reserved.
//

#import "ThreeTableViewCell.h"

@interface ThreeTableViewCell ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
/**
 *  头像
 */
@property (nonatomic, strong) UIImageView *headImageV;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIView *starbgView;
@property (nonatomic, strong) UILabel *dateLabel;
/**
 *  内容
 */
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, strong) UICollectionView *collectV;

@end
@implementation ThreeTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self prepareLayoutV];
    }
    return self;
}

- (void)prepareLayoutV {
    self.headImageV = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 40, 40)];
    self.headImageV.clipsToBounds = YES;
    self.headImageV.layer.cornerRadius = 20;
    self.headImageV.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:self.headImageV];
    
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.headImageV.frame) + 5, 11, 200, 15)];
    self.nameLabel.text = @"你丫蛋去死把";
    self.nameLabel.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:self.nameLabel];
    
    self.starbgView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.headImageV.frame) + 5, CGRectGetMaxY(self.nameLabel.frame) + 5, 100, 15)];
    self.starbgView.backgroundColor = [UIColor greenColor];
    [self.contentView addSubview:self.starbgView];
    
    self.dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.starbgView.frame) + 10, CGRectGetMinY(self.starbgView.frame), 200, 15)];
    self.dateLabel.font = [UIFont systemFontOfSize:10];
    self.dateLabel.text = @"2016-04-14";
    [self.contentView addSubview:self.dateLabel];
    
    self.contentLabel = [[UILabel alloc] init];
    self.contentLabel.numberOfLines = 0;
    self.contentLabel.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:self.contentLabel];
    
    self.flowLayout = [[UICollectionViewFlowLayout alloc]init];
    self.flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.flowLayout.minimumLineSpacing = 0;
    self.flowLayout.minimumInteritemSpacing = 0;
    self.flowLayout.itemSize = CGSizeMake(60, 60);//cell大小
    
    self.collectV = [[UICollectionView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(self.contentLabel.frame), [UIScreen mainScreen].bounds.size.width - 20, 200) collectionViewLayout:self.flowLayout];
    self.collectV.backgroundColor = [UIColor whiteColor];
    self.collectV.showsVerticalScrollIndicator = NO;
    
    self.collectV.delegate = self;
    self.collectV.dataSource = self;
    [self.collectV registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"collectionID"];
    [self addSubview: self.collectV];

    
    
}
- (void)setStr:(NSString *)str {
    if (_str != str) {
        _str = nil;
        _str = str;
        CGFloat height = [self getBigHeightWithText:str font:12 width:[UIScreen mainScreen].bounds.size.width - 20];
        self.contentLabel.frame = CGRectMake(10, CGRectGetMaxY(self.headImageV.frame) + 10, [UIScreen mainScreen].bounds.size.width - 20, height);
        self.contentLabel.text = str;
        
       
    }
}
-(void)setArr:(NSArray *)arr {
    if (_arr != arr) {
        _arr = nil;
        _arr = arr;
        CGFloat height = (arr.count * 60 + 30)/[UIScreen mainScreen].bounds.size.width;
        self.collectV.frame = CGRectMake(10, CGRectGetMaxY(self.contentLabel.frame), [UIScreen mainScreen].bounds.size.width - 20, [self decimalwithFormat:@"0" floatV:height] *60);
        [self.collectV reloadData];
    }
}
+(CGFloat)getCellHeightWithArrCount:(NSInteger)count andstr:(NSString *)str {
    CGFloat height = 70 + [self getBigHeightWithText:str font:12 width:[UIScreen mainScreen].bounds.size.width - 20] + [self decimalwithFormat:@"0" floatV:(count * 60 + 30)/[UIScreen mainScreen].bounds.size.width] *60;
    return height;
}
- (NSInteger) decimalwithFormat:(NSString *)format  floatV:(float)floatV
{
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setPositiveFormat:format];
    return  [[numberFormatter stringFromNumber:[NSNumber numberWithFloat:floatV]] integerValue];
}
+ (NSInteger) decimalwithFormat:(NSString *)format  floatV:(float)floatV
{
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setPositiveFormat:format];
    return  [[numberFormatter stringFromNumber:[NSNumber numberWithFloat:floatV]] integerValue];
}
-(CGFloat)getBigHeightWithText:(NSString *)text font:(CGFloat)f width:(CGFloat)width{
    UIFont * font = [UIFont systemFontOfSize:f];
    CGRect frame = [text boundingRectWithSize:CGSizeMake(width,1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font}context:nil];
    CGFloat height = frame.size.height;
    return height;
}
+(CGFloat)getBigHeightWithText:(NSString *)text font:(CGFloat)f width:(CGFloat)width{
    UIFont * font = [UIFont systemFontOfSize:f];
    CGRect frame = [text boundingRectWithSize:CGSizeMake(width,1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font}context:nil];
    CGFloat height = frame.size.height;
    return height;
}

#pragma mark - collection delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.arr.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionID" forIndexPath:indexPath];
    
    for (UIView *v in cell.subviews) {
        [v removeFromSuperview];
    }
    UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(2, 2, cell.frame.size.width - 4, cell.frame.size.height - 4)];
    imageV.backgroundColor = [UIColor greenColor];
    [cell addSubview:imageV];
    
    return cell;
    
}

@end
