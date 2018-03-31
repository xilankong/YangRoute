//
//  YangRoute.h
//  YangRoute
//
//  Created by yanghuang on 17/3/2.
//  Copyright © 2017年 com.yang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Jockey.h"

typedef void (^YangRouteCompletedHandle) (id error,id callBackObject);

@interface YangRoute : NSObject


+ (YangRoute *)shareRoute;

- (void)performActionWithRouteParams:(NSDictionary *)routeParams completion:(YangRouteCompletedHandle)completion;

- (id)performTarget:(NSString *)targetString action:(NSString *)actionString;

- (id)performTarget:(NSString *)targetString action:(NSString *)actionString withObjects:(id)object,...;


@end
