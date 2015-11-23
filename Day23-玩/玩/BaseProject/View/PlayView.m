//
//  PlayView.m
//  BaseProject
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "PlayView.h"

@implementation PlayView
+(PlayView *)sharedInstance{
    static PlayView *p = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        p =[PlayView new];
    });
    return p;
    
}
-(UIButton *)btn{
    if (!_btn) {
        _btn =[UIButton buttonWithType:0];
        [_btn setBackgroundImage:[UIImage imageNamed:@"btn_record_pause"] forState:UIControlStateNormal];
        [_btn setBackgroundImage:[UIImage imageNamed:@"netsound_play"] forState:UIControlStateSelected];
        [self addSubview:_btn];
        [_btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    
        [_btn bk_addEventHandler:^(UIButton * sender) {
         //selected YES：在播放 NO：暂停
            if (sender.selected) {
                [_player pause];
            }
            else{
                [_player play];
            }
           sender.selected = !sender.selected;
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn;
}
-(instancetype)init{
    if (self =[super init]) {
        //为了调用懒加载
        self.btn.hidden = NO;
       // self.backgroundColor =kRGBColor(77, 77, 77);
    }
    return self;
}

-(void)playWithURL:(NSURL *)musicURL{
    //支持后台播放
    [[AVAudioSession sharedInstance]setCategory:AVAudioSessionCategoryPlayback error:nil];
    [[AVAudioSession sharedInstance]setActive:YES error:nil];
    
    _player =[AVPlayer playerWithURL:musicURL];
    [_player play];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
