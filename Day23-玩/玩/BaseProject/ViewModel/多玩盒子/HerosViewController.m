//
//  HerosViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HerosViewController.h"

@interface HerosViewController ()

@end

@implementation HerosViewController
-(instancetype)init{
    if (self =[super init]) {
        self.title = @"英雄";
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addMenuItemToVC:self];
   
    
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
