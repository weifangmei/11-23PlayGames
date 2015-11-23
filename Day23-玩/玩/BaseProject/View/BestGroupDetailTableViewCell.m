//
//  BestGroupDetailTableViewCell.m
//  BaseProject
//
//  Created by tarena on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BestGroupDetailTableViewCell.h"

@implementation BestGroupDetailTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self =[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
       // self.titleLb.numberOfLines = 0;
       // self.desLb.numberOfLines = 0;
    }
    return self;
}
-(TRImageView *)desImg{
    if (!_desImg) {
        _desImg=[TRImageView new];
        [self.contentView addSubview:_desImg];
        [_desImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(45, 45));
            
        }];
    }
    return _desImg;
}
-(UILabel *)desImgLb{
    if (!_desImgLb) {
        _desImgLb =[UILabel new];
        
        [self.contentView addSubview:_desImgLb];
        [_desImgLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.desImg.mas_right).mas_equalTo(10);
            make.topMargin.mas_equalTo(self.desImg);
            make.right.mas_equalTo(-10);
            make.bottom.mas_equalTo(-5);
        }];
        _desImgLb.numberOfLines = 0;
    }
    return _desImgLb;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
