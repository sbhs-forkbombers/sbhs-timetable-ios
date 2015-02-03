//
//  SecondViewController.m
//  ios
//
//  Created by Simon on 1/02/2015.
//  Copyright (c) 2015 sbhstimetable.tk. All rights reserved.
//

#import "SecondViewController.h"
#import "TodayTableViewCell.h"
#import "ApiAccessor.h"
@interface SecondViewController () {
    ApiAccessor *api;
    TodayJson *today;
}

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    api = [[ApiAccessor alloc] initWithSessionID:[ApiAccessor loadSessionIDFromPrefs]];
    [api fetchToday:^{
        today = [api getToday];
        NSLog(@"reloadData - %@", today);
        [self.tableView reloadData];
    } error:^ (NSError* e) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat) tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 58;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 58;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ident = @"TodayJsonCell";
    TodayTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ident];
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"TodayUITableCell" bundle:nil] forCellReuseIdentifier:@"TodayJsonCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:ident];
    }
    if (today == nil) {
        NSLog(@"Today is nil");
        cell.subjectLabel.text = @"Subject";
        cell.infoLabel.text = @"with Teacher in Room";
    } else {
        NSDictionary *data = [today getPeriod:indexPath.row+1];
        NSString *fullName = data[@"fullName"];
        NSString *fullTeacher = data[@"fullTeacher"];
        NSString *room = data[@"room"];
        if (fullName == nil) {
            fullName = @"Free Period";
            fullTeacher = @"nobody";
            room = @"nowhere";
        }
        cell.subjectLabel.text = fullName;
        cell.infoLabel.text = [NSString stringWithFormat:@"with %@ in %@", fullTeacher, room];
    }
    NSLog(@"Returned cell");
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
