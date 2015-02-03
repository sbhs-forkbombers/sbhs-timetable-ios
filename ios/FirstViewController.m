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
#import "BelltimesJson.h"
@interface FirstViewController () {
    NSTimer *timer;
    ApiAccessor *api;
    BelltimesJson *bells;
}

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    api = [[ApiAccessor alloc] initWithSessionID:@""];
    [api fetchBelltimes:^(NSError* e) {
        
    }];
    // Do any additional setup after loading the view, typically from a nib.
    [self.countdownLabel setText:@"0/10 iOS"];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [self countdownTimer];
}

- (void)viewDidDisappear:(BOOL)animated {
    [timer invalidate];
    timer = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateCounter:(NSTimer *)theTimer {
    if (![api belltimesAvailable]) {
        [self.countdownLabel setText:@"Loading..."];
    } else {
        bells = [api getBelltimes];
        NSDate *time = [bells getNextEventTime];
        [self.periodLabel setText:[bells getNextEventName]];
        [self.countdownLabel setText:[DateTimeHelper formatSecondsLeft:[time timeIntervalSinceNow]]];
    }
}

- (void)countdownTimer {
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(updateCounter:) userInfo:nil repeats:YES];
}

@end
