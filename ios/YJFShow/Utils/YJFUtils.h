//
//  YJFUtils.h
//  YJFShow
//
//  Created by 胡庚伟 on 2020/12/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define kFontHeavy(a) [UIFont systemFontOfSize:kScale(a) weight:(UIFontWeightHeavy)]

/**
 *  尺寸
 */
#define kScreenWidth         [UIScreen mainScreen].bounds.size.width
#define kScreenHeight        [UIScreen mainScreen].bounds.size.height

// 等比缩放宏
#define kScale(value) ((value)/375.0f*[UIScreen mainScreen].bounds.size.width)

#define kColor(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define kColorA(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(float)a]

#define YJF_DISPATCH_ASYNC(queue, block)\
if (strcmp(dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL), dispatch_queue_get_label(queue)) == 0) {\
block();\
} else {\
dispatch_async(queue, block);\
}

#define YJF_DISPATCH_ASYNC_MAIN(block) YJF_DISPATCH_ASYNC(dispatch_get_main_queue(), block)


#define YJF_CODE_EXEC_TIME(KEY, ...) \
CFAbsoluteTime startTime = CFAbsoluteTimeGetCurrent(); \
__VA_ARGS__ \
CFAbsoluteTime linkTime = (CFAbsoluteTimeGetCurrent() - startTime); \
NSLog(@"%@ Time-Consuming: %fms", KEY, linkTime * 1000.0);


UIWindow * _Nonnull YJFNormalWindow(void);

UIViewController * _Nullable YJFTopController(void);
UIViewController * _Nullable YJFTopControllerByWindow(UIWindow *);

BOOL YJFLowMemory(void);

BOOL YJFIsIphoneXSeries(void);
CGFloat YJFStatusbarHeight(void);
CGFloat YJFSafeAreaBottomHeight(void);
CGFloat YJFTabbarHeight(void);
CGFloat YJFNavigationbarHeight(void);

UIImage *YJFSnapshotView(UIView *);

/// This is orientation of 'YBImageBrowser' not 'UIDevice'.
UIEdgeInsets YJFPaddingByBrowserOrientation(UIDeviceOrientation);

@interface YJFUtils : NSObject
+ (id)getJsonDataJsonname:(NSString *)jsonname;
@end

NS_ASSUME_NONNULL_END
