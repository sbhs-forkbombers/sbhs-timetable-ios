//
//  SecondViewController.m
//  ios
//
//  Created by Simon on 1/02/2015.
//  Copyright (c) 2015 sbhstimetable.tk. All rights reserved.
//

#import "SecondViewController.h"
#import "TodayTableViewCell.h"
@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
    
    cell.subjectLabel.text = @"Subject";
    cell.infoLabel.text = @"with Teacher in Room";
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
