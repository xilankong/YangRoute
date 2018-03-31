//
//  YangAppDelegate.h
//  YangRoute
//
//  Created by xilankong on 03/30/2018.
//  Copyright (c) 2018 xilankong. All rights reserved.
//

@import UIKit;

#define _UI ((YangAppDelegate *)[UIApplication sharedApplication].delegate).navigationController

@interface YangAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, strong) UINavigationController *navigationController;

@end
