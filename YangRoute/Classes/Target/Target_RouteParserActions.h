//
//  Target_URLParseActions.h
//  YangRoute
//
//  Created by yanghuang on 17/3/2.
//  Copyright © 2017年 com.yang. All rights reserved.
//

#import "YangTarget.h"

/**
 {
     routeId: "10001",
     routeParams: {
         needLogin: "0",
         closeWebView: "0"
     }
 }
 
 */

@interface Target_RouteParserActions: YangTarget

- (void)action_yangRouteID_10001_Action:(NSDictionary *)params completed:(YangRouteCompletedHandle)completedHandler;


/**
 webView跳转

 @param params 参数
 @param completedHandler 回调
 */
- (void)action_yangRouteID_10002_Action:(NSDictionary *)params completed:(YangRouteCompletedHandle)completedHandler;

@end
