//
//  MDFWelcomeViewController.h
//  Pow Pow Me
//
//  Created by Sam de Freyssinet on 27/04/2014.
//  Copyright (c) 2014 Maison de Freyssinet. All rights reserved.
//

#ifndef __MDFWelcomeViewController__
#define __MDFWelcomeViewController__

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "MDFStatusBar.h"

FOUNDATION_EXPORT CLLocationCoordinate2D const kMDFCenterMapLocation;
FOUNDATION_EXPORT CLLocationDistance const kMDFMapAltitude;

FOUNDATION_EXPORT NSString *const kMDFWelcomeViewControllerDidTouchPowPowMeNotification;

@interface MDFWelcomeViewController : UIViewController <MKMapViewDelegate>

@property (nonatomic, weak) MKMapView *mapView;
@property (nonatomic, weak) UIButton *ctaButton;
@property (nonatomic, strong) NSOperationQueue *operationQueue;
@property (nonatomic, weak) MDFStatusBar *statusBar;

#pragma mark - Factory Methods

+ (UIButton *)ctaButtonWithLocalizedTitle:(NSString *)localizedTitle;
+ (UIBarButtonItem *)barButtonItemWithLocalizedTitle:(NSString *)localizedTitle target:(id)target action:(SEL)selector;

#pragma mark - Presentation Methods

- (MKMapView *)initalizeMapViewForLocation:(CLLocationCoordinate2D)location;
- (void)positionButton:(UIButton *)button bottomOfFrame:(CGRect)frame;
- (void)positionView:(UIView *)lowerView belowView:(UIView *)upperView padding:(CGFloat)padding;
- (void)showStatusBarWithNumberOfResults:(NSUInteger)numberOfResults;

#pragma mark - Actions

- (IBAction)powPowMe:(id)sender;
- (IBAction)accountManagement:(id)sender;
- (IBAction)help:(id)sender;

#pragma mark - MKMapViewDelegate Methods

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation;

@end

#endif
