//
//  YJFUtils.m
//  YJFShow
//
//  Created by 胡庚伟 on 2020/12/16.
//

#import "YJFUtils.h"

#import <sys/utsname.h>


UIWindow * _Nullable YJFNormalWindow(void) {
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal) {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow *temp in windows) {
            if (temp.windowLevel == UIWindowLevelNormal) {
                return temp;
            }
        }
    }
    return window;
}

UIViewController * _Nullable YJFTopController(void) {
    return YJFTopControllerByWindow(YJFNormalWindow());
}

UIViewController * _Nullable YJFTopControllerByWindow(UIWindow *window) {
    if (!window) return nil;
        
    UIViewController *top = nil;
    id nextResponder;
    if (window.subviews.count > 0) {
        UIView *frontView = [window.subviews objectAtIndex:0];
        nextResponder = frontView.nextResponder;
    }
    if (nextResponder && [nextResponder isKindOfClass:UIViewController.class]) {
        top = nextResponder;
    } else {
        top = window.rootViewController;
    }
    
    while ([top isKindOfClass:UITabBarController.class] || [top isKindOfClass:UINavigationController.class] || top.presentedViewController) {
        if ([top isKindOfClass:UITabBarController.class]) {
            top = ((UITabBarController *)top).selectedViewController;
        } else if ([top isKindOfClass:UINavigationController.class]) {
            top = ((UINavigationController *)top).topViewController;
        } else if (top.presentedViewController) {
            top = top.presentedViewController;
        }
    }
    return top;
}

BOOL YJFLowMemory(void) {
    static BOOL lowMemory = NO;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        unsigned long long physicalMemory = [[NSProcessInfo processInfo] physicalMemory];
        lowMemory = physicalMemory > 0 && physicalMemory < 1024 * 1024 * 1500;
    });
    return lowMemory;
}

BOOL YJFIsIphoneXSeries(void) {
    return YJFStatusbarHeight() > 20;
}

CGFloat YJFStatusbarHeight(void) {
    CGFloat height = 0;
    if (@available(iOS 11.0, *)) {
        height = UIApplication.sharedApplication.delegate.window.safeAreaInsets.top;
    }
    if (height <= 0) {
        height = UIApplication.sharedApplication.statusBarFrame.size.height;
    }
    if (height <= 0) {
        height = 20;
    }
    return height;
}

CGFloat YJFSafeAreaBottomHeight(void) {
    CGFloat bottom = 0;
    if (@available(iOS 11.0, *)) {
        bottom = UIApplication.sharedApplication.delegate.window.safeAreaInsets.bottom;
    }
    return bottom;
}

CGFloat YJFNavigationbarHeight(void) {
    return YJFStatusbarHeight() + 44;
}

UIImage *YJFSnapshotView(UIView *view) {
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, YES, [UIScreen mainScreen].scale);
    [view drawViewHierarchyInRect:view.bounds afterScreenUpdates:NO];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

UIEdgeInsets YJFPaddingByBrowserOrientation(UIDeviceOrientation orientation) {
    UIEdgeInsets padding = UIEdgeInsetsZero;
    if (!YJFIsIphoneXSeries()) return padding;
    
    UIDeviceOrientation barOrientation = (UIDeviceOrientation)UIApplication.sharedApplication.statusBarOrientation;
    
    if (UIDeviceOrientationIsLandscape(orientation)) {
        BOOL same = orientation == barOrientation;
        BOOL reverse = !same && UIDeviceOrientationIsLandscape(barOrientation);
        if (same) {
            padding.bottom = YJFSafeAreaBottomHeight();
            padding.top = 0;
        } else if (reverse) {
            padding.top = YJFSafeAreaBottomHeight();
            padding.bottom = 0;
        }
        padding.left = padding.right = MAX(YJFSafeAreaBottomHeight(), YJFStatusbarHeight());
    } else {
        if (orientation == UIDeviceOrientationPortrait) {
            padding.top = YJFStatusbarHeight();
            padding.bottom = barOrientation == UIDeviceOrientationPortrait ? YJFSafeAreaBottomHeight() : 0;
        } else {
            padding.bottom = YJFStatusbarHeight();
            padding.top = barOrientation == UIDeviceOrientationPortrait ? YJFSafeAreaBottomHeight() : 0;
        }
        padding.left = padding.right = UIDeviceOrientationIsLandscape(barOrientation) ? YJFSafeAreaBottomHeight() : 0 ;
    }
    return padding;
}

@implementation YJFUtils

+ (id)getJsonDataJsonname:(NSString *)jsonname
{
    NSString *path = [[NSBundle mainBundle] pathForResource:jsonname ofType:@"geojson"];
    NSData *jsonData = [[NSData alloc] initWithContentsOfFile:path];
    NSError *error;
    id jsonObj = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    if (!jsonData || error) {
        //DLog(@"JSON解码失败");
        return nil;
    } else {
        return jsonObj;
    }
}

@end
