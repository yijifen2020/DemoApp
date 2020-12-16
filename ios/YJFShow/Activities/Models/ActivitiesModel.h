//
//  ActivitiesModel.h
//  YJFShow
//
//  Created by 胡庚伟 on 2020/12/16.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ActivitiesModel : NSObject
@property (nonatomic, copy) NSString *poster;
@property (nonatomic, assign) NSInteger mediaId;
@property (nonatomic, assign) NSInteger adzoneId;
@property (nonatomic, copy) NSString *adzoneUrl;
@property (nonatomic, copy) NSString *appkey;
@end

NS_ASSUME_NONNULL_END
