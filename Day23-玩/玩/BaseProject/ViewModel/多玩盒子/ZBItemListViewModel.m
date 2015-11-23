//
//  ZBItemListViewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ZBItemListViewModel.h"
#import "ZBItemModel.h"
#import "DuoWanNetManager.h"

@implementation ZBItemListViewModel
-(instancetype)initWithTag:(NSString *)tag{
    if (self =[super init]) {
        _tag = tag;
    }
    return self;
}
-(NSInteger)rowNumber{
    return self.dataArr.count;
}
-(ZBItemModel *)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}
-(NSString *)textNameForRow:(NSInteger)row{
    return [self modelForRow:row].text;
}
-(NSInteger)IDForRow:(NSInteger)row{
    return  [self modelForRow:row].ID;
}
-(NSURL *)iconURLForRow:(NSInteger)row{
    NSString *path =[NSString stringWithFormat:@"http://img.lolbox.duowan.com/zb/%ld_64x64.png",[self modelForRow:row].ID];
    return [NSURL URLWithString:path];
}
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask =[DuoWanNetManager getZBItemListWithTag:_tag completionHandle:^(id model, NSError *error) {
        if (!error) {
            self.dataArr = model;
        }
        completionHandle(error);
    }];
}
@end
