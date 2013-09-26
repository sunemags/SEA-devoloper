//
//  DetailViewController.h
//  Mitt Schema
//
//  Created by Ashraf Jibrael on 9/11/13.
//  Copyright (c) 2013 Ashraf Jibrael. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *ageLabel;


@end
