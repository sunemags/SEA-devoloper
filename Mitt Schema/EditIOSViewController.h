//
//  EditIOSViewController.h
//  Mitt Schema
//
//  Created by Kristoffer Bergkvist on 2013-09-24.
//  Copyright (c) 2013 Ashraf Jibrael. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DetailViewController;
@class Student;
typedef void (^GetResponse)(NSArray* getResponses);

@interface EditIOSViewController : UIViewController
{
    NSOperationQueue *queue;
}

@property (nonatomic, retain) NSMutableArray *allFirstnames;
@property (nonatomic, retain) NSMutableArray *allLastnames;
@property (nonatomic, retain) NSMutableArray *courses;
@property (nonatomic, retain) NSMutableArray *names;
@property (strong, nonatomic) DetailViewController *detailViewController;
@property (retain,nonatomic) Student *student;
-(void)getAllStudents : (NSString*)something onCompletion:(GetResponse)response;

@end
