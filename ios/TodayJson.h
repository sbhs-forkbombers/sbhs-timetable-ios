//
//  TodayJson.h
//  ios
//
//  Created by Simon on 1/02/2015.
//  Copyright (c) 2015 sbhstimetable.tk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TodayJson_Period.h"
@interface TodayJson : NSObject

- (id) initWithDictionary:(NSDictionary*)today;

- (TodayJson_Period*) getPeriod:(NSUInteger)num;

- (NSDate*) getFetchTime;

- (BOOL) isOutdated;

@end
