//
//  Target_URLParseActions.m
//  YangRoute
//  协议跳转
//  Created by yanghuang on 17/3/2.
//  Copyright © 2017年 com.yang. All rights reserved.
//

#import "NSObject+SafePerformSEL.h"
#import "Target_RouteParserActions.h"
#import "YangRoute+CommonActions.h"

@implementation Target_RouteParserActions

- (id)action_common_action:(id)routeParams completed:(YangRouteCompletedHandle)completion {
    
    id routeId = [routeParams objectForKey:@"routeId"];
    
    NSString *actionSelStrWithCallback = [NSString stringWithFormat:@"action_yangRouteID_%@_Action:completed:",routeId];
    
    NSDictionary *params = [routeParams objectForKey:@"routeParams"];
    
//    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:params];
//    NSString *closeWebView = [routeParams objectForKey:@"closeWebView"];
//    [dict setObject:closeWebView ? : @"" forKey:@"closeWebView"];
    
    //登录判断
    BOOL needLogin = [params objectForKey:@"needLogin"]?[[params objectForKey:@"needLogin"] boolValue]:NO;
    if (needLogin) {

    } else {
        SEL selWithCallBack = NSSelectorFromString(actionSelStrWithCallback);
        if ([self respondsToSelector:selWithCallBack]){
            return [self yang_performSelector:selWithCallBack withObject:params withObject:completion];
        }
    }
    return nil;
}

- (void)action_yangRouteID_10001_Action:(NSDictionary *)params completed:(YangRouteCompletedHandle)completedHandler {
    NSString *targetClassString = [params objectForKey:@"vcName"];
    
    Class targetClass = NSClassFromString(targetClassString);
    id target = [[targetClass alloc] init];
    if ([target isKindOfClass:[UIViewController class]]) {
        [[YangRoute shareRoute]yangRoute_pushViewController:(UIViewController *)target params:params completed:completedHandler];
    }
}

- (void)action_yangRouteID_10002_Action:(NSDictionary *)params completed:(YangRouteCompletedHandle)completedHandler {
    [[YangRoute shareRoute]yangRoute_pushToWebViewController:params completed:completedHandler];
}
@end
