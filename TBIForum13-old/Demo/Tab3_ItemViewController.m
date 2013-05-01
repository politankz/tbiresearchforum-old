//
//  Tab3_ItemViewController.m
//  Demo
//
//  Created on 18/10/2011.
//  Copyright (c) 2011 MaybeLost.com - All rights reserved.
//

#import "Tab3_ItemViewController.h"

@implementation Tab3_ItemViewController

@synthesize selectedIndex, selectedItem, selectedAuthors, selectedAbstract, currentScrollView, timeLabel, selectedTime;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [currentScrollView setScrollEnabled:YES];
    [currentScrollView setContentSize:CGSizeMake(320, 1000)];
    
    [timeLabel setText:selectedTime];
    
    [numberLabel setText:[NSString stringWithFormat:@"%d",selectedIndex+1]];
    
    [authorsLabel setText:selectedAuthors];
    [authorsLabel resizeToFit];
    
    [titleLabel setText:selectedItem];
    [titleLabel resizeToFit];
    [titleLabel setFrame:CGRectMake(titleLabel.frame.origin.x, 50+authorsLabel.frame.size.height, titleLabel.frame.size.width, titleLabel.frame.size.height)];
    
    [abstractLabel setText:selectedAbstract];
    [abstractLabel resizeToFit];
    [abstractLabel setFrame:CGRectMake(abstractLabel.frame.origin.x, 70+titleLabel.frame.size.height+authorsLabel.frame.size.height, abstractLabel.frame.size.width, abstractLabel.frame.size.height)];
    [currentScrollView setScrollEnabled:YES];
    [currentScrollView setContentSize:CGSizeMake(320, 80+abstractLabel.frame.size.height+titleLabel.frame.size.height+authorsLabel.frame.size.height)];
    
    
    //    [outputImage setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg", selectedIndex]]];
}

@end