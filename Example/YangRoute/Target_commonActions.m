//
//  Target_commonActions.m
//  YangRoute
//  通用跳转，协议实现
//  Created by yanghuang on 17/3/2.
//  Copyright © 2017年 com.yang. All rights reserved.
//

#import "Target_commonActions.h"
#import "YangAppDelegate.h"
#import "ViewControllerWeb.h"

@implementation Target_commonActions


- (void)action_pushViewController:(UIViewController *)viewController params:(NSDictionary *)params completed:(YangRouteCompletedHandle)completedHandler {
    [_UI pushViewController:viewController animated:true];
}

- (void)action_pushToWebViewController:(NSDictionary *)params completed:(YangRouteCompletedHandle)completedHandler {
    [_UI pushViewController:[[ViewControllerWeb alloc]init] animated:true];
}

@end
