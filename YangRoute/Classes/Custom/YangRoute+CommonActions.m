//
//  YangRoute+CommonActions.m
//  Pods-YangRoute_Example
//
//  Created by yanghuang on 2018/3/31.
//

#import "YangRoute+CommonActions.h"

NSString * const _kRouterTargetCommonAction = @"commonActions";

@implementation YangRoute (CommonActions)

- (void)yangRoute_pushViewController:(UIViewController *)viewController params:(NSDictionary *)params completed:(YangRouteCompletedHandle)completedHandler {
    [self performTarget:_kRouterTargetCommonAction action:@"pushViewController:params:completed:" withObjects:viewController,params,completedHandler];
}

- (void)yangRoute_pushToWebViewController:(NSDictionary *)params completed:(YangRouteCompletedHandle)completedHandler {
    [self performTarget:_kRouterTargetCommonAction action:@"pushToWebViewController:completed:" withObjects:params,completedHandler];
}
@end
