//
//  UIView+Extension.h
//  YJFShow
//
//  Created by 胡庚伟 on 2020/12/16.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)

/**
 *  X
 */
@property (nonatomic, assign)CGFloat x;

/**
 *  Y
 */
@property (nonatomic, assign)CGFloat y;

@property (nonatomic, assign)CGFloat centerX;

@property (nonatomic, assign)CGFloat centerY;

/**
 *  view width
 */
@property (nonatomic, assign)CGFloat width;

/**
 *  view height
 */
@property (nonatomic, assign)CGFloat height;

/**
 *  view size
 */
@property (nonatomic, assign)CGSize size;

/**
 *  view origin
 */
@property (nonatomic, assign)CGPoint origin;


- (void)removeSubviewWithTag:(NSInteger)tag;

- (UIView *)subviewWithTag:(NSInteger)tag;

@end


@interface UIView (RotationAnimation)

/**
 *  开始旋转动画
 */
- (void)startRotationAnimation:(id)delegate;


/**
 *  停止旋转动画
 */
- (void)stopRotationAnimation;

@end
