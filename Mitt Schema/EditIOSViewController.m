//
//  EditIOSViewController.m
//  Mitt Schema
//
//  Created by Kristoffer Bergkvist on 2013-09-24.
//  Copyright (c) 2013 Ashraf Jibrael. All rights reserved.
//

#import "EditIOSViewController.h"
#import "DetailViewController.h"
#import "Student.h"

@interface EditIOSViewController () {
    NSMutableArray *_objects;
}

@end

@implementation EditIOSViewController

{
    NSArray *repositorystudents;NSDictionary *studentEncoding;
    NSArray *arrayofStudents;
    
    
}
@synthesize student,allFirstnames,allLastnames,courses,names;

-(void)getAllStudents : (NSString*)something onCompletion:(GetResponse)getResponse
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://kakis.iriscouch.com/schedule_students/_design/_students/_list/students/students"]];
    
    // NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [request setHTTPMethod:@"GET"];
    
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *responseBody, NSData *data, NSError *error) {
        
        NSArray *getAll= @[data];
        
        getResponse(getAll);
        
    }];
    
}



- (void)viewDidLoad
{
    allFirstnames = [NSMutableArray new];
    allLastnames = [NSMutableArray new];
    courses = [NSMutableArray new];
    names = [NSMutableArray new];
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    
    // [self getAllStudent];
    
    [self getAllStudents:@"student" onCompletion:^(NSArray *resGetAllStdents) {
        
        for (id task in resGetAllStdents){
            id response = [NSJSONSerialization JSONObjectWithData:task options:0 error:NULL];
            NSLog(@"%@",response);
            for (int i=0; i < [response count];i++){
                NSString * firstName =[[response objectAtIndex:i ] valueForKeyPath:@"firstName"];
                NSLog(@"%@",firstName);
                student.firstName = firstName;
                NSString * lastName =[[response objectAtIndex:i ] valueForKeyPath:@"lastName"];
                student.lastName = lastName;
                
                
                NSMutableString *name = [NSMutableString new];
                [name appendString:firstName];
                [name appendString:@" "];
                [name appendString:lastName];
                
                NSString * course =[[response objectAtIndex:i ] valueForKeyPath:@"course"];
                student.course = course;
                NSLog(@"%@",lastName);
                NSLog(@"%@",course);
                
                [allFirstnames addObject:firstName];
                [allLastnames addObject:lastName];
                [names addObject:name];
                [courses addObject:course];
                
                
            }
            
        }
      //  [self.tableView reloadData];
    }];
    
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Students";
        queue = [[NSOperationQueue alloc]init];
        
        
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender
{
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    [_objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
//    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return names.count;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    
    //  NSDate *object = _objects[indexPath.row];
    
    cell.textLabel.text = [names objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [courses objectAtIndex:indexPath.row];
    
    return cell;
}



- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!self.detailViewController) {
        self.detailViewController = [[UIStoryboard storyboardWithName:@"WeekViewStoryboard" bundle:nil] instantiateInitialViewController];
    }
    [self presentViewController:self.detailViewController animated:YES completion:NULL];
    //    göra en global som håller koll på den man klickat på så att man hämtar den varje gång man startar //storyboardet
}

@end
