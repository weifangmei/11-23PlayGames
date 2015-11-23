//
//  ZBItemListViewModel.h
//  BaseProject
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"

@interface ZBItemListViewModel : BaseViewModel

-(instancetype)initWithTag:(NSString *)tag;
@property (nonatomic,strong)NSString *tag;

@property(nonatomic)NSInteger rowNumber;
-(NSURL *)iconURLForRow:(NSInteger)row;
-(NSInteger)IDForRow:(NSInteger)row;
-(NSString *)textNameForRow:(NSInteger)row;
@end
