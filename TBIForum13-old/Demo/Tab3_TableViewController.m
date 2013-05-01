//
//  Tab3_TableViewController.m
//  Demo
//
//  Created on 18/10/2011.
//  Copyright (c) 2011 MaybeLost.com - All rights reserved.
//

#import "Tab3_TableViewController.h"
#import "Tab3_ItemViewController.h"

@implementation Tab3_TableViewController

@synthesize allPosterDict;

- (void)setupWithPropertyList:(NSString *)propertyListName {
    
    NSData *tmp = [NSData dataWithContentsOfURL:[[NSBundle mainBundle] URLForResource:propertyListName withExtension:@"plist"] options:NSDataReadingMappedIfSafe error:nil];
    allPosterDict = [NSPropertyListSerialization propertyListWithData:tmp options:NSPropertyListImmutable format:nil error:nil];
//    dynModDictKeys = [[dynModDict allKeys] sortedArrayUsingSelector:@selector(compare:)];
    
    [self loadSpeakersInDict:allPosterDict];
    
//    moduleName = [dynModDict objectForKey:kModuleNameKey];
    
}

- (void)loadSpeakersInDict:(NSDictionary *)thisDictionary {
    int speakersToLoad = [[thisDictionary allKeys] count];
    NSLog(@"Loading %d speakers...",speakersToLoad);
    
    int speakerIndex = 0;
    
    for (NSString *thisKey in [thisDictionary allKeys]) {
        NSString *currentDictKey = [NSString stringWithFormat:@"speaker%d",speakerIndex+1];
        NSMutableDictionary *currentDictionary = [[NSMutableDictionary alloc] initWithDictionary:[thisDictionary objectForKey:currentDictKey] copyItems:YES];
//        NSDictionary *thisPosterDictionary = [thisDictionary objectForKey:thisKey];
//        for (NSDictionary *posterDict in thisDictionary) {
            [posterTitles addObject:[currentDictionary objectForKey:@"title"]];
            [posterAuthorLasts addObject:[currentDictionary objectForKey:@"title"]];
            [posterAuthorFull addObject:[currentDictionary objectForKey:@"authors"]];
            [posterAbstract addObject:[currentDictionary objectForKey:@"abstract"]];
            [time addObject:[currentDictionary objectForKey:@"time"]];
            
//        }
        speakerIndex++;
    }
    
    NSLog(@"Load speaker progress: %d of %d speakers loaded!",speakerIndex,speakersToLoad);
}

// When the view loads, define our data
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *currentPostersPlistFilename = @"tbirf13_speakers_v1";
    posterTitles = [[NSMutableArray alloc] initWithObjects: nil];
    posterAuthorLasts = [[NSMutableArray alloc] initWithObjects: nil];
    posterAuthorFull = [[NSMutableArray alloc] initWithObjects: nil];
    posterTitles = [[NSMutableArray alloc] initWithObjects: nil];
    posterAbstract = [[NSMutableArray alloc] initWithObjects: nil];
    time = [[NSMutableArray alloc] initWithObjects: nil];
    
    [self setupWithPropertyList:currentPostersPlistFilename];
    

}

// Return number of sections in table (always 1 for this demo!)
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

// Return the amount of items in our table (the total items in our array above)
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [posterTitles count];
}

// Return a cell for the table
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // A cell identifier which matches our identifier in IB
    static NSString *CellIdentifier = @"CellIdentifier";
    
    // Create or reuse a cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Get the cell label using it's tag and set it
    UILabel *cellLabel = (UILabel *)[cell viewWithTag:1];
    [cellLabel setText:[posterTitles objectAtIndex:indexPath.row]];
    
//    // get the cell imageview using it's tag and set it
//    UIImageView *cellImage = (UIImageView *)[cell viewWithTag:2];
//    [cellImage setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg", indexPath.row]]];
    UILabel *cellNumber = (UILabel *)[cell viewWithTag:2];
    [cellNumber setText:[NSString stringWithFormat:@"%d", indexPath.row+1]];
    
    UILabel *cellLasts = (UILabel *)[cell viewWithTag:3];
    [cellLasts setText:[posterAuthorFull objectAtIndex:indexPath.row]];
    
    return cell;
}

// Do some customisation of our new view when a table item has been selected
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure we're referring to the correct segue
    if ([[segue identifier] isEqualToString:@"ShowSelectedSpeaker"]) {
        
        // Get reference to the destination view controller
        Tab3_ItemViewController *vc = [segue destinationViewController];
        
        // get the selected index
        NSInteger selectedIndex = [[self.tableView indexPathForSelectedRow] row];
        
        // Pass the name and index of our film
        [vc setSelectedItem:[NSString stringWithFormat:@"%@", [posterTitles objectAtIndex:selectedIndex]]];
        [vc setSelectedIndex:selectedIndex];
        [vc setSelectedAuthors:[NSString stringWithFormat:@"%@", [posterAuthorFull objectAtIndex:selectedIndex]]];
        [vc setSelectedAbstract:[NSString stringWithFormat:@"%@", [posterAbstract objectAtIndex:selectedIndex]]];
        [vc setSelectedTime:[NSString stringWithFormat:@"%@", [time objectAtIndex:selectedIndex]]];
    }
}

@end
