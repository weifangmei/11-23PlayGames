//
//  ZBCategoryViewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ZBCategoryViewModel.h"
#import "ZBCategoryModel.h"
@implementation ZBCategoryViewModel
-(NSInteger)rowNumber{
    return self.dataArr.count;
}
-(ZBCategoryModel *)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}
-(NSString *)textForRow:(NSInteger)row{
    return [self modelForRow:row].text;
}
-(NSString *)tagForRow:(NSInteger)row{
    return [self modelForRow:row].tag;
}
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask =[DuoWanNetManager getZBCategoryCompletionHandle:^(id model, NSError *error) {
        self.dataArr = model;
        completionHandle(error);
    }];
}
@end
