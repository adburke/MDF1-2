//
//  CustomObject.m
//  testApp
//
//  Created by Aaron Burke on 6/13/13.
//  Copyright (c) 2013 Aaron Burke. All rights reserved.
//

#import "CustomObject.h"

@implementation CustomObject

@synthesize name,date,course,project;

-(id)init
{
    self = [super init];
    if (self)
    {
        name = [NSMutableArray arrayWithObjects:@"Aaron", @"Burke", nil];
        date = @"June 13, 2013";
        course = @"MDF-1";
        project = @"Project 1";
        
        
    }
    return self;
}

@end
