//
//  JsonCacheManager.h
//  ios
//
//  Created by Simon on 2/02/2015.
//  Copyright (c) 2015 sbhstimetable.tk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TodayJson.h"
#import "BelltimesJson.h"
@interface JsonCacheManager : NSObject

+ (TodayJson*) loadTodayJson:(NSString*)date;
+ (void) cacheTodayJson:(NSString *)date data:(NSDictionary *)d;

+ (BelltimesJson*) loadBelltimesJson:(NSString*)date;
+ (void) cacheBelltimesJson:(NSString *)date data:(NSDictionary *)d;

@end
