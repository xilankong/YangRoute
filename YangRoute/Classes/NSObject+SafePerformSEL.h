//
//  NSObject+SafePerformSEL.h
//  YangRoute
//
//  Created by yanghuang on 17/3/2.
//  Copyright © 2017年 com.yang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (SafePerformSEL)

- (id)yang_performSelector:(SEL)selector withObject:(id)object;

- (id)yang_performSelector:(SEL)selector withObjects:(id)object,...;

- (id)yang_performSelector:(SEL)aSelector withObject:(id)object1 withObject:(id)object2;

- (id)yang_performSelector:(SEL)selector withObjects:(id)object orVAList:(va_list)args hasArgument:(BOOL)hasArguments ;

@end
