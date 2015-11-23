//
//  SumADetailViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "SumADetailViewController.h"
#import "TRImageView.h"

@interface SumAbilityCell:UITableViewCell

@property (nonatomic,strong)UILabel *desLb;

@end
@implementation SumAbilityCell
-(UILabel *)desLb{
    if (!_desLb) {
        _desLb =[UILabel new];
        _desLb.numberOfLines =0;
        _desLb.font =[UIFont systemFontOfSize:14];
    //黑线方框背景，正常由美工提供。 如果没有美工 可以考虑使用灰色视图套白色视图，两者边缘差距1像素来解决
      UIView  *grayView =[UIView new];
        grayView.layer.cornerRadius = 4;
      grayView.backgroundColor =[UIColor lightGrayColor];
      [self.contentView addSubview:grayView];
      [grayView mas_makeConstraints:^(MASConstraintMaker *make) {
          make.edges.mas_equalTo(UIEdgeInsetsMake(3, 10, 3, 10));
      }];
    
        UIView *whiteView =[UIView new];
        whiteView.backgroundColor =[UIColor whiteColor];
        [grayView addSubview:whiteView];
        [whiteView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(1, 1, 1, 1));
            make.height.mas_greaterThanOrEqualTo(28);
        }];
        whiteView.layer.cornerRadius = 4;
        
        [whiteView addSubview:_desLb];
        
        [_desLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(10, 10, 10, 10));
        }];
    }
    return _desLb;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self =[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor =[UIColor clearColor];
        self.backgroundColor =[UIColor clearColor];
    }
    return self;
}

@end
@interface SumADetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)UIView *topView;

@end

@implementation SumADetailViewController
-(UIView *)topView{
    if (!_topView) {
        _topView =[UIView new];
        [self.view addSubview:_topView];
        [_topView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.mas_equalTo(0);
            make.height.mas_equalTo(90);
        }];
        //技能图标
        TRImageView *iconImg =[TRImageView new];
        NSURL *iconURL =[NSURL URLWithString:[NSString stringWithFormat: @"http://img.lolbox.duowan.com/spells/png/%@.png",self.sumModel.ID]];
        [iconImg.imageView setImageWithURL:iconURL placeholderImage:[UIImage imageNamed:@"cell_bg_noData_5"]];
        [_topView addSubview:iconImg];
        [iconImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(60, 60));
        }];
    //技能名称
        UILabel *namelabel =[UILabel new];
        namelabel.text =self.sumModel.name;
        namelabel.font =[UIFont systemFontOfSize:14];
        [_topView addSubview:namelabel];
        [namelabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(iconImg.mas_right).mas_equalTo(8);
            make.right.mas_equalTo(-10);
            make.topMargin.mas_equalTo(iconImg);
        }];
        
        //技能等级
        UILabel *leverLb =[UILabel new];
        leverLb.font =[UIFont systemFontOfSize:14];
        leverLb.text =[@"需要等级:" stringByAppendingString:self.sumModel.level];
        [_topView addSubview:leverLb];
        [leverLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.rightMargin.mas_equalTo(namelabel);
            make.top.mas_equalTo(namelabel.mas_bottom).mas_equalTo(5);
            
        }];
        //冷却时间
        UILabel *coolDowmLb =[UILabel new];
        coolDowmLb.font =[UIFont systemFontOfSize:14];
        coolDowmLb.text =[@"冷却时间:" stringByAppendingString:self.sumModel.cooldown];
        [_topView addSubview:coolDowmLb];
        [coolDowmLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.rightMargin.mas_equalTo(namelabel);
            make.top.mas_equalTo(leverLb.mas_bottom).mas_equalTo(5);
        }];
    }
    return _topView;
}
-(UITableView *)tableView{
    if (!_tableView ) {
        _tableView =[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate =self;
        _tableView.dataSource = self;
        [_tableView registerClass:[SumAbilityCell class] forCellReuseIdentifier:@"desCell"];
        _tableView.separatorStyle = 0;
        _tableView.tableFooterView =[UIView new];
        _tableView.backgroundColor=[UIColor clearColor];
        _tableView.sectionHeaderHeight = 23;
        _tableView.allowsSelection =  NO;
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.topView.mas_bottom).mas_equalTo(0);
            make.left.bottom.right.mas_equalTo(0);
        }];
    }
    return _tableView;
}

-(void)viewDidLoad {
    [super viewDidLoad];
    self.title =@"召唤师技能";
    [Factory addBackItemToVC:self];
    self.view.backgroundColor=kRGBColor(246, 247, 251);
    [self.tableView.header beginRefreshing];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SumAbilityCell *cell =[tableView dequeueReusableCellWithIdentifier:@"desCell"];
    if (indexPath.section== 0) {
       
        cell.desLb.text =self.sumModel.des;
    }
    if (indexPath.section == 1) {
        cell.desLb.text =self.sumModel.strong;
    }
    if (indexPath.section == 2) {
        cell.desLb.text =self.sumModel.tips;
    }.
    return cell;
}

/** 每一分区的标题*/
//-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//    
//    return @[@"描述",@"天赋强化",@"提示"][section];
//}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view =[UIView new];
    view.backgroundColor=self.view.backgroundColor;
    
    UILabel *label =[UILabel new];
    label.backgroundColor=[UIColor clearColor];
    label.font  =[UIFont systemFontOfSize:14];
    label.backgroundColor=[UIColor clearColor];
    label.text =@[@"描述",@"天赋强化",@"提示"][section];
    [view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.mas_equalTo(0);
    }];
    
    return view;
}
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}
@end
