//
//  TodayJson_Period.m
//  SBHS Timetable
//
//  Created by Simon on 10/02/2015.
//  Copyright (c) 2015 sbhstimetable.tk. All rights reserved.
//

#import "TodayJson_Period.h"
@interface TodayJson_Period () {
    NSDictionary *_data;
    NSDictionary *_parent;
}
@end

@implementation TodayJson_Period

- (id) initWithDictionary:(NSDictionary *)dict parent:(NSDictionary*)t{
    if (self != nil) {
        _data = dict;
        _parent = t;
    }
    return self;
}

- (BOOL) showVariations {
    return [_parent[@"variationsFinalised"] boolValue];
}

- (BOOL) changed {
    return [_data[@"changed"] boolValue] && [self showVariations];
}

- (BOOL) roomChanged {
    return _data[@"roomFrom"] != nil && [self showVariations];
}

- (BOOL) teacherChanged {
    NSLog(@"Class: %@ %d", [_data[@"hasCasual"] class], [_data[@"hasCasual"] boolValue]);
    return _data[@"hasCasual"] != nil && [_data[@"hasCasual"] boolValue] && [self showVariations];
}

- (BOOL) cancelled {
    return _data[@"hasCover"] != nil && ![_data[@"hasCover"] boolValue] && [self showVariations];;
}

- (NSString*) room {
    if ([self cancelled]) {
        return @"N/A";
    }
    if ([self roomChanged]) {
        return _data[@"roomTo"];
    }
    return _data[@"room"];
}

- (NSString*) teacher {
    if ([self teacherChanged]) {
        return _data[@"casualDisplay"];
    }
    if ([self cancelled]) {
        return @"Cancelled!";
    }
    return _data[@"fullTeacher"];
}

- (NSString*) subject {
    if ([self cancelled]) {
        return [_data[@"fullName"] stringByAppendingString:@" - Cancelled!"];
    }
    return _data[@"fullName"];
}

@end
