//
//  YangRoute+CommonActions.h
//  Pods-YangRoute_Example
//
//  Created by yanghuang on 2018/3/31.
//

#import <YangRoute/YangRoute.h>

@interface YangRoute (CommonActions)

- (void)yangRoute_pushViewController:(UIViewController *)viewController params:(NSDictionary *)params completed:(YangRouteCompletedHandle)completedHandler;

- (void)yangRoute_pushToWebViewController:(NSDictionary *)params completed:(YangRouteCompletedHandle)completedHandler;

@end
