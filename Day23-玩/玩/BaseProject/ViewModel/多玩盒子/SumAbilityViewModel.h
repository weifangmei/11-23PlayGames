//
//  SumAbilityViewModel.h
//  BaseProject
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "DuoWanNetManager.h"
@interface SumAbilityViewModel : BaseViewModel

@property(nonatomic)NSInteger rowNumber;
/** 获取模型*/
-(SumAbilityModel *)modelForRow:(NSInteger)row;

/** 名字*/
-(NSString *)nameForRow:(NSInteger)row;
/** 需要等级*/
-(NSString *)levelForRow:(NSInteger)row;
/** 描述*/
-(NSString *)desForRow:(NSInteger)row;
/** 冷却时间*/
-(NSString *)cooldowmForRow:(NSInteger)row;
/** 天赋强化*/
-(NSString *)strongForRow:(NSInteger)row;
/** 提示*/
-(NSString *)tipsForRow:(NSInteger)row;

/** 图片*/
-(NSURL *)iconURLForRow:(NSInteger)row;
@end
