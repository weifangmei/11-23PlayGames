//
//  BestGroupViewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BestGroupViewModel.h"
#import "BestGroupModel.h"
#define kHeroIconURL  NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg"
@implementation BestGroupViewModel
/** 行数*/
-(NSInteger)rowNumber{
    return self.dataArr.count;
}
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask =[DuoWanNetManager getHeroBestGroupCompletionHandle:^(id model, NSError *error) {
        self.dataArr = model;
        completionHandle(error);
    }];
}
-(BestGroupModel *)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}
/** 题目*/
-(NSString *)titleForRow:(NSInteger)row{
   return  [self modelForRow:row].title;
}
/** 描述*/
-(NSString *)descForRow:(NSInteger)row{
    return  [self modelForRow:row].des;
}
/* 头像地址*/
-(NSArray *)iconURLsForRow:(NSInteger)row{
    return @[[kHeroIconURL,[self modelForRow:row].hero1],
             [kHeroIconURL,[self modelForRow:row].hero2],
             [kHeroIconURL,[self modelForRow:row].hero3],
             [kHeroIconURL,[self modelForRow:row].hero4],
             [kHeroIconURL,[self modelForRow:row].hero5]
             ];
}
-(NSArray *)descsForRow:(NSInteger)row{
    return @[[self modelForRow:row].des1,
             [self modelForRow:row].des2,
             [self modelForRow:row].des3,
             [self modelForRow:row].des4,
             [self modelForRow:row].des5,
             ];
}
@end
