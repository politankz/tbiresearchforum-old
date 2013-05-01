//
//  Tab1_RedScreenViewController.m
//  Demo
//
//  Created on 18/10/2011.
//  Copyright (c) 2011 MaybeLost.com - All rights reserved.
//

#import "Tab1_RedScreenViewController.h"

@implementation Tab1_RedScreenViewController

@synthesize currentScrollView, mapView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"Mapview delegate set.");
    [mapView setDelegate:self];
    
    CLLocationCoordinate2D vaCoords = CLLocationCoordinate2DMake(37.40490329864028, -122.1419084072113);
    [self zoomToCoords:vaCoords];
    
    [currentScrollView setScrollEnabled:YES];
    [currentScrollView setContentSize:CGSizeMake(320, 1550)];
}

- (void)zoomToCoords:(CLLocationCoordinate2D)theseCoords
{
    NSLog(@"Zooming to coordinates. Creating annotation.");
    
    MKCoordinateRegion region;
    region.center = theseCoords;
    region.span = MKCoordinateSpanMake(0.03, 0.03);
    region = [self.mapView regionThatFits:region];
    [mapView setRegion:region animated:YES];
    
    // Add an annotation
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = theseCoords;
    point.title = @"TBI Research Forum 2013";
    point.subtitle = @"VA Palo Alto Healthcare System";
    
    [mapView addAnnotation:point];
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    
    NSLog(@"Mapview didUpdateUserLocation.");
    
    CLLocationCoordinate2D vaCoords = CLLocationCoordinate2DMake(37.40490329864028, -122.1419084072113);
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(vaCoords, 800, 800);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
    
    // Add an annotation
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = vaCoords;
    point.title = @"VA Palo Alto Healthcare System";
    point.subtitle = @"TBI Research Forum 2013";
    
    [self.mapView addAnnotation:point];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
