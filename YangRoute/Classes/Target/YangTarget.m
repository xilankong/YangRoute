//
//  YangTarget.m
//  YangRoute
//
//  Created by yanghuang on 17/3/2.
//  Copyright © 2017年 com.yang. All rights reserved.
//

#import "YangTarget.h"

@implementation YangTarget

//所有target 需要做的中间层处理方法
- (id)action_common_action:(NSDictionary *)routeParams completed:(YangRouteCompletedHandle)completion {
    NSAssert(NO, @"action not found.");
    return nil;
}

//定义当我们target中目标方法找不到的时候调用
- (void)notFound:(id)params{
    NSAssert(NO, @"method not found.");
}


@end
