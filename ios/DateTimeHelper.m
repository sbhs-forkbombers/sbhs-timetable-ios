//
//  DateTimeHelper.m
//  ios
//
//  Created by Simon on 31/01/2015.
//  Copyright (c) 2015 sbhstimetable.tk. All rights reserved.
//

#import "DateTimeHelper.h"

@implementation DateTimeHelper
// XXX stubs - everywhere
- (id) initWithBelltimes:(BelltimesJson *)bells {
    self = [super init];
    return self;
}

+ (NSString*) formatSecondsLeft:(int)seconds {
    int h,m,s;
    s = seconds % 60;
    seconds /= 60;
    m = seconds % 60;
    seconds /= 60;
    h = seconds;
    if (h > 0) {
        return [NSString stringWithFormat:@"%02dh %02dm %02ds", h, m, s];
    } else {
        return [NSString stringWithFormat:@"%02dm %02ds", m, s];
    }
}


- (BOOL) needsMidnightCountdown {
    NSCalendar *cal = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSCalendarUnit units = kCFCalendarUnitHour | kCFCalendarUnitWeekday | kCFCalendarUnitMinute;
    NSDateComponents *components = [cal components:units fromDate:[NSDate date]];
    NSInteger weekday = [components weekday];
    NSInteger hour = [components hour];
    NSInteger minute = [components minute];
    if (weekday == 7 || weekday == 1) { // Saturday or Sunday
        return YES;
    }
    if (hour > 15 || (hour == 15 && minute > 15)) { // after school on any other day
        return YES;
    }
    
    return NO;
}

- (int) getDayOffset {
    NSCalendar *cal = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSCalendarUnit units = kCFCalendarUnitHour | kCFCalendarUnitWeekday | kCFCalendarUnitMinute;
    NSDateComponents *components = [cal components:units fromDate:[NSDate date]];
    NSInteger weekday = [components weekday];
    if (weekday == 7) {
        return 1;
    } else if (weekday == 6) {
        return 2;
    }
    return 0;
}

- (NSDate*) getNextSchoolDay {
    const int day = 60 * 60 * 24;
    int offset = day * [self getDayOffset];
    NSDate *date = [NSDate date];
    NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
    NSUInteger preservedComponents = (NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit);
    date = [calendar dateFromComponents:[calendar components:preservedComponents fromDate:date]];
    NSInteger secondsLeft;
    if ([self needsMidnightCountdown]) {
        secondsLeft = [date timeIntervalSinceNow] + 86400;
    } else {
        secondsLeft = [date timeIntervalSinceNow];
    }
    return [[NSDate date] dateByAddingTimeInterval:offset + secondsLeft];
}

@end
