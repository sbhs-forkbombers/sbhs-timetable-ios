//
//  TodayJson.m
//  ios
//
//  Created by Simon on 1/02/2015.
//  Copyright (c) 2015 sbhstimetable.tk. All rights reserved.
//

#import "TodayJson.h"
#import "TodayJson_Period.h"


@implementation TodayJson

NSDictionary* _today;

- (id) initWithDictionary:(NSDictionary *)json {
    self = [super init];
    if (self) {
        _today = json;
        NSLog(@"%@", _today);
    }
    return self;
}

- (TodayJson_Period*) getPeriod:(NSUInteger)num {
    NSString *s = [NSString stringWithFormat:@"%lu", (unsigned long)num];
    return [[TodayJson_Period alloc] initWithDictionary:_today[@"timetable"][s]];
}

- (NSDate*) getFetchTime {
    NSInteger time = [_today[@"_fetchTime"] integerValue];
    return [NSDate dateWithTimeIntervalSince1970:time];
}

- (BOOL) isOutdated {
    NSDate *time = [self getFetchTime];
    NSInteger age = -[time timeIntervalSinceNow];
    if (age > 60 * 60) { // over an hour old
        return YES;
    }
    NSCalendar *greg = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *hm = [greg components:(NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitWeekday) fromDate:time];
    NSDateComponents *now = [greg components:(NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitWeekday) fromDate:[NSDate date]];
    if ([hm weekday] == 7 || [hm weekday] == 1) {
        return NO;
    }
    if ((([hm hour] == 8 && [hm minute] < 45) || [hm hour] < 8) && [now hour] == 8 && [now minute] >= 45) {
        return YES;
    }
    return NO;
}
@end
