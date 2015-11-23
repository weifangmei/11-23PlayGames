//
//  BestGroupViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BestGroupViewController.h"
#import "BestGroupViewModel.h"
#import "TRImageView.h"
#import "BestGroupCell.h"
#import "BestGroupDetailViewController.h"
/** 制作步骤：
 1.创建BestGroupViewModel
 只需要实现getData就可以，没有分页问题
 modle只能提供了英雄英文名，需要拼接英雄头像地址才可以
 http://img.lolbox.duowan.com/champions/Annie_120x120.jpg
 2.创建BestGroupCell 继承自UITableViewCell头像的大小固定，间距使用window宽-5 *图片宽度/6 获得，
 cell 的题目最多一行，详情最多两行 选中后显示浅黄色
 3.BestGroupViewController制作 对cell高度，只需要实现estimatedHeightForRow协议即可自动适应
 4.BaiKeViewcontroller的cell点击事件中判断 VM层的tag值是best_group 则 跳转
 
 */


@interface BestGroupViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)BestGroupViewModel *bestVM;
@end

@implementation BestGroupViewController
-(BestGroupViewModel *)bestVM{
    if (!_bestVM) {
        _bestVM =[BestGroupViewModel new];
    }
    return _bestVM;
}
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView =[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate =self;
        _tableView.dataSource =self;
        [_tableView registerClass:[BestGroupCell class] forCellReuseIdentifier:@"BestCell"];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _tableView.header =[MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.bestVM getDataFromNetCompleteHandle:^(NSError *error) {
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
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.bestVM.rowNumber;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BestGroupCell *cell =[tableView dequeueReusableCellWithIdentifier:@"BestCell"];
    cell.titleLb.text =[self.bestVM titleForRow:indexPath.row];
    cell.desLb.text =[self.bestVM descForRow:indexPath.row];
    NSArray *arr =[self.bestVM iconURLsForRow:indexPath.row];
    [cell.heroImg1.imageView setImageWithURL:[NSURL URLWithString:arr[0]]];
    [cell.heroImg2.imageView setImageWithURL:[NSURL URLWithString:arr[1]]];
    [cell.heroImg3.imageView setImageWithURL:[NSURL URLWithString:arr[2]]];
    [cell.heroImg4.imageView setImageWithURL:[NSURL URLWithString:arr[3]]];
    [cell.heroImg5.imageView setImageWithURL:[NSURL URLWithString:arr[4]]];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =@"最佳阵容";
    [self.tableView.header beginRefreshing];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    BestGroupDetailViewController *vc =[[BestGroupDetailViewController alloc]initWithTitle:[self.bestVM titleForRow:indexPath.row] des:[self.bestVM descForRow:indexPath.row] icons:[self.bestVM iconURLsForRow:indexPath.row] descs:[self.bestVM descsForRow:indexPath.row]];
   
    [self.navigationController pushViewController:vc animated:YES];
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
