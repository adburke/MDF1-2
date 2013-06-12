//
//  Tab2ViewController.h
//  testApp
//
//  Created by Aaron Burke on 6/12/13.
//  Copyright (c) 2013 Aaron Burke. All rights reserved.
//

#import <UIKit/UIKit.h>

// Deletgate for passing info on a person
@protocol TableInfoDelegate <NSObject>

@optional
// Required method that will be passed the corresponding dictionary of inf o for the person selected on the row
- (void)viewSelectedInfo:(NSDictionary*)linkInfo;

@end


@interface Tab2ViewController : UIViewController
{
    IBOutlet UITableView* mainTable;
    
    NSMutableArray* linkArray;
}

// Property id of the delegate
@property (nonatomic, weak) id <TableInfoDelegate> delegate;

// Controls the click even of the edit button
-(void)onClick:(id)sender;

@end
