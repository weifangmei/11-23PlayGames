//
//  XiMaAlbumViewModel.h
//  BaseProject
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "XiMaNetManager.h"
@interface XiMaAlbumViewModel : BaseViewModel
/** 行数*/
@property(nonatomic)NSInteger rowNumber;
/** 专门的初始化方法*/
-(instancetype)initWithAlbumId:(NSInteger)albumId ;
@property(nonatomic)NSInteger albumId;
/** 当前请求的页数*/
@property(nonatomic)NSInteger pageId;
/** 当前的最大页数*/
@property(nonatomic)NSInteger maxPageId;
/** 是否有更多的页数*/
@property(nonatomic,getter=isHasMore)BOOL hasMore;
/** 获取某行的图片URL地址*/
-(NSURL *)coverURLForRow:(NSInteger)row;
/** 获取某行的标题*/
-(NSString *)titleForRow:(NSInteger)row;
/** 获取某行的更新时间*/
-(NSString *)timeForRow:(NSInteger)row;
/** 获取某行的出处*/
-(NSString *)sourceForRow:(NSInteger)row;
/** 获取某行的播放次数*/
-(NSString *)playCountForRow:(NSInteger)row;
/** 获取某行的喜欢数*/
-(NSString *)favoreCountForRow:(NSInteger)row;
/** 获取某行的 评论数*/
-(NSString *)commentCountForRow:(NSInteger)row;
/** 获取某行的播放时长*/
-(NSString *)durationForRow:(NSInteger)row;
/** 获取某行的下载链接地址*/
-(NSURL *)downloadURLForRow:(NSInteger)row;
/** 获取某行的音频地址*/
-(NSURL *)playURLForRow:(NSInteger)row;
@end
