//
//  YangViewController.m
//  YangRoute
//
//  Created by xilankong on 03/30/2018.
//  Copyright (c) 2018 xilankong. All rights reserved.
//
#import <YangRoute/YangRoute.h>
#import "YangViewController.h"

@interface YangViewController ()

@end

@implementation YangViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:btn];
    btn.frame = CGRectMake(50, 100, 100, 30);
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn setTitle:@"Local_Jump" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(localJump) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:btn2];
    btn2.frame = CGRectMake(50, 200, 100, 30);
    [btn2 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn2 setTitle:@"H5_Jump" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(h5Jump) forControlEvents:UIControlEventTouchUpInside];
}

- (void)localJump {
    [[YangRoute shareRoute]performActionWithRouteParams:@{@"routeId":@"10001",@"routeParams":@{@"vcName":@"ViewControllerWeb"}} completion:^(id error, id callBackObject) {
        if(!error) {
            NSLog(@"跳转成功");
        }
    }];
}
- (void)h5Jump {
    [[YangRoute shareRoute]performActionWithRouteParams:@{@"routeId":@"10002",@"routeParams":@{}} completion:^(id error, id callBackObject) {
        if(!error) {
            NSLog(@"跳转成功");
        }
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
