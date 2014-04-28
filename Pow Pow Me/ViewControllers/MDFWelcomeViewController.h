//
//  MDFWelcomeViewController.h
//  Pow Pow Me
//
//  Created by Sam de Freyssinet on 27/04/2014.
//  Copyright (c) 2014 Maison de Freyssinet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

FOUNDATION_EXPORT CLLocationCoordinate2D const kMDFCenterMapLocation;
FOUNDATION_EXPORT CLLocationDistance const kMDFMapAltitude;

@interface MDFWelcomeViewController : UIViewController

@property (nonatomic, strong) MKMapView *mapView;

- (MKMapView *)initalizeMapViewForLocation:(CLLocationCoordinate2D)location;

@end
