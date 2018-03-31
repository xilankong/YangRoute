//
//  YangRoute.m
//  YangRoute
//
//  Created by yanghuang on 17/3/2.
//  Copyright © 2017年 com.yang. All rights reserved.
//

#import "YangRoute.h"
#import "NSObject+SafePerformSEL.h"

@implementation YangRoute

+ (YangRoute *)shareRoute {
    static dispatch_once_t onceToken;
    static YangRoute *route = nil;
    dispatch_once(&onceToken, ^{
        route = [[YangRoute alloc]init];
    });
    return route;
}

/**
  分配-对外方法

 @param routeParams jump结构体，需要于后端约定
 @param completion 回调block
 */

- (void)performActionWithRouteParams:(NSDictionary *)routeParams completion:(YangRouteCompletedHandle)completion {

    if (!routeParams || ![routeParams isKindOfClass:[NSDictionary class]] || [routeParams count] == 0) {
        return;
    }
    
    //推到协议解析分配方法
    [self performTarget:@"RouteParserActions"
                             action:@"common_action:completed:" withObjects:routeParams,completion, nil];

}

/**
  分配-无参数方法

 @param targetString 目标名称
 @param actionString 方法名称
 @return 参数
 */

- (id)performTarget:(NSString *)targetString action:(NSString *)actionString {
    return [self performTarget:targetString action:actionString withObjects:nil];
}

/**
 分配-三点参数方法

 @param targetString 目标名称
 @param actionString 方法名称
 @param object 参数
 @return id
 */

- (id)performTarget:(NSString *)targetString action:(NSString *)actionString withObjects:(id)object,...{
    va_list args;
    va_start(args, object);
    return [self performTarget:targetString action:actionString withObjects:object orVAList:args hasArgument:YES];
    va_end(args);
}



/**
 分配总方法

 @param targetString 目标类名称
 @param actionString 方法名称
 @param object 参数
 @param args 参数
 @param hasArgument 是否带参数
 @return id
 */

- (id)performTarget:(NSString *)targetString action:(NSString *)actionString withObjects:(id)object orVAList:(va_list)args hasArgument:(BOOL)hasArgument{
    
    NSAssert(targetString.length > 0, @"targetString could not be nil");
    NSAssert(actionString.length > 0, @"actionString could not be nil");
    
    NSString *targetClassString = [NSString stringWithFormat:@"Target_%@",targetString];
    NSString *selString = [NSString stringWithFormat:@"action_%@",actionString];
    
    Class targetClass = NSClassFromString(targetClassString);
    id target = [[targetClass alloc]init];
    SEL action = NSSelectorFromString(selString);
    
    if (!target) {
        NSAssert(NO, @"target could not be nil");
        return nil;
    }
    
    if ([target respondsToSelector:action]) {
        //唤起方法
        if (hasArgument) {
            return [target yang_performSelector:action withObjects:object orVAList:args hasArgument:YES];
        } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            return [target performSelector:action];
#pragma clang diagnostic pop
        }
        
    } else {
        SEL action = NSSelectorFromString(@"notFound:");
        if ([target respondsToSelector:action]) {
           return  [target yang_performSelector:action withObject:object];
        } else {
            return nil;
        }
        
    }
    
    return nil;
}

@end
