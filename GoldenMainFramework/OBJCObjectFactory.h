//
//  OBJCObjectFactory.h
//  GoldenMainFramework
//
//  Created by XINGYAN on 16/11/29.
//  Copyright © 2016年 goldensoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OBJCObjectFactory : NSObject

/**
 Instantiates the specified class, which must
 descend (dircectly or indirectly) from NSObject.
 Uses the class's parameterless initializer.
 */
+ (id)create:(NSString *)className;

/**
 Instantiates the specified class, which must
 descend (dircectly or indirectly) from NSObject.
 Uses the specified initializer, passing it the
 argument provided via the `argument` parameter.
 */
+ (id)create:(NSString *)className
 initializer:(SEL)initializer
    argument:(id)argument;

@end
