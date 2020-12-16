//
//  YJFMainRootViewController.m
//  YJFShow
//
//  Created by 胡庚伟 on 2020/12/16.
//

#import "YJFMainRootViewController.h"

#import "MainTabBarController.h"

@interface YJFMainRootViewController ()

@end

@implementation YJFMainRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBarHidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    [self createNewTabBar];
}

- (CYLTabBarController *)createNewTabBar {
    return [self createNewTabBarWithContext:nil];
}

- (CYLTabBarController *)createNewTabBarWithContext:(nullable NSString *)context {
    MainTabBarController *tabBarController = [[MainTabBarController alloc] initWithContext:context];
    self.viewControllers = @[tabBarController];
    return tabBarController;
}

@end
