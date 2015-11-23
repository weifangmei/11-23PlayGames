//
//  MusicListViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "MusicListViewController.h"
#import "MusicDetailCell.h"
#import "XiMaAlbumViewModel.h"
#import "PlayView.h"
@interface MusicListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)XiMaAlbumViewModel *albumVm;

@property (nonatomic,strong)UITableView *tableView;

@end

@implementation MusicListViewController
-(instancetype)initWithAlbumId:(NSInteger)albumId{
    if (self =[super init]) {
        _albumId = albumId;
    }
    return self;
}
-(XiMaAlbumViewModel *)albumVm{
    if (!_albumVm) {
        _albumVm =[[XiMaAlbumViewModel alloc]initWithAlbumId:_albumId];
    }
    return _albumVm;
}
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView =[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate =self;
        _tableView.dataSource = self;
        [_tableView registerClass:[MusicDetailCell class] forCellReuseIdentifier:@"MusicCell"];
        [self.view addSubview: _tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        
        _tableView.tableFooterView =[UIView new];
        //给个猜测的行高，方便cell可以自行计算应该有的高度
        _tableView.estimatedRowHeight = UITableViewAutomaticDimension;
        _tableView.header =[MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.albumVm refreshDataCompletionHandle:^(NSError *error) {
                
                if (error) {
                    [self showErrorMsg:error.localizedDescription];
                }else{
                    [_tableView reloadData];
                    [_tableView.footer resetNoMoreData];
                }
                [_tableView.header endRefreshing];
              
            }];
            
        }];
        _tableView.footer =[MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            [self.albumVm getMoreDataCompletionHandle:^(NSError *error) {
                if (error) {
                    [self showErrorMsg:error.localizedDescription];
                    [_tableView.footer endRefreshing];
                }
                else{
                    [_tableView reloadData];
                    if (self.albumVm.isHasMore) {
                        [_tableView.footer endRefreshing];
                    }else{
                        [_tableView.footer endRefreshingWithNoMoreData];
                    }
                }
                
            }];
        }];
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addBackItemToVC:self];
    [self.tableView.header beginRefreshing];
    /** 播放控制视图*/
    [self.view addSubview:[PlayView sharedInstance]];
    [[PlayView sharedInstance] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(80, 80));
    }];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.albumVm.rowNumber;
}
-(UITableViewCell  *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MusicDetailCell *cell =[tableView dequeueReusableCellWithIdentifier:@"MusicCell"];
    [cell.coverIV.imageView setImageWithURL:[self.albumVm  coverURLForRow:indexPath.row]  placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
    cell.titleLb.text =[self.albumVm titleForRow:indexPath.row];
    cell.sourceLb.text=[self.albumVm sourceForRow:indexPath.row];
    cell.playCountLb.text =[self.albumVm  playCountForRow:indexPath.row];
    cell.favorCountLb.text =[self.albumVm favoreCountForRow:indexPath.row];
    cell.commentCountLb.text =[self.albumVm  commentCountForRow:indexPath.row];
    cell.durationLb.text =[self.albumVm durationForRow:indexPath.row];
    cell.timeLb.text = [self.albumVm  timeForRow:indexPath.row];
    
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //[tableView deselectRowAtIndexPath:indexPath animated:YES];
    [[PlayView sharedInstance]playWithURL:[self.albumVm playURLForRow:indexPath.row]];
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
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
