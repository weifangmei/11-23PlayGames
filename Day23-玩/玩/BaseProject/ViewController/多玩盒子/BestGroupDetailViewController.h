//
//  BestGroupDetailViewController.h
//  BaseProject
//
//  Created by tarena on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "BestGroupViewModel.h"
/** 步骤：
 1.数据的传入：通过在BestGroupViewController点击任意cell。获取对应的BestGroupModel类型对象
 
 2.整体是一个tableview，group风格的，两个section
 3.有两种类型的BestGroupDetailCell   cell 一种是负责显示团队简介，另一种是显示每一个角色的简介
 4.cell选中以后是浅黄色，色值自己量取
 
 */
@interface BestGroupDetailViewController : UIViewController
-(instancetype)initWithTitle:(NSString *)title des:(NSString *)des icons:(NSArray *)icons descs:(NSArray *)descs;

@property (nonatomic,strong)NSString *titlea;
@property (nonatomic,strong)NSString *des;
@property (nonatomic,strong)NSArray *icons;
@property (nonatomic,strong)NSArray *descs;
@end
