//
//  Target_B.m
//  JYMediator
//
//  Created by zjy on 2017/2/9.
//  Copyright © 2017年 personal. All rights reserved.
//

#import "Target_B.h"
#import "BComponent.h"
#import <objc/runtime.h>

#define ActionDefine(vcName) \
- (UIViewController *)Action_##vcName:(NSDictionary *)params {\
vcName *viewController = [[vcName alloc] init];\
objc_setAssociatedObject(viewController, @"postParams", params, OBJC_ASSOCIATION_RETAIN);\
return viewController;\
}\

@implementation Target_B
ActionDefine(BComponent)
@end
