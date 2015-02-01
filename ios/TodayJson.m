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
    }
    return self;
}

@end
