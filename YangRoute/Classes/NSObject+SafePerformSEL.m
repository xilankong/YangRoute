//
//  NSObject+SafePerformSEL.m
//  YangRoute
//
//  Created by yanghuang on 17/3/2.
//  Copyright © 2017年 com.yang. All rights reserved.
//

#import "NSObject+SafePerformSEL.h"

@implementation NSObject (SafePerformSEL)

- (id)yang_performSelector:(SEL)selector withObject:(id)object {
    return [self yang_performSelector:selector withObjects:object orVAList:nil hasArgument:YES];
}

- (id)yang_performSelector:(SEL)aSelector withObject:(id)object1 withObject:(id)object2 {
    if ([self respondsToSelector:aSelector]) {
        return [self yang_performSelector:aSelector withObjects:object1,object2,nil];
    } else {
        
    }
    return nil;
}

- (id)yang_performSelector:(SEL)selector withObjects:(id)object,...{
    va_list args;
    va_start(args, object);
    return [self yang_performSelector:selector withObjects:object orVAList:args hasArgument:YES];
    va_end(args);
}

- (id)yang_performSelector:(SEL)selector withObjects:(id)object orVAList:(va_list)args hasArgument:(BOOL)hasArguments {
    
    NSMethodSignature *signature = [[self class] instanceMethodSignatureForSelector:selector];
    
    if (signature == nil) {
        [NSException raise:@"method not found!" format:@""];
        return nil;
    }
    
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    
    invocation.target = self;
    invocation.selector = selector;
    
    if (hasArguments) {
        
        //算出方法名种带了多少个参数
        NSInteger numberArguments =  NSStringFromSelector(selector).length - [[NSStringFromSelector(selector) stringByReplacingOccurrencesOfString:@":" withString:@""] length];
        NSInteger acc = 1;
        
        [invocation setArgument:&object atIndex:2];//第一个参数设置
        //后续参数设置
        while (YES && numberArguments > acc) {
            id param = va_arg(args, id);
            if (acc <= numberArguments - 1) {
                [invocation setArgument:&param atIndex:2+acc];
            }
            
            acc++;
        }
        [invocation retainArguments];
        
    }
    [invocation invoke];
    
    //确定返回类型
    const char *returnType = signature.methodReturnType;
    __unsafe_unretained id result = nil;
    
    if (!strcmp(returnType, @encode(void))) {
        result = nil;
    } else if(!strcmp(returnType, @encode(id))){
        [invocation getReturnValue:&result];
    } else {
        // NSIngeter BOOL
        NSUInteger length = [signature methodReturnLength];
        void *buffer = (void *)malloc(length);
        [invocation getReturnValue:buffer];
        
        if (!strcmp(returnType, @encode(BOOL))) {
            result = [NSNumber numberWithBool:*((BOOL *)buffer)];
        }else if (!strcmp(returnType, @encode(NSInteger))){
            result = [NSNumber numberWithInteger:*((NSInteger *)buffer)];
        }else{
            result = [NSValue valueWithBytes:buffer objCType:returnType];
        }
        free(buffer);
    }
    return result;
}


@end
