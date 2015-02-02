//
//  JsonCacheManager.m
//  ios
//
//  Created by Simon on 2/02/2015.
//  Copyright (c) 2015 sbhstimetable.tk. All rights reserved.
//

#import "JsonCacheManager.h"
#import "TodayJson.h"
#import "BelltimesJson.h"
@implementation JsonCacheManager

+ (NSDictionary*) loadDictionary:(NSString *)date withName:(NSString *)name {
    NSUserDefaults *storage = [NSUserDefaults standardUserDefaults];
    return [storage dictionaryForKey:[NSString stringWithFormat:@"%@_%@", name, date]];
}

+ (void) cache:(NSString *)date type:(NSString *)type data:(NSDictionary *)data {
    NSUserDefaults *storage = [NSUserDefaults standardUserDefaults];
    return [storage setObject:data forKey:[NSString stringWithFormat:@"%@_%@", type, date]];
}

+ (TodayJson*) loadTodayJson:(NSString *)date {
    NSDictionary *dict = [self loadDictionary:date withName:@"today"];
    if (dict == nil) return nil;
    return [[TodayJson alloc] initWithDictionary:dict];
}

+ (BelltimesJson*) loadBelltimesJson:(NSString *)date {
    NSDictionary *dict = [self loadDictionary:date withName:@"belltimes"];
    if (dict == nil) return nil;
    return [[BelltimesJson alloc] initWithDictionary:dict];
}

+ (void) cacheTodayJson:(NSString *)date data:(NSDictionary *)d {
    [self cache:date type:@"today" data:d];
}


+ (void) cacheBelltimesJson:(NSString *)date data:(NSDictionary *)d {
    [self cache:date type:@"belltimes" data:d];
}

@end
