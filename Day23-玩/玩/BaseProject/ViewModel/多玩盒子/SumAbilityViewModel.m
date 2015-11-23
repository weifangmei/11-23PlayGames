//
//  SumAbilityViewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "SumAbilityViewModel.h"
#import "SumAbilityModel.h"
@implementation SumAbilityViewModel
-(SumAbilityModel *)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}
-(NSInteger)rowNumber{
    return self.dataArr.count;
}
/** 名字*/
-(NSString *)nameForRow:(NSInteger)row{
    return [self modelForRow:row].name;
}
/** 需要等级*/
-(NSString *)levelForRow:(NSInteger)row{
    return [self modelForRow:row].level;
}
/** 描述*/
-(NSString *)desForRow:(NSInteger)row{
    return  [self modelForRow:row].des;
}
/** 冷却时间*/
-(NSString *)cooldowmForRow:(NSInteger)row{
    return [self modelForRow:row].cooldown;
}
/** 天赋强化*/
-(NSString *)strongForRow:(NSInteger)row{
    return [self modelForRow:row].strong;
}
/** 提示*/
-(NSString *)tipsForRow:(NSInteger)row{
    return [self modelForRow:row].tips;
}

/** 图片*/
-(NSURL *)iconURLForRow:(NSInteger)row{
    NSString *icon = [self modelForRow:row].ID;
    NSInteger index =icon.integerValue;
    return [NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/spells/png/%ld.png",index]];
}
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask=[DuoWanNetManager getSumAbilityCompletionHandle:^(id model, NSError *error) {
        self.dataArr =model;
        completionHandle(error);
    }];
}
@end
