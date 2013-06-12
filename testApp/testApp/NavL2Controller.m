//
//  NavL2Controller.m
//  testApp
//
//  Created by Aaron Burke on 6/12/13.
//  Copyright (c) 2013 Aaron Burke. All rights reserved.
//

#import "NavL2Controller.h"
#import "NavL3Controller.h"

@interface NavL2Controller ()

@end

@implementation NavL2Controller

-(IBAction)onClick:(id)sender
{
    UIButton *button = (id)sender;
    if (button) {
        if (button.tag == 0) {
            [self.navigationController popViewControllerAnimated:TRUE];
        } else if (button.tag == 1) {
            NavL3Controller *navL3View = [[NavL3Controller alloc] initWithNibName:@"NavL3Controller" bundle:nil];
            if (navL3View) {
                [self.navigationController pushViewController:navL3View animated:TRUE];
            }
        }
    }

}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"Nav Level 2", @"Nav Level 2");

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
