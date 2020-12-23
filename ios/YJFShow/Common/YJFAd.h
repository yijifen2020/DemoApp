//
//  YJFAd.h
//  YJFShow
//
//  Created by 胡庚伟 on 2020/12/16.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YJFAd : NSObject
- (void)loadAdAndShow:(NSString *)placementId viewController:(UIViewController *)controller;
@end

NS_ASSUME_NONNULL_END
