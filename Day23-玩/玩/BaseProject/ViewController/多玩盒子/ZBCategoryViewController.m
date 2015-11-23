//
//  ZBCategoryViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ZBCategoryViewController.h"
#import "ZBCategoryViewModel.h"
#import "ZBItemViewController.h"
@interface ZBCategoryViewController ()
@property (nonatomic,strong)ZBCategoryViewModel *zbVM;
@end

@implementation ZBCategoryViewController
-(ZBCategoryViewModel *)zbVM{
    if (!_zbVM) {
        _zbVM =[ZBCategoryViewModel new];
    }
    return _zbVM;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =@"装备分类";
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    self.tableView.tableFooterView =[UIView new];
    self.tableView.header =[MJRefreshNormalHeader headerWithRefreshingBlock:^{
       [self.zbVM getDataFromNetCompleteHandle:^(NSError *error) {
           if (error) {
               [self showErrorMsg:error.localizedDescription];
           }else{
               [self.tableView reloadData];
           }
           [self.tableView.header endRefreshing];
       }];
   }];
    [self.tableView.header beginRefreshing];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.zbVM.rowNumber;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.accessoryType =UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text =[self.zbVM textForRow:indexPath.row];
    cell.detailTextLabel.text = @"进入";
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ZBItemViewController *vc =[[ZBItemViewController alloc]initWithName:[self.zbVM textForRow:indexPath.row] tag:[self.zbVM tagForRow:indexPath.row]];
  //  vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];

}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
