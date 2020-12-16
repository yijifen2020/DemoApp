//
//  ActivitiesModel.m
//  YJFShow
//
//  Created by 胡庚伟 on 2020/12/16.
//

#import "ActivitiesModel.h"

@implementation ActivitiesModel

@end

@implementation ActivitiesData
+ (NSDictionary *)modelContainerPropertyGenericClass {
  return @{@"list" : [ActivitiesModel class]};
}
@end
