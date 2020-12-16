//
//  ViewController.m
//  YJFShow
//
//  Created by 胡庚伟 on 2020/12/15.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
}

#pragma mark-- setup
- (void)setupViews {
    // 隐藏导航栏
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
    UIImage *image = [[UIImage imageNamed:@"home_bg"] resizableImageWithCapInsets:UIEdgeInsetsMake(kScale(10), kScale(70), self.view.height-kScale(70), kScale(10)) resizingMode:UIImageResizingModeStretch];
    self.view.layer.contents = (id) image.CGImage;
}

@end
