//
//  MDFWelcomeViewController.m
//  Pow Pow Me
//
//  Created by Sam de Freyssinet on 27/04/2014.
//  Copyright (c) 2014 Maison de Freyssinet. All rights reserved.
//

#import "MDFWelcomeViewController.h"

CLLocationCoordinate2D const kMDFCenterMapLocation = {39.828127, -98.579404};
CLLocationDistance const kMDFMapAltitude = (CLLocationDistance)15000000.0;

@implementation MDFWelcomeViewController(Presentation)

- (void)initializeViewController
{
    [self.navigationItem setTitle:@"Pow! Pow! Me"];
}

- (void)initializeMapView
{
    self.mapView = [self initalizeMapViewForLocation:kMDFCenterMapLocation];
    [self.mapView setFrame:[self.view frame]];
    [self.view addSubview:self.mapView];    
}

@end

@implementation MDFWelcomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self)
    {
        [self initializeViewController];
    }
    
    return self;
}

- (MKMapView *)initalizeMapViewForLocation:(CLLocationCoordinate2D)location
{
    MKMapView *mapView = [[MKMapView alloc] init];
    [mapView setCenterCoordinate:location];
    [mapView setMapType:MKMapTypeStandard];
    [mapView setPitchEnabled:NO];
    [mapView setShowsUserLocation:YES];
    
    MKMapCamera *camera = [MKMapCamera cameraLookingAtCenterCoordinate:kMDFCenterMapLocation
                                                     fromEyeCoordinate:kMDFCenterMapLocation
                                                           eyeAltitude:kMDFMapAltitude];
    [mapView setCamera:camera];
    
    return mapView;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

@end
