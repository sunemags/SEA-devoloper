//
//  Student.h
//  Mitt Schema
//
//  Created by Ashraf Jibrael on 9/11/13.
//  Copyright (c) 2013 Ashraf Jibrael. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject

@property (nonatomic,copy) NSString *firstName;
@property (nonatomic,copy) NSString *lastName;
@property (nonatomic, copy) NSString *course;
@property (nonatomic, copy) NSString *type;


-(id)initWithStudentFirstName:(NSString*) firstName lastName:(NSString*) lastName course:(NSString*)course type:(NSString *)type;

-(NSDictionary *)asJsonValue;


@end
