//
//  Tab2_ItemViewController.h
//  Demo
//
//  Created on 18/10/2011.
//  Copyright (c) 2011 MaybeLost.com - All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UILabel+dynamicSizeMe.h"

@interface Tab2_ItemViewController : UIViewController
{
    NSString *selectedItem;
    
    NSString *selectedAuthors;
    NSString *selectedAbstract;
    
    NSInteger selectedIndex;
    IBOutlet UILabel *numberLabel;
    IBOutlet UILabel *titleLabel;
    IBOutlet UILabel *authorsLabel;
    IBOutlet UILabel *abstractLabel;
    
    IBOutlet UIImageView *outputImage;
    
    IBOutlet UIScrollView *currentScrollView;

}

@property (nonatomic) NSInteger selectedIndex;
@property (nonatomic, retain) NSString *selectedItem;
@property (nonatomic, retain) NSString *selectedAuthors;
@property (nonatomic, retain) NSString *selectedAbstract;

@property (nonatomic, retain) UIScrollView *currentScrollView;

@end
