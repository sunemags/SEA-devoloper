//
//  WeekDayViewController.m
//  Mitt Schema
//
//  Created by Kristoffer Bergkvist on 2013-09-16.
//  Copyright (c) 2013 Ashraf Jibrael. All rights reserved.
//

#import "WeekDayViewController.h"

@interface WeekDayViewController ()

@end

@implementation WeekDayViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIViewController *vc = [[UIViewController alloc] initWithNibName:@"MasterViewController" bundle:nil];
    [self.view addSubview:vc.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
