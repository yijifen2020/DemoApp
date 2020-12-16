//
//  ActivitiesVC.m
//  YJFShow
//
//  Created by 胡庚伟 on 2020/12/16.
//

#import "ActivitiesVC.h"
#import "ActivitiesCell.h"
#import "ActivitiesHeader.h"
#import "ActivitiesModel.h"

@interface ActivitiesVC ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UIImageView *topView;
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *dataSource;
@end

@implementation ActivitiesVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self setupViews];
}

- (void)initData
{
//    activities_0_3
    
    NSString *dataJson = [YJFUtils getJsonDataJsonname:@"Activities"];
    
}

#pragma mark-- delegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ActivitiesCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([ActivitiesCell class]) forIndexPath:indexPath];
    cell.backgroundColor = UIColor.whiteColor;
    [cell configWithData:@{}];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
    
     if (kind == UICollectionElementKindSectionHeader) {
         ActivitiesHeader *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([ActivitiesHeader class]) forIndexPath:indexPath];
         headerView.title = @"轻活动+积分";
         reusableview = headerView;
     }
    
    return reusableview;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark-- setup
- (void)setupViews
{
    self.navigationController.navigationBar.translucent = NO;
    
    [self.view addSubview:self.topView];
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.view);
        make.height.mas_equalTo(kScale(118));
    }];
    
    [self.view addSubview:self.bgView];
    self.bgView.frame = CGRectMake(0, kScale(107), kScreenWidth, kScreenHeight-YJFNavigationbarHeight()-kScale(107));
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bgView.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(kScale(15),kScale(15))];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bgView.bounds;
    maskLayer.path = maskPath.CGPath;
    self.bgView.layer.mask = maskLayer;
    
    [self.bgView addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.bgView);
    }];
}

#pragma mark-- getter method
- (UIImageView *)topView
{
    if (!_topView) {
        _topView = [[UIImageView alloc] init];
        _topView.image = [UIImage imageNamed:@"activities_top"];
    }
    return _topView;
}

- (UIView *)bgView
{
    if (!_bgView) {
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = UIColor.whiteColor;
    }
    return _bgView;
}

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(kScale(kScale(170)), kScale(110));
        layout.minimumLineSpacing = kScale(10);
        layout.minimumInteritemSpacing = kScale(10);
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.headerReferenceSize = CGSizeMake(kScreenWidth, kScale(55));
        layout.footerReferenceSize=CGSizeMake(self.view.frame.size.width, 0);
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor = UIColor.whiteColor;
        _collectionView.contentInset = UIEdgeInsetsMake(0, kScale(12), kScale(12), kScale(12));
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        
        [_collectionView registerClass:[ActivitiesHeader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([ActivitiesHeader class])];
        [_collectionView registerClass:[ActivitiesCell class] forCellWithReuseIdentifier:NSStringFromClass([ActivitiesCell class])];
    }
    return _collectionView;
}

@end
