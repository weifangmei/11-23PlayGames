//
//  BaiKeViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaiKeViewController.h"
#import "ToolMenuViewModel.h"
#import "TRImageView.h"
#import "TuWanHtmlViewController.h"
#import "BestGroupViewController.h"
#import "ZBCategoryViewController.h"
#import "SumAblityViewController.h"
@interface BaiKeCell:UITableViewCell
@property (nonatomic,strong)TRImageView *iconView;
@property (nonatomic,strong)UILabel *nameLb;
@end
@implementation BaiKeCell
-(TRImageView *)iconView{
    if (!_iconView) {
        _iconView =[[TRImageView alloc]init];
        [self.contentView addSubview:_iconView];
        [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(72/2, 72/2));
        }];

    }
    return _iconView;
}
-(UILabel *)nameLb{
    if (!_nameLb) {
        _nameLb =[UILabel new];
        [self.contentView addSubview:_nameLb];
        [_nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.iconView.mas_right).mas_equalTo(10);
            make.centerY.mas_equalTo(0);
            make.right.mas_equalTo(-10);
            
        }];
        _nameLb.font =[UIFont systemFontOfSize:18];
        
    }
    return _nameLb;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self =[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }
    return self;
}

@end


@interface BaiKeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)ToolMenuViewModel *toolMenuVM;
@end

@implementation BaiKeViewController
-(ToolMenuViewModel *)toolMenuVM{
    if (!_toolMenuVM) {
        _toolMenuVM =[[ToolMenuViewModel alloc]init];
        
    }
    return _toolMenuVM;
}
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView =[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate =self;
        _tableView.dataSource =self;
        _tableView.tableFooterView =[UIView  new];
        [_tableView registerClass:[BaiKeCell class] forCellReuseIdentifier:@"ToolCell"];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _tableView.header =[MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.toolMenuVM getDataFromNetCompleteHandle:^(NSError *error) {
                if (error) {
                    [self showErrorMsg:error.localizedDescription];
                }else{
                    [_tableView reloadData];
                }
                [_tableView.header endRefreshing];
            }];
        }];
        
    }
    
    return _tableView;
}
-(instancetype)init{
    if (self =[super init]) {
         self.title =@"游戏百科";
    }
    return self;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  //  NSLog(@"dddd%ld",self.toolMenuVM.rowNumber);
    return self.toolMenuVM.rowNumber;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BaiKeCell *cell =[tableView dequeueReusableCellWithIdentifier:@"ToolCell"];
    [cell.iconView.imageView setImageWithURL:[self.toolMenuVM iconURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
    cell.nameLb.text =[self.toolMenuVM nameForRow:indexPath.row];
    return cell;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addMenuItemToVC:self];
    [self.tableView.header beginRefreshing];
   
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   // [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([self.toolMenuVM typeForRow:indexPath.row] == ToolMenuItemTypeWeb) {
        TuWanHtmlViewController *vc =[[TuWanHtmlViewController  alloc]initWithURL:[self.toolMenuVM webURLForRow:indexPath.row]];
        vc.hidesBottomBarWhenPushed =YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
    if ([[self.toolMenuVM tagForRow:indexPath.row] isEqualToString:@"best_group"]) {
        BestGroupViewController *vc =[BestGroupViewController new];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
    if ([[self.toolMenuVM tagForRow:indexPath.row] isEqualToString:@"item"]) {
        ZBCategoryViewController *vc =[ZBCategoryViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if ([[self.toolMenuVM tagForRow:indexPath.row] isEqualToString:@"sum_ability"]) {
        SumAblityViewController *vc =[SumAblityViewController new];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
