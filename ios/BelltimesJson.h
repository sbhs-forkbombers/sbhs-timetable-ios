//
//  BelltimesJson.h
//  ios
//
//  Created by Simon on 31/01/2015.
//  Copyright (c) 2015 sbhstimetable.tk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BelltimesJson : NSObject

- (id) initWithDictionary:(NSDictionary*)json;

- (NSString*) getWeek;

- (NSString*) getDayName;

- (NSString*) getNextEventName;

- (int) getNextEventIndex;

- (NSDate*) getNextEventTime;

- (NSDate*) getFetchTime;

- (BOOL) isOutdated;

@end
