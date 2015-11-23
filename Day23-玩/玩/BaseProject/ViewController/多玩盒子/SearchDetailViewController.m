//
//  SearchDetailViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "SearchDetailViewController.h"

@interface SearchDetailViewController ()<UIWebViewDelegate>
@property (nonatomic,strong)UIWebView *webView;
@end

@implementation SearchDetailViewController
-(UIWebView *)webView{
    if (!_webView) {
        _webView =[UIWebView  new];
        _webView.delegate =self;
        [self.view addSubview:_webView];
        [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    return _webView;
}

-(id)initWithRequest:(NSURLRequest *)request{
    if (self =[super init]) {
        _request = request;
        /** 推出来不显示下边栏*/
        self.hidesBottomBarWhenPushed = YES;
    }
    return  self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addBackItemToVC:self];
    self.title =@"召唤师详情";
    [self.webView loadRequest:_request];
}
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    if (navigationType != 5) {
        SearchDetailViewController *vc =[[SearchDetailViewController  alloc]initWithRequest:request];
        [self.navigationController pushViewController:vc animated:YES];
        return  NO;
    }

    return  YES;
}
-(void)webViewDidStartLoad:(UIWebView *)webView{
    [self showProgress];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [self hideProgress];
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [self hideProgress];
}

@end
