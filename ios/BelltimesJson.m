//
//  BelltimesJson.m
//  ios
//
//  Created by Simon on 31/01/2015.
//  Copyright (c) 2015 sbhstimetable.tk. All rights reserved.
//

#import "BelltimesJson.h"
#import "DateTimeHelper.h"
@implementation BelltimesJson 
NSDictionary *_belltimes;
DateTimeHelper *dth;
- (id) initWithDictionary:(NSDictionary *)json {
    self = [super init];
    if (self) {
        _belltimes = json;
    }
    dth = [[DateTimeHelper alloc] initWithBelltimes:self];
    return self;
}

- (NSString*)getWeek {
    return _belltimes[@"weekType"];
}

- (NSString*)getDayName {
    return _belltimes[@"day"];
}

- (int)getNextEventIndex {
    NSArray *bells = _belltimes[@"bells"];
    if (bells == nil) {
        return -1;
    }
    int i;
    for (i = 0; i < bells.count; i++) {
        if ([[self getTimeForIndex:i] timeIntervalSinceNow] > 0) {
            break;
        }
    }
    return i;
}

- (NSDate*) getTimeForIndex:(int)index {
    NSArray *bells = _belltimes[@"bells"];
    NSDictionary *bell = bells[index];
    NSString *bellTime = bell[@"time"];
    NSArray *els = [bellTime componentsSeparatedByString:@":"];
    NSInteger hour, minute;
    hour = [els[0] integerValue];
    minute = [els[1] integerValue];
    NSDate *nextDay = [dth getNextSchoolDay];
    
    return [nextDay dateByAddingTimeInterval:60*minute+3600*hour];
}

- (NSDate*) getNextEventTime {
    return [self getTimeForIndex:[self getNextEventIndex]];
    
}

@end
