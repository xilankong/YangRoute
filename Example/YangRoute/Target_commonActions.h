//
//  Target_commonActions.h
//  YangRoute
//
//  Created by yanghuang on 17/3/2.
//  Copyright © 2017年 com.yang. All rights reserved.
//
#import <YangRoute/YangTarget.h>

@interface Target_commonActions: YangTarget

- (void)action_pushViewController:(UIViewController *)viewController params:(NSDictionary *)params completed:(YangRouteCompletedHandle)completedHandler;

- (void)action_pushToWebViewController:(NSDictionary *)params completed:(YangRouteCompletedHandle)completedHandler;

@end
