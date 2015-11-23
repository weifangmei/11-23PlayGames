//
//  SumAblityViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "SumAblityViewController.h"
#import "SumAbilityViewModel.h"
#import "SumADetailViewController.h"
@interface SumAblityViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong)UICollectionView *collectionView;

@property (nonatomic,strong)SumAbilityViewModel *sumAbilityVM;

@end

@implementation SumAblityViewController
-(SumAbilityViewModel *)sumAbilityVM{
    if (!_sumAbilityVM) {
        _sumAbilityVM =[SumAbilityViewModel new];
    }
    return _sumAbilityVM;
}
-(UICollectionView *)collectionView{
    if (!_collectionView) {
        _collectionView=[[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:[UICollectionViewFlowLayout new]];
        _collectionView.delegate =self;
        _collectionView.dataSource =self;
        [self.view addSubview:_collectionView];
        _collectionView.backgroundColor=[UIColor whiteColor];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        [_collectionView registerClass:[ZBItemCell class] forCellWithReuseIdentifier:@"SumACell"];
        _collectionView.header =[MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.sumAbilityVM getDataFromNetCompleteHandle:^(NSError *error) {
                if (error) {
                    [self showErrorMsg:error.localizedDescription];
                    
                }else{
                    [_collectionView reloadData];
                }
                [_collectionView.header endRefreshing];
            }];
        }];
        
    }
    return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"召唤师技能列表";
    [Factory addBackItemToVC:self];
    [self.collectionView.header beginRefreshing];
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.sumAbilityVM.rowNumber;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ZBItemCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:@"SumACell" forIndexPath:indexPath];
    cell.nameLb.text =[self.sumAbilityVM nameForRow:indexPath.row];
    [cell.iconImg.imageView setImageWithURL:[self.sumAbilityVM iconURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
    
    return cell;
}
/** 左右上下边距*/
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(5, 20, 5, 20);
}
/** 最小间距*/
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
}
/** 最小列间距*/
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 20;
}
/** 每格cell的 宽高 */
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat width = (kWindowW - 5 * 20) / 4;
    CGFloat height = width + 17;
    return CGSizeMake(width, height);
}
/** 点击一个cell跳转到下一个详情*/
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    SumADetailViewController *vc =[SumADetailViewController new];
    vc.sumModel =[self.sumAbilityVM modelForRow:indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
