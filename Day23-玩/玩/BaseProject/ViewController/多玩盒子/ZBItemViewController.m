//
//  ZBItemViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ZBItemViewController.h"
#import "ZBItemListViewModel.h"
#import "TRImageView.h"

@implementation ZBItemCell
-(TRImageView *)iconImg{
    if (!_iconImg) {
        _iconImg =[TRImageView new];
        [self.contentView addSubview:_iconImg];
        [_iconImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_equalTo(0);
            make.height.mas_equalTo(_iconImg.mas_width);

            }];
    }
    return _iconImg;
}
-(UILabel *)nameLb{
    if (!_nameLb) {
        _nameLb =[UILabel new];
        _nameLb.font =[UIFont systemFontOfSize:13];
        _nameLb.textAlignment=NSTextAlignmentCenter;
        [self.contentView addSubview:_nameLb];
        [_nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.mas_equalTo(0);
        }];
    }
    return _nameLb;
}


@end
@interface ZBItemViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong)UICollectionView *collectionView;
@property (nonatomic,strong)ZBItemListViewModel *ItemVM;
@end

@implementation ZBItemViewController
-(instancetype)initWithName:(NSString *)textName tag:(NSString *)tag{
    if (self =[super init]) {
        _textName = textName;
        _tag = tag;
        [Factory addBackItemToVC:self];
    }
    return self;
}
-(ZBItemListViewModel *)ItemVM{
    if (!_ItemVM) {
        _ItemVM =[[ZBItemListViewModel alloc]initWithTag:self.tag];
    }
    return _ItemVM;
}


-(UICollectionView *)collectionView{
    if (_collectionView==nil) {

        _collectionView =[[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:[UICollectionViewFlowLayout new]];//FlowLayout
        _collectionView.delegate =self;
        _collectionView.dataSource =self;
        [self.view addSubview:_collectionView];
       
        _collectionView.backgroundColor=[UIColor whiteColor];
       
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _collectionView.header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.ItemVM getDataFromNetCompleteHandle:^(NSError *error) {
                if (error) {
                    [self showErrorMsg:error.localizedDescription];
                }else{
                    [_collectionView reloadData];
                }
                [_collectionView.header endRefreshing];
            }];
        }];

          [_collectionView registerClass:[ZBItemCell class] forCellWithReuseIdentifier:@"Cell"];
    }
    return _collectionView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.textName;

    [self.collectionView.header beginRefreshing];
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    //NSLog(@"%ld",self.ItemVM.rowNumber);
    return self.ItemVM.rowNumber;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ZBItemCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    NSLog(@"ddddd");
    cell.nameLb.text =[self.ItemVM textNameForRow:indexPath.row];
    [cell.iconImg.imageView setImageWithURL:[self.ItemVM iconURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
    return cell;
}
/** section的上下左右边距 */
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(5, 20, 5, 20);
}
/** 最小行间距 */
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
}
/** 最小列间距 */
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 20;
}
/** 每格cell的 宽高 */
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat width = (kWindowW - 5 * 20) / 4;
    CGFloat height = width + 17;
    return CGSizeMake(width, height);
}
@end
