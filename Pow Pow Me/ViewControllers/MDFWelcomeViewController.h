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

@interface MDFWelcomeViewController : UIViewController <MKMapViewDelegate>

@property (nonatomic, strong) MKMapView *mapView;
@property (nonatomic, strong) UIButton *ctaButton;
@property (nonatomic, strong) NSOperationQueue *operationQueue;

#pragma mark - Factory Methods

+ (UIButton *)ctaButtonWithLocalizedTitle:(NSString *)localizedTitle;
+ (UIBarButtonItem *)barButtonItemWithLocalizedTitle:(NSString *)localizedTitle target:(id)target action:(SEL)selector;

#pragma mark - Presentation Methods

- (MKMapView *)initalizeMapViewForLocation:(CLLocationCoordinate2D)location;
- (void)positionButton:(UIButton *)button bottomOfFrame:(CGRect)frame;

#pragma mark - Actions

- (IBAction)powPowMe:(id)sender;
- (IBAction)accountManagement:(id)sender;
- (IBAction)help:(id)sender;

#pragma mark - MKMapViewDelegate Methods

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation;

@end
