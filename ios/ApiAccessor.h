
//
//  ApiAccessor.h
//  ios
//
//  Created by Simon on 31/01/2015.
//  Copyright (c) 2015 sbhstimetable.tk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BelltimesJson.h"

@interface ApiAccessor : NSObject
@property (strong,nonatomic) NSString* sessionID;
@property (strong,nonatomic) BelltimesJson* bells;

- (id) initWithSessionID:(NSString*)sessID;

- (void) fetchBelltimes;
- (BOOL) belltimesAvailable;
- (BelltimesJson*) getBelltimes;    
@end
