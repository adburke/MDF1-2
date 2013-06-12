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
                 @{@"Title":@"Article 1", @"url":@"www.google.com"},
                 @{@"Title":@"Article 2", @"url":@"www.google.com"},
                 @{@"Title":@"Article 3", @"url":@"www.google.com"},
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
        if (button.tag == 0 && [self.navigationItem.rightBarButtonItem.title isEqual:@"Edit"]) {
            [mainTable setEditing:true];
            [button setTitle:@"Done" forState:UIControlStateNormal];
        } else {
            [mainTable setEditing:false];
            [button setTitle:@"Edit" forState:UIControlStateNormal];
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
    // Sets both custom label text boxes with the correct data
    cell.textLabel.text =[[linkArray objectAtIndex: indexPath.row] objectForKey:@"Title"];
    
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
        [self presentViewController:infoView animated:TRUE completion:nil];
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
