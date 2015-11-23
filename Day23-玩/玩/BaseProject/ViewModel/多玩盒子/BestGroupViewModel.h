//
//  BestGroupViewModel.h
//  BaseProject
//
//  Created by tarena on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "DuoWanNetManager.h"
@interface BestGroupViewModel : BaseViewModel
/** 行数*/
@property(nonatomic)NSInteger rowNumber;
/** 题目*/
-(NSString *)titleForRow:(NSInteger)row;
/** 描述*/
-(NSString *)descForRow:(NSInteger)row;
/* 头像地址*/
-(NSArray *)iconURLsForRow:(NSInteger)row;
/** 英雄描述的数组*/
-(NSArray *)descsForRow:(NSInteger)row;

@end
