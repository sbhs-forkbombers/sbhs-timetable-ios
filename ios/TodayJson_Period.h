//
//  TodayJson_Period.h
//  SBHS Timetable
//
//  Created by Simon on 10/02/2015.
//  Copyright (c) 2015 sbhstimetable.tk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TodayJson_Period : NSObject

- (id) initWithDictionary:(NSDictionary*)dict;

- (BOOL) changed;
- (BOOL) roomChanged;
- (BOOL) teacherChanged;
- (BOOL) cancelled;

- (NSString*) room;
- (NSString*) teacher;
- (NSString*) subject;

@end
