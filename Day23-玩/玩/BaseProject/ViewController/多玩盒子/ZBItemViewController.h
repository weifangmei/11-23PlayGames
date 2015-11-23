//
//  ZBItemViewController.h
//  BaseProject
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRImageView.h"
@interface ZBItemCell:UICollectionViewCell
@property (nonatomic,strong)TRImageView *iconImg;
@property (nonatomic,strong)UILabel *nameLb;
@end
@interface ZBItemViewController : UIViewController
-(instancetype)initWithName:(NSString *)textName tag:(NSString *)tag;
@property (nonatomic,strong)NSString *textName;
@property (nonatomic,strong)NSString *tag;
@end
