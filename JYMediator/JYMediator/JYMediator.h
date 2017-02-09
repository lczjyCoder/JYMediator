//
//  JYMediator.h
//  JYMediator
//
//  Created by zjy on 2017/2/8.
//  Copyright © 2017年 personal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JYMediator : NSObject
+ (instancetype)shareMediator;
- (UIViewController *)JYMediator_AComponent:(NSDictionary *)params;
- (UIViewController *)JYMediator_BComponent:(NSDictionary *)params;
@end
