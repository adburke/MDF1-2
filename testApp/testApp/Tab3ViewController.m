//
//  Tab3ViewController.m
//  testApp
//
//  Created by Aaron Burke on 6/12/13.
//  Copyright (c) 2013 Aaron Burke. All rights reserved.
//

#import "Tab3ViewController.h"
#import "NavL2Controller.h"

@interface Tab3ViewController ()

@end

@implementation Tab3ViewController

-(IBAction)onClick:(id)sender
{
    NavL2Controller *navL2View = [[NavL2Controller alloc] initWithNibName:@"NavL2Controller" bundle:nil];
    if (navL2View) {
        [self.navigationController pushViewController:navL2View animated:TRUE];
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"Nav Level 1", @"Nav Level 1");
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
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

@end
