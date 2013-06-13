//
//  CustomObject.h
//  testApp
//
//  Created by Aaron Burke on 6/13/13.
//  Copyright (c) 2013 Aaron Burke. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomObject : NSObject

@property (nonatomic, strong) NSMutableArray *name;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSString *course;
@property (nonatomic, strong) NSString *project;

-(id)init;

@end
