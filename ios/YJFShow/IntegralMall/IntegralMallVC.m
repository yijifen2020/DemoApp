//
//  IntegralMallVC.m
//  YJFShow
//
//  Created by 胡庚伟 on 2020/12/16.
//

#import "IntegralMallVC.h"

#import <HDTAdSDK/YJFEmbeddedWebAd.h>
#import <AppTrackingTransparency/AppTrackingTransparency.h>
#import <AdSupport/AdSupport.h>

@interface IntegralMallVC ()<YJFEmbeddedWebAdDelegate>
@property (nonatomic, strong) YJFEmbeddedWebAd *embeddedWebAd;
@end

@implementation IntegralMallVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.embeddedWebAd = [[YJFEmbeddedWebAd alloc] initWithPlacementId:@"100012"];
    self.embeddedWebAd.delegate = self;
    self.embeddedWebAd.userId = @"1";
    
    if (@available(iOS 14, *)) {
        [ATTrackingManager requestTrackingAuthorizationWithCompletionHandler:^(ATTrackingManagerAuthorizationStatus status) {
            UIViewController *subController = [self.embeddedWebAd loadAd];
            subController.view.frame = self.view.bounds;
            [self.view addSubview:subController.view];
            [self addChildViewController:subController];
        }];
    } else {
        UIViewController *subController = [self.embeddedWebAd loadAd];
        subController.view.frame = self.view.bounds;
        [self.view addSubview:subController.view];
        [self addChildViewController:subController];
    }
}

#pragma mark-- delegate

/// 数据加载成功
/// @param embeddedWebAd 广告实例
- (void)yjf_embeddedWebAdLoadSuccess:(YJFEmbeddedWebAd *)embeddedWebAd
{
    
}

/// 加载失败
/// @param embeddedWebAd 广告实例
/// @param error 错误信息
- (void)yjf_embeddedWebAdLoadFailure:(YJFEmbeddedWebAd *)embeddedWebAd failureError:(NSError *)error
{
    
}

/// 需要登录
/// @param embeddedWebAd 广告实例
- (void)yjf_embeddedWebAdNeedLogin:(YJFEmbeddedWebAd *)embeddedWebAd
{
    
}

@end
