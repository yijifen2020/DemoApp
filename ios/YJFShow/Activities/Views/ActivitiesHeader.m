//
//  ActivitiesHeader.m
//  YJFShow
//
//  Created by 胡庚伟 on 2020/12/16.
//

#import "ActivitiesHeader.h"

@interface ActivitiesHeader ()
@property (nonatomic, strong) UILabel *titleLabel;
@end

@implementation ActivitiesHeader
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setTitle:(NSString *)title
{
    _title = title;
    self.titleLabel.text = title;
}

#pragma mark-- setup
- (void)setupViews
{
    [self addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.centerY.equalTo(self).offset(-3);
    }];
}

#pragma mark-- getter method
- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = kColor(0x000000);
        _titleLabel.font = kFontHeavy(17);
    }
    return _titleLabel;
}

@end
