//
//  OBJCObjectFactory.m
//  GoldenMainFramework
//
//  Created by XINGYAN on 16/11/29.
//  Copyright © 2016年 goldensoft. All rights reserved.
//

#import "OBJCObjectFactory.h"

static id OBJCInitWithArg(id  target,
                          SEL initializer,
                          id  argument)
{
    IMP imp = [target methodForSelector:initializer];
    id (*initFunc)(id, SEL, id) = (void *)imp;
    return initFunc(target, initializer, argument);
}

@implementation OBJCObjectFactory

+ (id)create:(NSString *)className
{
    return [NSClassFromString(className) new];
}

+ (id)create:(NSString *)className
 initializer:(SEL)init
    argument:(id)arg
{
    Class class = NSClassFromString(className);
    return (class && init)
    ? OBJCInitWithArg([class alloc], init, arg)
    : nil;
}

@end
