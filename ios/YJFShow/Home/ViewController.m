//
//  ViewController.m
//  YJFShow
//
//  Created by 胡庚伟 on 2020/12/15.
//

#import "ViewController.h"

#import <HDTAdSDK/YJFNoEntranceWebAd.h>
#import <AppTrackingTransparency/AppTrackingTransparency.h>
#import <AdSupport/AdSupport.h>

@interface ViewController ()
@property (strong, nonatomic) UIImageView *bannerView;
@property (strong, nonatomic) UIImageView *iconView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
}

#pragma mark-- action
- (void)bannerAction
{
    [[[YJFAd alloc] init] loadAdAndShow:@"8130" viewController:self];
}

- (void)iconAction
{
    [[[YJFAd alloc] init] loadAdAndShow:@"8120" viewController:self];
}

#pragma mark-- setup
- (void)setupViews {
    
    UIImage *image = [[UIImage imageNamed:@"home_bg"] resizableImageWithCapInsets:UIEdgeInsetsMake(kScale(10), kScale(70), self.view.height-kScale(70), kScale(10)) resizingMode:UIImageResizingModeStretch];
    self.view.layer.contents = (id) image.CGImage;
    
    [self.view addSubview:self.bannerView];
    [self.bannerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(kScale(70));
        make.left.right.equalTo(self.view).inset(kScale(10));
        make.height.offset(kScale(111));
    }];
    
    [self.view addSubview:self.iconView];
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view).inset(kScale(100)+YJFSafeAreaBottomHeight());
        make.right.equalTo(self.view).inset(kScale(10));
        make.height.width.offset(kScale(50));
    }];
    
}

#pragma mark-- getter method
- (UIImageView *)bannerView
{
    if (!_bannerView) {
        _bannerView = [[UIImageView alloc] init];
        _bannerView.userInteractionEnabled = YES;
        _bannerView.image = [UIImage imageNamed:@"home_banner"];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bannerAction)];
        [_bannerView addGestureRecognizer:tap];
    }
    return _bannerView;
}

- (UIImageView *)iconView
{
    if (!_iconView) {
        _iconView = [[UIImageView alloc] init];
        _iconView.userInteractionEnabled = YES;
        _iconView.image = [UIImage imageNamed:@"home_icon"];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(iconAction)];
        [_iconView addGestureRecognizer:tap];
    }
    return _iconView;
}

@end
