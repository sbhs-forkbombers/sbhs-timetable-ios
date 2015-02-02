//
//  ApiAccessor.m
//  ios
//
//  Created by Simon on 31/01/2015.
//  Copyright (c) 2015 sbhstimetable.tk. All rights reserved.
//

#import "ApiAccessor.h"
#import <AFHTTPSessionManager.h>
#import "DateTimeHelper.h"
static ApiAccessor* instance;

@implementation ApiAccessor
AFHTTPSessionManager *manager;
- (id) initWithSessionID:(NSString *)sessID {
    self = [super init];
    if (self) {
        [self setSessionID:sessID];
        [self setDth:[[DateTimeHelper alloc] initWithBelltimes:nil]]; // XXX this will break probably
    }
    manager = [[AFHTTPSessionManager manager] initWithBaseURL:[NSURL URLWithString:@"https://sbhstimetable.tk/"]];

    return self;
}

+ (NSString*) loadSessionIDFromPrefs {
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    return [prefs objectForKey:@"sessionID"];
}

- (void) fetchBelltimes:(void (^)(NSError*))err {
    NSString *date = [self.dth getDateString];
    [manager GET:[NSString stringWithFormat:@"/api/belltimes?date=%@", date] parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
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

- (void) fetchToday:(void (^)(void))todayAvailable error:(void (^)(NSError*))err {
    [manager GET:@"/api/today.json" parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        self.today = [[TodayJson alloc] initWithDictionary:(NSDictionary*)responseObject];
        todayAvailable();
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

- (BOOL) todayAvailable {
    return self.today != nil;
}

- (TodayJson *) getToday {
    return self.today;
}

@end
