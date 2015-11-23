//
//  BestGroupDetailTableViewCell.h
//  BaseProject
//
//  Created by tarena on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BestGroupCell.h"
/** 
 2.整体是一个tableview，group风格的，两个section
 3.有两种类型的BestGroupDetailCell   cell 一种是负责显示团队简介，另一种是显示每一个角色的简介
 4.cell选中以后是浅黄色，色值自己量取
 */
@interface BestGroupDetailTableViewCell : UITableViewCell
@property (nonatomic,strong)TRImageView *desImg;
@property (nonatomic,strong)UILabel *desImgLb;
@end
