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
@property (nonatomic, copy) NSString *adzoneId;
@property (nonatomic, copy) NSString *adzoneUrl;
@property (nonatomic, copy) NSString *appkey;
@end

@interface ActivitiesData : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSArray<ActivitiesModel *> *list;
@end

NS_ASSUME_NONNULL_END
