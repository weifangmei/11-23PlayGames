//
//  BestGroupCell.m
//  BaseProject
//
//  Created by tarena on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BestGroupCell.h"
#define kSpeartor (kWindowW - 5 * 45)/6
@implementation BestGroupCell
-(UILabel *)titleLb{
    if (!_titleLb) {
        _titleLb =[UILabel new];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(5);
            make.left.mas_equalTo(15);
            make.right.mas_equalTo(-15);
           
        }];
        _titleLb.numberOfLines = 1;
    }
    return _titleLb;
}
-(UILabel *)desLb{
    if (!_desLb) {
        _desLb =[UILabel new];
        _desLb.textColor =[UIColor lightGrayColor];
        _desLb.numberOfLines = 2;
        [self.contentView addSubview:_desLb];
        [_desLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.heroImg1.mas_bottom).mas_equalTo(5);
            make.bottom.mas_equalTo(-5);
            make.leftMargin.mas_equalTo(self.titleLb.mas_leftMargin);
            make.right.mas_equalTo(-10);
            
        }];
    }
    return _desLb;
}
-(TRImageView *)heroImg1{
    if (!_heroImg1) {
        _heroImg1 =[[TRImageView alloc]init];
        [self.contentView addSubview:_heroImg1];
        [_heroImg1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(45, 45));
            make.top.mas_equalTo(self.titleLb.mas_bottom).mas_equalTo(8);
            make.left.mas_equalTo(kSpeartor);
           
        }];
    }
    return _heroImg1;
}
-(TRImageView *)heroImg2{
    if (!_heroImg2) {
        _heroImg2 =[[TRImageView alloc]init];
        [self.contentView addSubview:_heroImg2];
        [_heroImg2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(45, 45));
            make.centerY.mas_equalTo(self.heroImg1);
           // make.topMargin.mas_equalTo(self.heroImg1.mas_topMargin);
            make.left.mas_equalTo(self.heroImg1.mas_right).mas_equalTo(kSpeartor);
            
        }];
    }
    return _heroImg2;

}
-(TRImageView *)heroImg3{
    if (!_heroImg3) {
        _heroImg3 =[TRImageView new];
        [self.contentView addSubview:_heroImg3];
        [_heroImg3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.heroImg2.mas_right).mas_equalTo(kSpeartor);
            make.centerY.mas_equalTo(self.heroImg1);
            make.size.mas_equalTo(CGSizeMake(45, 45));
        }];
    }
    return _heroImg3;
}
-(TRImageView *)heroImg4{
    if (!_heroImg4) {
        _heroImg4=[TRImageView new];
        [self.contentView addSubview:_heroImg4];
        [_heroImg4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.heroImg3.mas_right).mas_equalTo(kSpeartor);
            make.centerY.mas_equalTo(self.heroImg1);
            make.size.mas_equalTo(CGSizeMake(45, 45));
        }];
    }
    return _heroImg4;
}
-(TRImageView *)heroImg5{
    if (!_heroImg5) {
        _heroImg5 =[TRImageView new];
        [self.contentView addSubview:_heroImg5];
        [_heroImg5 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.heroImg4.mas_right).mas_equalTo(kSpeartor);
            make.centerY.mas_equalTo(self.heroImg1);
            make.size.mas_equalTo(CGSizeMake(45, 45));
        }];
    }
    return _heroImg5;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self =[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIView *view =[UIView new];
        view.backgroundColor =kRGBColor(254, 249, 236);
        self.selectedBackgroundView = view;
    }
    return self;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
