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
    myWebView.delegate = self;

}

- (void)viewWillDisappear:(BOOL)animated
{
    if ( [myWebView isLoading] ) {
        [myWebView stopLoading];
    }
    myWebView.delegate = nil;    // disconnect the delegate as the webview is hidden
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
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
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier: cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    // Used section number and row to put the correct values in the correct section and row
    if (indexPath.section == 0) {
        cell.textLabel.text = [linkInfo objectForKey:@"Title"];
        cell.userInteractionEnabled = NO;
        cell.textLabel.numberOfLines = 0;
        cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    } else if (indexPath.section == 1 && indexPath.row == 0) {
        cell.textLabel.text = [NSString stringWithFormat:@"Author: %@" ,[linkInfo objectForKey:@"Author"]];
        cell.userInteractionEnabled = NO;
    } else if (indexPath.section == 1 && indexPath.row == 1) {
        cell.textLabel.text = [NSString stringWithFormat:@"Published Year: %@" ,[linkInfo objectForKey:@"Published"]];
        cell.userInteractionEnabled = NO;
    } else if (indexPath.section == 1 && indexPath.row == 2) {
        cell.textLabel.text = [NSString stringWithFormat:@"Url: %@" ,[linkInfo objectForKey:@"Url"]];
        cell.textLabel.numberOfLines = 0;
        cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSError* error  = NULL;
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *string = cell.textLabel.text;
    
    NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern:@"\\b(Url:)" options:NSRegularExpressionCaseInsensitive error:&error];
    
    NSInteger result = [regex numberOfMatchesInString:string options:0 range:NSMakeRange(0, [string length])];
    
    if (result == 1) {
        [myWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[linkInfo objectForKey:@"Url"]]]];
    }
    
    
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    // starting the load, show the activity indicator in the status bar
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    // finished loading, hide the activity indicator in the status bar
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

@end
