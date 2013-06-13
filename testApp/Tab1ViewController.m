//
//  Tab1ViewController.m
//  testApp
//
//  Created by Aaron Burke on 6/12/13.
//  Copyright (c) 2013 Aaron Burke. All rights reserved.
//

#import "Tab1ViewController.h"
#import "CustomObject.h"

@interface Tab1ViewController ()

@end

@implementation Tab1ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"First", @"First");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    CustomObject *custom = [[CustomObject alloc] init];
    nameInfo.text = [NSString stringWithFormat:@"        %@ %@", custom.name[0], custom.name[1] ];
    dateInfo.text = [NSString stringWithFormat:@"    %@", custom.date];
    courseInfo.text = [NSString stringWithFormat:@"    %@", custom.course];
    projectInfo.text = [NSString stringWithFormat:@"    %@", custom.project];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
