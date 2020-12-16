//
//  UIView+Extension.m
//  YJFShow
//
//  Created by 胡庚伟 on 2020/12/16.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)

- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGFloat)width {
    return self.size.width;
}

- (void)setWidth:(CGFloat)width {
    CGSize size = self.size;
    size.width = width;
    self.size = size;
}

- (CGFloat)height {
    return self.size.height;
}

- (void)setHeight:(CGFloat)height {
    CGSize size = self.size;
    size.height = height;
    self.size = size;
}


- (CGFloat)x {
    return self.origin.x;
}

- (void)setX:(CGFloat)x {
    CGPoint origin = self.origin;
    origin.x = x;
    self.origin = origin;
}

- (CGFloat)y {
    return self.origin.y;
}

- (void)setY:(CGFloat)y {
    CGPoint origin  = self.origin;
    origin.y = y;
    self.origin = origin;
}

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX {
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY {
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}


- (void)removeSubviewWithTag:(NSInteger)tag
{
    for (UIView *subview in [self subviews]) {
        if (subview.tag == tag) {
            [subview removeFromSuperview];
            break;
        }
    }
}


- (UIView *)subviewWithTag:(NSInteger)tag
{
    for (UIView *subview in [self subviews]) {
        if (subview.tag == tag) {
            return subview;
        }
    }
    
    return nil;
}
@end


@implementation UIView (RotationAnimation)

- (void)startRotationAnimation:(id)delegate
{
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat:1 * M_PI * 2.0];
    rotationAnimation.duration = 1.0;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = MAXFLOAT;
    rotationAnimation.delegate = delegate;
    [self.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

- (void)stopRotationAnimation
{
    [self.layer removeAnimationForKey:@"rotationAnimation"];
}

@end
