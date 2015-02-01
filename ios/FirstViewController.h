//
//  FirstViewController.h
//  ios
//
//  Created by Simon on 31/01/2015.
//  Copyright (c) 2015 sbhstimetable.tk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *periodLabel;
@property (strong, nonatomic) IBOutlet UILabel *countdownLabel;

- (void)updateCounter:(NSTimer *)theTimer;
- (void)countdownTimer;

@end

