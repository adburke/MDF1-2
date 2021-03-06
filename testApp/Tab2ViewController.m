//
//  Tab2ViewController.m
//  testApp
//
//  Created by Aaron Burke on 6/12/13.
//  Copyright (c) 2013 Aaron Burke. All rights reserved.
//

#import "Tab2ViewController.h"
#import "InfoViewController.h"

@interface Tab2ViewController ()

@end

@implementation Tab2ViewController

@synthesize delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"Articles", @"Articles");
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(onClick:)];
    }
    return self;
}

- (void)viewDidLoad
{
    linkArray = [[NSMutableArray alloc] initWithObjects:
                 @{@"Title":@"Mathematics for 3D Game Programming and Computer Graphics", @"Author":@"Lengyel, Eric", @"Published":@"2012", @"Url":@"http://search.ebscohost.com.oclc.fullsail.edu:81/login.aspx?direct=true&db=nlebk&AN=365853&site=ehost-live"},
                 @{@"Title":@"Advanced Design Approaches to Emerging Software Systems : Principles, Methodologies, and Tools", @"Author":@"Li, Yang", @"Published":@"2012", @"Url":@"http://search.ebscohost.com.oclc.fullsail.edu:81/login.aspx?direct=true&db=nlebk&AN=380102&site=ehost-live"},
                 @{@"Title":@"Multidimensional Signal, Image, and Video Processing and Coding", @"Author":@"Woods, John W.", @"Published":@"2012", @"Url":@"http://search.ebscohost.com.oclc.fullsail.edu:81/login.aspx?direct=true&db=nlebk&AN=369931&site=ehost-live"},
                 nil];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)onClick:(id)sender
{
    UIButton *button = (UIButton*)sender;
    if (button) {
        if ([self.navigationItem.rightBarButtonItem.title isEqual:@"Edit"]) {
            [mainTable setEditing:true];
            self.navigationItem.rightBarButtonItem.title = @"Done";
            
        } else {
            [mainTable setEditing:false];
            self.navigationItem.rightBarButtonItem.title = @"Edit";
        }
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [linkArray count];
}

// Create 2 sections for the table
- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView
{
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *sectionName;
    if (section == 0) {
        sectionName = @"Articles";
    } 
    return sectionName;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    //This is the code for a base table view cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: cellIdentifier];
    if (cell == nil) {
        // This is the code for a base table view cell
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];    
    }
    // Sets label text boxes with the correct data
    cell.textLabel.text =[[linkArray objectAtIndex: indexPath.row] objectForKey:@"Title"];
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"row=%d title=%@", indexPath.row, [[linkArray objectAtIndex:indexPath.row] objectForKey:@"Title"]);
    // Allocates and sets up the delegate for InfoViewController
    // Passes the selected row dictionary of personal data to the InfoViewController
    InfoViewController *infoView = [[InfoViewController alloc] initWithNibName:@"InfoViewController" bundle:nil];
    if (infoView) {
        self.delegate = (id)infoView;
        [delegate viewSelectedInfo:[linkArray objectAtIndex:indexPath.row]];
        [self.navigationController pushViewController:infoView animated:TRUE];
    }
    
    
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Remove from array
        [linkArray removeObjectAtIndex:indexPath.row];
        
        // Remove from table view
        [mainTable deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:true];
        
    }
}

@end
