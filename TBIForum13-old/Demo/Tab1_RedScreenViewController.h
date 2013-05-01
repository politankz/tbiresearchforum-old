//
//  Tab1_RedScreenViewController.h
//  Demo
//
//  Created on 18/10/2011.
//  Copyright (c) 2011 MaybeLost.com - All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface Tab1_RedScreenViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate> {
    IBOutlet UIScrollView *currentScrollView;

}

@property (nonatomic, retain) UIScrollView *currentScrollView;

@property (nonatomic, strong) IBOutlet MKMapView *mapView;

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation;

@end
