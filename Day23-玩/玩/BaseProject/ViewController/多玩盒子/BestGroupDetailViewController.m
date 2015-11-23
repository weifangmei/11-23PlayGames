//
//  BestGroupDetailViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BestGroupDetailViewController.h"
#import "BestGroupDetailTableViewCell.h"
#import "BestGroupViewModel.h"
#import "BestGroupCell.h"
@interface BestGroupDetailViewController ()<UITableViewDelegate ,UITableViewDataSource>


@property (nonatomic,strong)UITableView *tableView;
@end

@implementation BestGroupDetailViewController
-(instancetype)initWithTitle:(NSString *)title des:(NSString *)des icons:(NSArray *)icons descs:(NSArray *)descs{
    if (self =[super init]) {
        _titlea =title;
        _des = des;
        _icons = icons;
        _descs = descs;
    }
    return self;
}
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView =[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate =self;
        _tableView.dataSource =self;
        _tableView.tableFooterView =[UIView new];
        [_tableView registerClass:[BestGroupDetailTableViewCell class] forCellReuseIdentifier:@"DetailCell"];
        [_tableView registerClass:[BestGroupCell class] forCellReuseIdentifier:@"BestCell"];
        [self.view addSubview:_tableView];
        
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        
    }
    return _tableView;

}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    return self.icons.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    if (indexPath.section==0) {
        BestGroupCell *cell =[tableView dequeueReusableCellWithIdentifier:@"BestCell"];
        cell.titleLb.text =_titlea;
        cell.desLb.numberOfLines = 0;
        cell.desLb.text =_des;
       //[cell.heroImg1.imageView setImageWithURL:self.icons[0]];
        NSArray *arr =@[cell.heroImg1,cell.heroImg2,cell.heroImg3,cell.heroImg4,cell.heroImg5];
        [arr enumerateObjectsUsingBlock:^(TRImageView *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [obj.imageView setImageWithURL:[NSURL URLWithString:_icons[idx]] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
        }];
        
        return cell;
    }else{
     BestGroupDetailTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"DetailCell"];
    [cell.desImg.imageView setImageWithURL:_icons[indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
     cell.desImgLb.text =_descs[indexPath.row];
    return cell;
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
   self.title =@"阵容详情";
    [self.tableView.header beginRefreshing];
    [Factory addBackItemToVC:self];
}
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
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
