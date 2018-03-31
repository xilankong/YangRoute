//
//  YangTarget.h
//  YangRoute
//
//  Created by yanghuang on 17/3/2.
//  Copyright © 2017年 com.yang. All rights reserved.
//

#import "YangRoute.h"
#import <Foundation/Foundation.h>

@interface YangTarget : NSObject


- (id)action_common_action:(NSDictionary *)routeParams completed:(YangRouteCompletedHandle)completion;

- (void)notFound:(id)params;

@end
