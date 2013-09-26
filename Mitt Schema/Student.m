//
//  Student.m
//  Mitt Schema
//
//  Created by Ashraf Jibrael on 9/11/13.
//  Copyright (c) 2013 Ashraf Jibrael. All rights reserved.
//

#import "Student.h"

@implementation Student



-(NSDictionary *)asJsonValue
{
    NSMutableDictionary *selfAsJson = [[NSMutableDictionary alloc] init];
    
    selfAsJson[@"firstName"] = self.firstName;
    selfAsJson[@"lastName"] = self.lastName;
    selfAsJson[@"course"] = self.course;
    selfAsJson[@"type"] = self.type;
    
    return selfAsJson;
}


-(id) init
{
    return [self initWithStudentFirstName:@"" lastName:@"" course:@"" type:@""];
}


-(id)initWithStudentFirstName:(NSString*) firstName lastName:(NSString*) lastName course:(NSString*) course type:(NSString *) type{
    
    self = [super init];
    if (self) {
        self.firstName =firstName;
        self.lastName = lastName;
        self.course = course;
        self.type = type;
    }
    return self;
}


-(NSString *)description
{
    return [NSString stringWithFormat:@"%@,%@,%@,%@", self.lastName , self.firstName, self.course, self.type];
}


@end
