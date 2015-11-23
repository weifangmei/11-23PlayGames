//
//  PlayView.h
//  BaseProject
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@interface PlayView : UIView
+(PlayView *)sharedInstance;
//用于播放的那个
@property (nonatomic,strong)AVPlayer *player;
//点击后播放或者暂停
@property (nonatomic,strong)UIButton *btn;

-(void)playWithURL:(NSURL *)musicURL;
@end
