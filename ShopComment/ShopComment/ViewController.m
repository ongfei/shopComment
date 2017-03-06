//
//  ViewController.m
//  购物评论
//
//  Created by SINOKJ on 16/4/14.
//  Copyright © 2016年 Dyf. All rights reserved.
//

#import "ViewController.h"
#import "FirstTableViewCell.h"
#import "SecondTableViewCell.h"
#import "ThreeTableViewCell.h"
#import "FourTableViewCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableV;
@property (nonatomic, strong) NSMutableArray *sourceArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self prepareSubViews];
    
}

- (void)prepareSubViews {
    self.tableV = [[UITableView alloc] initWithFrame:self.view.bounds style:(UITableViewStylePlain)];
    self.tableV.delegate = self;
    self.tableV.dataSource = self;
    [self.view addSubview:self.tableV];
    self.tableV.allowsSelection = NO;
    
    [self.tableV registerClass:[FirstTableViewCell class] forCellReuseIdentifier:@"FirstTableViewCell"];
     [self.tableV registerClass:[SecondTableViewCell class] forCellReuseIdentifier:@"SecondTableViewCell"];
     [self.tableV registerClass:[ThreeTableViewCell class] forCellReuseIdentifier:@"ThreeTableViewCell"];
     [self.tableV registerClass:[FourTableViewCell class] forCellReuseIdentifier:@"FourTableViewCell"];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
            return 1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        FirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FirstTableViewCell" forIndexPath:indexPath];
        cell.Block = ^(NSInteger tag){
            NSLog(@"%ld",tag);
#warning 在这里根据点不同的button 请求接口 换数据源
        };
#warning   对cell中的dic赋值
        //    cell.numberDic =
        return cell;
        
    }else if (indexPath.section == 1){
        
        SecondTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SecondTableViewCell" forIndexPath:indexPath];
        cell.arr = @[@"味道很好",@"味道怎么样",@"味道杠杠的啊",@"味道哈哈哈",@"味道哈哈哈",@"味道哈哈哈",@"味道哈哈哈"];
        return cell;
    }else if (indexPath.section == 2){
        ThreeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ThreeTableViewCell" forIndexPath:indexPath];
        cell.str = @"是大连市你过来撒黁心里MV离开你板块拉升老师那边凉快哪吗;老师明白了扣女的洒满了快女了呢伴侣吗;拉萨可能吗;发生MV绿;安师大把没;副科长你看没功夫;懒得不过马上呢b.amlnksdnbvm;sanb.s;vnsafma;n;麻烦;了吗;富马酸;浪费马上没发;麻烦;啊老是麻烦;阿拉善盟;";
        cell.arr = @[@"dsad",@"da",@"dsad",@"dsad",@"da",@"dsad",@"dsad",@"da",@"dsad",@"dsad"];
        return cell;
    }else {
        FourTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FourTableViewCell" forIndexPath:indexPath];
        cell.str = @"dsnglknan那里可是你不来的可能到了快三年了可能是来你不来开始到哪里看把你睡了的可能本来开始你看了不能说看来你不了的是你不是哪里恐怖你的事了 ";
        return cell;
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 40;
    }else if(indexPath.section == 1) {
        return 90;
    }else if(indexPath.section == 2){
        return [ThreeTableViewCell getCellHeightWithArrCount:10 andstr: @"是大连市你过来撒黁心里MV离开你板块拉升老师那边凉快哪吗;老师明白了扣女的洒满了快女了呢伴侣吗;拉萨可能吗;发生MV绿;安师大把没;副科长你看没功夫;懒得不过马上呢b.amlnksdnbvm;sanb.s;vnsafma;n;麻烦;了吗;富马酸;浪费马上没发;麻烦;啊老是麻烦;阿拉善盟;"];
        
    }else {
        return [FourTableViewCell getCellHeightWithstr: @"dsnglknan那里可是你不来的可能到了快三年了可能是来你不来开始到哪里看把你睡了的可能本来开始你看了不能说看来你不了的是你不是哪里恐怖你的事了 "];
    }
}

@end
