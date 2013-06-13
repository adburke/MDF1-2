//
//  InfoViewController.m
//  testApp
//
//  Created by Aaron Burke on 6/12/13.
//  Copyright (c) 2013 Aaron Burke. All rights reserved.
//

#import "InfoViewController.h"

@interface InfoViewController ()

@end

@implementation InfoViewController

@synthesize linkInfo;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewSelectedInfo:(NSDictionary*)cellInfo;
{
    NSLog(@"viewPersonInfo Fired");
    // Set local dictionary to the passed in dictionary
    linkInfo = cellInfo;
    NSLog(@"Title=%@ Author=%@ Published=%@ Url=%@", [linkInfo objectForKey:@"Title"],[linkInfo objectForKey:@"Author"],[linkInfo objectForKey:@"Published"],[linkInfo objectForKey:@"Url"] );
}

- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView
{
    return 2;
}

// Controls how many rows are in each section
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    } else if (section == 1) {
        return 3;
    } else {
        return 0;
    }
    
}

// Sets the heading titles for each section
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *sectionName;
    if (section == 0) {
        sectionName = @"Article Title";
    } else if (section == 1) {
        sectionName = @"Article Info";
    }
    return sectionName;
}

// Controls the cell creation
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    // Used section number and row to put the correct values in the correct section and row
    if (indexPath.section == 0) {
        cell.textLabel.text = [linkInfo objectForKey:@"Title"];
    } else if (indexPath.section == 1 && indexPath.row == 0) {
        cell.textLabel.text = [NSString stringWithFormat:@"Author: %@" ,[linkInfo objectForKey:@"Author"]];
    } else if (indexPath.section == 1 && indexPath.row == 1) {
        cell.textLabel.text = [NSString stringWithFormat:@"Published Year: %@" ,[linkInfo objectForKey:@"Published"]];
    } else if (indexPath.section == 1 && indexPath.row == 2) {
        cell.textLabel.text = [NSString stringWithFormat:@"Url: %@" ,[linkInfo objectForKey:@"Url"]];
    }
    
    return cell;
}

@end
