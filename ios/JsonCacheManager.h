//
//  JsonCacheManager.h
//  ios
//
//  Created by Simon on 2/02/2015.
//  Copyright (c) 2015 sbhstimetable.tk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JsonCacheManager : NSObject

+ (NSString*) getDateString;

+ (void) loadTodayJson:(NSString*)date;

+ (void) loadBelltimesJson:(NSString*)date;

@end
