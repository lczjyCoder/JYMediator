//
//  JYMediator.m
//  JYMediator
//
//  Created by zjy on 2017/2/8.
//  Copyright © 2017年 personal. All rights reserved.
//

#import "JYMediator.h"

#define Return_PerformTarget(a,b) \
UIViewController *viewController = [self performTarget:a action:b params:params];\
if ([viewController isKindOfClass:[UIViewController class]]) {\
return viewController;\
} else {\
return [[UIViewController alloc] init];\
}\

@implementation JYMediator

+ (instancetype)shareMediator {
    static dispatch_once_t onceToken;
    static JYMediator *_sharedMediator = nil;
    dispatch_once(&onceToken, ^{
        _sharedMediator = [[self alloc] init];
    });
    return _sharedMediator;
}

- (UIViewController *)JYMediator_AComponent:(NSDictionary *)params {
    params = @{@"componentName":@"AComponent"};
    Return_PerformTarget(@"A", @"AComponent");
}

- (UIViewController *)JYMediator_BComponent:(NSDictionary *)params {
    params = @{@"componentName":@"BComponent"};
    Return_PerformTarget(@"B", @"BComponent");
}

- (id)performTarget:(NSString *)targetStr action:(NSString *)actionStr params:(NSDictionary *)params{
    NSString *targetName = [NSString stringWithFormat:@"Target_%@",targetStr];
    NSString *actionName = [NSString stringWithFormat:@"Action_%@:",actionStr];
    Class cls = NSClassFromString(targetName);
    id target = [[cls alloc] init];
    SEL action = NSSelectorFromString(actionName);
    if ([target respondsToSelector:action]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        return [target performSelector:action withObject:params];
#pragma clang diagnostic pop
    } else {
        UIViewController *vc = [[UIViewController alloc] init];
        vc.view.backgroundColor = [UIColor whiteColor];
        vc.title = @"跳转错误";
        return vc;
    }
}

@end
