//
//  SecViewController.m
//  AdaptationDemo
//
//  Created by tpv tpv on 18/1/5.
//  Copyright © 2018年 xumxum. All rights reserved.
//

#import "SecViewController.h"
#import "Masonry.h"

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

#define KScreenW [UIScreen mainScreen].bounds.size.width
#define KScreenH [UIScreen mainScreen].bounds.size.height

//屏幕
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

#define MAINSIZE_WIDTH ([[UIScreen mainScreen] bounds].size.width/375)
#define MAINSIZE_HEIGHT ([[UIScreen mainScreen] bounds].size.height/667)

#define NAVIGATIONHIGHT self.navigationController.navigationBar.frame.size//导航栏像素
#define STATUSHIGHT [[UIApplication sharedApplication] statusBarFrame].size//状态栏像素
#define TABBARHIGHT self.tabBarController.tabBar.frame.size//标签栏像素


@interface SecViewController ()

@end

@implementation SecViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.view setBackgroundColor:[UIColor greenColor]];
    
//    UIButton * scalBtn = [UIButton buttonWithType:UIButtonTypeSystem];
//    [scalBtn setBackgroundColor:[UIColor blueColor]];
//    scalBtn.frame = CGRectMake(SCREEN_WIDTH/2-23*MAINSIZE_WIDTH, 200*MAINSIZE_HEIGHT, 46*MAINSIZE_WIDTH, 46*MAINSIZE_WIDTH);
//    [self.view addSubview:scalBtn];
    
    
//    UIButton * layoutBtn = [UIButton buttonWithType:UIButtonTypeSystem];
//    [layoutBtn setBackgroundColor:[UIColor blackColor]];
//    [self.view addSubview:layoutBtn];
//    [layoutBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        
//        make.centerX.mas_equalTo(self.view);
//        make.top.mas_equalTo(250);
//        make.width.mas_equalTo(46);
//        make.height.mas_equalTo(46);
//    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
