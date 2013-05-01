//
//  Tab2_ItemViewController.m
//  Demo
//
//  Created on 18/10/2011.
//  Copyright (c) 2011 MaybeLost.com - All rights reserved.
//

#import "Tab2_ItemViewController.h"

@implementation Tab2_ItemViewController

@synthesize selectedIndex, selectedItem, selectedAuthors, selectedAbstract, currentScrollView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [currentScrollView setScrollEnabled:YES];
    [currentScrollView setContentSize:CGSizeMake(320, 1000)];
    
    [numberLabel setText:[NSString stringWithFormat:@"%d",selectedIndex+1]];
    [titleLabel setText:selectedItem];
    [titleLabel resizeToFit];
    [authorsLabel setText:selectedAuthors];
    [authorsLabel resizeToFit];
    [authorsLabel setFrame:CGRectMake(authorsLabel.frame.origin.x, 20+titleLabel.frame.size.height, authorsLabel.frame.size.width, authorsLabel.frame.size.height)];
    [abstractLabel setText:selectedAbstract];
    [abstractLabel resizeToFit];
    [abstractLabel setFrame:CGRectMake(abstractLabel.frame.origin.x, 40+titleLabel.frame.size.height+authorsLabel.frame.size.height, abstractLabel.frame.size.width, abstractLabel.frame.size.height)];
    [currentScrollView setScrollEnabled:YES];
    [currentScrollView setContentSize:CGSizeMake(320, 55+abstractLabel.frame.size.height+titleLabel.frame.size.height+authorsLabel.frame.size.height)];
    
    
    //    [outputImage setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg", selectedIndex]]];
}

@end