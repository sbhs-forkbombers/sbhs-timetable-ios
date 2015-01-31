//
//  DateTimeHelper.h
//  ios
//
//  Created by Simon on 31/01/2015.
//  Copyright (c) 2015 sbhstimetable.tk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BelltimesJson.h"
@interface DateTimeHelper : NSObject

- (id) initWithBelltimes:(BelltimesJson*)bells;

+ (NSString*) formatSecondsLeft:(int)seconds;

- (long) msUntilNextEvent;

- (BOOL) needsMidnightCountdown;

- (int) getDayOffset;

- (NSDate*) getNextSchoolDay;
@end
