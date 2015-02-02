//
//  BelltimesJson.h
//  ios
//
//  Created by Simon on 31/01/2015.
//  Copyright (c) 2015 sbhstimetable.tk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BelltimesJson : NSObject

@property (nonatomic) BOOL stale; // is the today.json represented by this file from the cache?

- (id) initWithDictionary:(NSDictionary*)json;

- (NSString*) getWeek;

- (NSString*) getDayName;

- (NSString*) getNextEventName;

- (int) getNextEventIndex;

- (NSDate*) getNextEventTime;
@end
