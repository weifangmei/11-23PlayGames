//
//  ZBCategoryViewModel.h
//  BaseProject
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "DuoWanNetManager.h"
@interface ZBCategoryViewModel : BaseViewModel
@property(nonatomic)NSInteger rowNumber;
-(NSString *)textForRow:(NSInteger)row;
-(NSString *)tagForRow:(NSInteger)row;
@end
