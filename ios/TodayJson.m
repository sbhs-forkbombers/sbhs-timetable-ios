//
//  TodayJson.m
//  ios
//
//  Created by Simon on 1/02/2015.
//  Copyright (c) 2015 sbhstimetable.tk. All rights reserved.
//

#import "TodayJson.h"

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

- (NSDictionary*) getPeriod:(NSUInteger)num {
    NSString *s = [NSString stringWithFormat:@"%lu", (unsigned long)num];
    return _today[@"timetable"][s];
}

- (NSDate*) getFetchTime {
    NSInteger time = [_today[@"_fetchTime"] integerValue];
    return [NSDate dateWithTimeIntervalSince1970:time];
}
@end
