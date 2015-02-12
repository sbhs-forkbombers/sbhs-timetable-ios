
//
//  ApiAccessor.h
//  ios
//
//  Created by Simon on 31/01/2015.
//  Copyright (c) 2015 sbhstimetable.tk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BelltimesJson.h"
#import "TodayJson.h"
#import "DateTimeHelper.h"	
@interface ApiAccessor : NSObject
@property (strong,nonatomic) NSString* sessionID;
@property (strong,nonatomic) BelltimesJson* bells;
@property (strong,nonatomic) TodayJson* today;
@property (strong,nonatomic) DateTimeHelper* dth;
- (id) initWithSessionID:(NSString*)sessID;
+ (NSString*) loadSessionIDFromPrefs;

- (void) fetchBelltimes:(void (^)(NSError*))err;
- (BOOL) belltimesAvailable;
- (BelltimesJson*) getBelltimes;

- (void) fetchToday:(void (^)(void))todayAvailable error:(void (^)(NSError*))err;
- (BOOL) todayAvailable;
- (TodayJson*) getToday;
@end
