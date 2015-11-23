//
//  SearchViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchDetailViewController.h"
@interface SearchViewController ()<UIWebViewDelegate>
@property (nonatomic,strong)UIWebView *webView;

@end

@implementation SearchViewController
-(instancetype)init{
    if (self =[super init]) {
       self.title =@"召唤师查询";
    }
    return self;
}
//http://lolbox.duowan.com/phone/playerSearchNew.php?lolboxAction=toInternalWebView

-(UIWebView *)webView{
    if (!_webView) {
        _webView =[UIWebView new];
        _webView.delegate =self;
        
        [self.view addSubview:_webView];
        [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        
    }
    return _webView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addMenuItemToVC:self];
    self.view.backgroundColor =[UIColor whiteColor];
    NSString *path =@"http://lolbox.duowan.com/phone/playerSearchNew.php?lolboxAction=toInternalWebView";
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:path]]];
}
//返会NO 则不会加载请求
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    //点击web中的任意一项，跳转到下一页
   // NSLog(@"url: %@",request.URL.absoluteString);
    //如果当前的web加载的请求不是当前页面的，
      NSString *path =@"http://lolbox.duowan.com/phone/playerSearchNew.php?lolboxAction=toInternalWebView";
    if (![request.URL.absoluteString isEqualToString:path]) {
        SearchDetailViewController *vc =[[SearchDetailViewController  alloc]initWithRequest:request];
        [self.navigationController pushViewController:vc animated:YES];
        return  NO;

    }
       return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView{
    [self showProgress];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self hideProgress];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error{
    [self hideProgress];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
