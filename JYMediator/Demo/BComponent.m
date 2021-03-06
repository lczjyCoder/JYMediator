//
//  BComponent.m
//  JYMediator
//
//  Created by zjy on 2017/2/8.
//  Copyright © 2017年 personal. All rights reserved.
//

#import "BComponent.h"
#import "JYMediator.h"
#import <objc/runtime.h>

@interface BComponent ()

@end

@implementation BComponent

- (instancetype)init {
    self = [super init];
    self.str = @"zjy";
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addPushBtn];
    NSString *componentName = [objc_getAssociatedObject(self, @"postParams") valueForKey:@"componentName"];
    self.title = componentName;
}

- (void)addPushBtn {
    UIButton *pushBtn = [[UIButton alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width - 100) / 2, ([UIScreen mainScreen].bounds.size.height - 40) / 2, 100, 40)];
    [pushBtn addTarget:self action:@selector(pushAction:) forControlEvents:UIControlEventTouchUpInside];
    pushBtn.backgroundColor = [UIColor orangeColor];
    [pushBtn setTitle:@"跳转" forState:UIControlStateNormal];
    [self.view addSubview:pushBtn];
}

- (void)pushAction:(UIButton *)sender {
    UIViewController *vc = [[JYMediator shareMediator] JYMediator_AComponent:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
