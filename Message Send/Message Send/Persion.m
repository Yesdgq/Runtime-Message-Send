//
//  Persion.m
//  Message Send
//
//  Created by yesdgq on 2018/12/23.
//  Copyright © 2018 yesdgq. All rights reserved.
//

#import "Persion.h"
#import <objc/runtime.h>
#import "SpareWheel.h"

@implementation Persion


void sendMessage(id self, SEL _cmd, NSString *msg) {
    NSLog(@"----%@", msg);
}


/*
 * 👇👇动态方法解析
 * 添加一个方法实现
 */
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    // 匹配方法
    //    NSString *methodName = NSStringFromSelector(sel);
    //    if ([methodName isEqualToString:@"sendMessage:"]) {
    //        return class_addMethod(self, sel, (IMP)sendMessage, "v@:@"); //  v:void @:id类型 ::方法编号
    //    }
    return NO;
}

/*
 * 👇👇快速转发
 * 找备用的接收者
 * 返回id类型
 */

- (id)forwardingTargetForSelector:(SEL)aSelector {
    // 匹配方法
    //    NSString *methodName = NSStringFromSelector(aSelector);
    //    if ([methodName isEqualToString:@"sendMessage:"]) {
    //        return [SpareWheel new];
    //    }
    // 如果接收者没有实现，接着走默认的继承树
    return [super forwardingTargetForSelector:aSelector];
}


/*
 * 👇👇慢速转发
 * 1、方法签名
 * 2、消息转发
 */
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSString *methodName = NSStringFromSelector(aSelector);
    if ([methodName isEqualToString:@"sendMessage:"]) {
        // 把有关这个方法的签名信息保存起来
        return [NSMethodSignature signatureWithObjCTypes:"v@:@"];
    }
    return [super methodSignatureForSelector:aSelector]; // 如果没有处理就走继承树
}

// 所有的方法签名的信息会保存到NSInvocation中
- (void)forwardInvocation:(NSInvocation *)anInvocation {
//    SEL sel = [anInvocation selector]; // 获得对应的方法编号
//    SpareWheel *tempObj = [SpareWheel new]; // 找个方法处理者
//    if ([tempObj respondsToSelector:sel]) {
//        [anInvocation invokeWithTarget:tempObj]; // 找个方法处理者
//    } else {
//        [super forwardInvocation:anInvocation]; // 如果没有就走继承树
//    }
    [super forwardInvocation:anInvocation]; // 如果没有就走继承树
}

- (void)doesNotRecognizeSelector:(SEL)aSelector {
    NSLog(@"----找不到方法%@", NSStringFromSelector(aSelector));
}

@end
