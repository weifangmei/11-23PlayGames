//
//  MusicDetailCell.m
//  BaseProject
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "MusicDetailCell.h"
@interface MusicDetailCell()
/** 播放标志图*/


@end
@implementation MusicDetailCell

-(TRImageView *)coverIV{
    if (!_coverIV) {
        _coverIV=[[TRImageView alloc]init];
        [self.contentView addSubview:_coverIV];
        [_coverIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(55, 55));
            make.left.mas_equalTo(10);
        }];
        //变圆
        _coverIV.layer.cornerRadius = 55/2;
        
        UIImageView *playIV =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"find_album_play"]];
        [_coverIV addSubview:playIV];
        [playIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(25, 25));
            make.center.mas_equalTo(0);
        }];
    
    }
    return _coverIV;
}
-(UILabel *)titleLb{
    if (!_titleLb) {
        _titleLb =[UILabel new];
               [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.coverIV.mas_right).mas_equalTo(10);
            make.top.mas_equalTo(10);
            make.right.mas_equalTo(self.timeLb.mas_left).mas_equalTo(-10);
        }];
        _titleLb.numberOfLines = 0;

    }
    return _titleLb;
}
-(UILabel *)timeLb{
    if (!_timeLb) {
        _timeLb =[UILabel new];
        [self.contentView addSubview:_timeLb];
        _timeLb.font =[UIFont systemFontOfSize:12];
        _timeLb.textColor =[UIColor lightGrayColor];
        [_timeLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.width.mas_equalTo(50);
        }];
        _timeLb.textAlignment =NSTextAlignmentRight;
    }
    return _timeLb;
}
-(UILabel *)sourceLb{
    if (!_sourceLb) {
        _sourceLb=[UILabel new];
        [self.contentView addSubview:_sourceLb];
        [_sourceLb mas_makeConstraints:^(MASConstraintMaker *make) {
             make.leftMargin.mas_equalTo(self.titleLb.mas_leftMargin);
            make.top.mas_equalTo(self.titleLb.mas_bottom).mas_equalTo(4);
            make.rightMargin.mas_equalTo(self.titleLb.mas_rightMargin);
        }];
        _sourceLb.font =[UIFont systemFontOfSize:15];
        _sourceLb.textColor =[UIColor lightGrayColor];
    }
    return _sourceLb;
}
-(UILabel *)playCountLb{
    if (!_playCountLb) {
        _playCountLb =[UILabel new];
        [self.contentView addSubview:_playCountLb];
        UIImageView *imageView =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sound_play"]];
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(20, 20));
            make.leftMargin.mas_equalTo(self.sourceLb.mas_leftMargin);
            make.bottom.mas_equalTo(-10);
            make.top.mas_equalTo(self.sourceLb.mas_bottom).mas_equalTo(8);
        }];
        
        [_playCountLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(imageView.mas_right).mas_equalTo(3);
            make.centerY.mas_equalTo(imageView);
        }];
        _playCountLb.textColor =[UIColor lightGrayColor];
        _playCountLb.font =[UIFont systemFontOfSize:12];
    
    }
    return _playCountLb;
}
-(UILabel *)favorCountLb{
    if (!_favorCountLb) {
        _favorCountLb=[UILabel new];
        [self.contentView addSubview:_favorCountLb];
        UIImageView *imageView =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sound_likes_n"]];
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.playCountLb);
            make.left.mas_equalTo(self.playCountLb.mas_right).mas_equalTo(8);
            make.size.mas_equalTo(CGSizeMake(35/2, 35/2));
        }];
        [_favorCountLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(imageView.mas_right).mas_equalTo(3);
            make.centerY.mas_equalTo(imageView);
        }];
        _favorCountLb.font =[UIFont systemFontOfSize:12];
        _favorCountLb.textColor=[UIColor lightGrayColor];
        
    }
    return _favorCountLb;
}
-(UILabel *)commentCountLb{
    if (!_commentCountLb) {
        _commentCountLb =[UILabel new];
        [self.contentView addSubview:_commentCountLb];
        UIImageView *iamgeView =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sound_comments"]];
        [self.contentView addSubview:iamgeView];
        [iamgeView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(18, 18));
            make.centerY.mas_equalTo(self.favorCountLb);
            make.left.mas_equalTo(self.favorCountLb.mas_right).mas_equalTo(8);
        }];
        [_commentCountLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(iamgeView);
            make.left.mas_equalTo(iamgeView.mas_right).mas_equalTo(3);
        }];
        _commentCountLb.font =[UIFont systemFontOfSize:12];
        _commentCountLb.textColor =[UIColor lightGrayColor];
    }
    return _commentCountLb;
}
-(UILabel *)durationLb{
    if (!_durationLb) {
        _durationLb =[UILabel new];
        [self.contentView addSubview:_durationLb];
        UIImageView *imageView =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sound_duration"]];
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.commentCountLb);
            make.left.mas_equalTo(self.commentCountLb.mas_right).mas_equalTo(8);
            make.size.mas_equalTo(CGSizeMake(18, 18));
        }];
        [_durationLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(imageView);
            make.left.mas_equalTo(imageView.mas_right).mas_equalTo(3);
            
        }];
        _durationLb.font =[UIFont systemFontOfSize:12];
        _durationLb.textColor =[UIColor lightGrayColor];
        
    }
    return _durationLb;
}
-(UIButton *)dowmLoadBtn{
    if (!_dowmLoadBtn) {
        _dowmLoadBtn =[UIButton buttonWithType:0];
        [_dowmLoadBtn setBackgroundImage:[UIImage imageNamed:@"cell_download"] forState:0];
        
        [_dowmLoadBtn bk_addEventHandler:^(id sender) {
            DDLogVerbose(@"按钮被点击了");
        } forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_dowmLoadBtn];
        
        [_dowmLoadBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.right.mas_equalTo(-10);
            make.size.mas_equalTo(CGSizeMake(30, 30));
        }];
    }
    return _dowmLoadBtn;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self =[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.dowmLoadBtn.hidden = NO;
        
    //设置cell被选中的背景色
        UIView *view =[UIView new];
        view.backgroundColor =kRGBColor(243, 255, 254);
        self.selectedBackgroundView = view;
    //分割线距离的左侧空间
        self.separatorInset =UIEdgeInsetsMake(0, 76, 0, 0);
    }
    return  self;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
