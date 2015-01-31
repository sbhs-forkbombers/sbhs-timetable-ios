//
//  ApiAccessor.m
//  ios
//
//  Created by Simon on 31/01/2015.
//  Copyright (c) 2015 sbhstimetable.tk. All rights reserved.
//

#import "ApiAccessor.h"
#import <AFHTTPSessionManager.h>
static ApiAccessor* instance;

@implementation ApiAccessor
AFHTTPSessionManager *manager;
- (id) initWithSessionID:(NSString *)sessID {
    self = [super init];
    if (self) {
        [self setSessionID:sessID];
    }
    manager = [[AFHTTPSessionManager manager] initWithBaseURL:[NSURL URLWithString:@"https://sbhstimetable.tk/"]];

    return self;
}

- (void) fetchBelltimes {
    
    [manager GET:@"/api/belltimes?date=2015-2-3" parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        self.bells = [[BelltimesJson alloc] initWithDictionary:(NSDictionary*)responseObject];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
}

- (BOOL) belltimesAvailable {
    return self.bells != nil;
}

- (BelltimesJson*) getBelltimes {
    return self.bells;
}

@end
