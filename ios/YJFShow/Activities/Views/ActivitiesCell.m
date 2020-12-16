//
//  ActivitiesCell.m
//  YJFShow
//
//  Created by 胡庚伟 on 2020/12/16.
//

#import "ActivitiesCell.h"
#import "ActivitiesModel.h"

@interface ActivitiesCell ()
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation ActivitiesCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)configWithData:(ActivitiesModel *)model
{
    if (!model) { return; }
    self.imageView.image = [UIImage imageNamed:model.poster];
}

#pragma mark-- setup
- (void)setupViews
{
    [self.contentView addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
}

#pragma mark-- gettet method
- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
    }
    return _imageView;
}

@end
