//
//  FirstViewController.m
//  ios
//
//  Created by Simon on 31/01/2015.
//  Copyright (c) 2015 sbhstimetable.tk. All rights reserved.
//

#import "FirstViewController.h"
#import "ApiAccessor.h"
#import "DateTimeHelper.h"
#import <AFHTTPSessionManager.h>
#import "BelltimesJson.h"
@interface FirstViewController ()

@end

@implementation FirstViewController
NSTimer *timer;
int hours, minutes, seconds, secondsLeft;
ApiAccessor *api;
BelltimesJson *bells;
- (void)viewDidLoad {
    [super viewDidLoad];
    

    api = [[ApiAccessor alloc] initWithSessionID:@""];
    [api fetchBelltimes];
    // Do any additional setup after loading the view, typically from a nib.
    secondsLeft = 120;
    [self.bigLabel setText:@"You suck"];
    [self countdownTimer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateCounter:(NSTimer *)theTimer {
    if (secondsLeft > 0) {
        secondsLeft--;
        
    } else {
        secondsLeft = 120;
    }
    
    hours = secondsLeft / 3600;
    minutes = (secondsLeft % 3600) / 60;
    seconds = (secondsLeft % 3600) % 60;
    if (![api belltimesAvailable]) {
        [self.bigLabel setText:@"Loading..."];
    } else {
        bells = [api getBelltimes];
        NSDate *time = [bells getNextEventTime];
        
        [self.bigLabel setText:[DateTimeHelper formatSecondsLeft:[time timeIntervalSinceNow]]];
    }
}

- (void)countdownTimer {
    secondsLeft = hours = minutes = seconds = 0;

    timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(updateCounter:) userInfo:nil repeats:YES];
}

@end
