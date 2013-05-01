//
//  Tab2_TableViewController.h
//  Demo
//
//  Created on 18/10/2011.
//  Copyright (c) 2011 MaybeLost.com - All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Tab2_TableViewController : UITableViewController
{
    NSDictionary *allPosterDict;
    
    NSMutableArray *posters;
    
    NSMutableArray *posterTitles;
    NSMutableArray *posterAuthorLasts;
    
    NSMutableArray *posterAuthorFull;
    NSMutableArray *posterAbstract;
    
    
}
@property (nonatomic, retain) NSDictionary *allPosterDict;

@end