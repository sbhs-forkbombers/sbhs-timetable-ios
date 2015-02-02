//
//  TodayJson.h
//  ios
//
//  Created by Simon on 1/02/2015.
//  Copyright (c) 2015 sbhstimetable.tk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TodayJson : NSObject

@property (nonatomic) bool stale; // is the today.json represented by this object considered outdated according to some arbitrary rules I'll come up with later?

- (id) initWithDictionary:(NSDictionary*)today;

- (NSDictionary*) getPeriod:(NSUInteger)num;

@end
