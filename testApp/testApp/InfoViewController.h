//
//  InfoViewController.h
//  testApp
//
//  Created by Aaron Burke on 6/12/13.
//  Copyright (c) 2013 Aaron Burke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tab2ViewController.h"

@interface InfoViewController : UIViewController <UITableViewDelegate>
{
    IBOutlet UITableView* infoTable;
}

@property (nonatomic, strong) NSDictionary *linkInfo;

@end
