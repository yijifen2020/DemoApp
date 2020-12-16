//
//  YJFMainRootViewController.h
//  YJFShow
//
//  Created by 胡庚伟 on 2020/12/16.
//

#import <UIKit/UIKit.h>

#import <CYLTabBarController/CYLTabBarController.h>

NS_ASSUME_NONNULL_BEGIN

@interface YJFMainRootViewController : UINavigationController
- (CYLTabBarController *)createNewTabBarWithContext:(nullable NSString *)context;
@end

NS_ASSUME_NONNULL_END
