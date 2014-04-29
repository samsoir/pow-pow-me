//
//  MDFWelcomeViewController.m
//  Pow Pow Me
//
//  Created by Sam de Freyssinet on 27/04/2014.
//  Copyright (c) 2014 Maison de Freyssinet. All rights reserved.
//

#import "MDFWelcomeViewController.h"
#import "MDFLargeCTAButton.h"
#import "MDFFetchGlobalSearchResultsContext.h"
#import "MDFDictionaryToAnnotationDecorator.h"
#import "MDFPPMMockClient.h"

CLLocationCoordinate2D const kMDFCenterMapLocation = {39.828127, -98.579404};
CLLocationDistance const kMDFMapAltitude = (CLLocationDistance)15000000.0;

@implementation MDFWelcomeViewController(Events)

- (void)registerForNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didReceieveFetchGlobalSearchResultsCompleted:)
                                                 name:kMDFFetchGlobalSearchResultsContextCompleted
                                               object:nil];
}

- (void)unsubscribeFromNotifications
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceieveFetchGlobalSearchResultsCompleted:(NSNotification *)notification
{
    NSArray *results = (NSArray *)[notification object];

    if (results)
    {
        [self.mapView addAnnotations:results];
    }
}

@end

@implementation MDFWelcomeViewController(Operations)

- (void)loadGlobalSearchResults
{
    id<MDFPPMClientProtocol> client = [[MDFPPMMockClient alloc] init];
    
    MDFFetchGlobalSearchResultsContext *context = [[MDFFetchGlobalSearchResultsContext alloc] initWithClient:client decorator:[MDFDictionaryToAnnotationDecorator class]];
    
    [self.operationQueue addOperation:context];
}

@end

@implementation MDFWelcomeViewController(Presentation)

- (void)initializeViewController
{
    [self.navigationItem setTitle:NSLocalizedStringFromTable(@"PowPowMe", @"Titles", @"PowPowMe")];
    [self initializeAccountManagementButton];
    [self initializeHelpButton];
    [self initializeOperationQueue];
}

- (void)initializeOperationQueue
{
    self.operationQueue = [[NSOperationQueue alloc] init];
}

- (void)initializeMapView
{
    self.mapView = [self initalizeMapViewForLocation:kMDFCenterMapLocation];
    [self.mapView setFrame:[self.view frame]];
    [self.mapView setDelegate:self];
    [self.view addSubview:self.mapView];
    
    [self loadGlobalSearchResults];
}

- (void)initializePowPowMeButton
{
    NSString *buttonTitleForNormalState = NSLocalizedStringFromTable(@"PowPowMe", @"Titles", @"PowPowMe");
    CGRect window = [self.view frame];
    
    UIButton *ctaButton = [MDFWelcomeViewController ctaButtonWithLocalizedTitle:buttonTitleForNormalState];
    
    [ctaButton addTarget:self
                  action:@selector(powPowMe:)
        forControlEvents:UIControlEventTouchUpInside];
    
    [self positionButton:ctaButton bottomOfFrame:window];

    [self.view addSubview:ctaButton];
    self.ctaButton = ctaButton;
}

- (void)initializeAccountManagementButton
{
    NSString *title = NSLocalizedStringFromTable(@"Me", @"Titles", @"Me");
    UIBarButtonItem *barButtonItem = [MDFWelcomeViewController barButtonItemWithLocalizedTitle:title
                                                                                        target:self
                                                                                        action:@selector(accountManagement:)];
    
    [self.navigationItem setLeftBarButtonItem:barButtonItem];
}

- (void)initializeHelpButton
{
    NSString *title = NSLocalizedStringFromTable(@"Help", @"Titles", @"Help");
    UIBarButtonItem *barButtonItem = [MDFWelcomeViewController barButtonItemWithLocalizedTitle:title
                                                                                        target:self
                                                                                        action:@selector(help:)];
    
    [self.navigationItem setRightBarButtonItem:barButtonItem];
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

#pragma mark - Factory Methods

+ (UIButton *)ctaButtonWithLocalizedTitle:(NSString *)localizedTitle
{
    return [MDFLargeCTAButton largeCTAButtonWithLocalizedTitle:localizedTitle];
}

+ (UIBarButtonItem *)barButtonItemWithLocalizedTitle:(NSString *)localizedTitle target:(id)target action:(SEL)selector
{
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithTitle:localizedTitle style:UIBarButtonItemStylePlain
                                                                     target:target
                                                                     action:selector];
    
    return barButtonItem;
}

#pragma mark - Presentation Methods

- (MKMapView *)initalizeMapViewForLocation:(CLLocationCoordinate2D)location
{
    MKMapView *mapView = [[MKMapView alloc] init];
    [mapView setCenterCoordinate:location];
    [mapView setMapType:MKMapTypeStandard];
    [mapView setPitchEnabled:NO];
    
    MKMapCamera *camera = [MKMapCamera cameraLookingAtCenterCoordinate:kMDFCenterMapLocation
                                                     fromEyeCoordinate:kMDFCenterMapLocation
                                                           eyeAltitude:kMDFMapAltitude];
    [mapView setCamera:camera];
    
    return mapView;
}

- (void)positionButton:(UIButton *)button bottomOfFrame:(CGRect)frame
{
    CGRect buttonFrame = CGRectMake(CGRectGetMinX(frame), CGRectGetMaxY(frame)-kMDFLargeCTAButtonHeight, CGRectGetWidth(frame), kMDFLargeCTAButtonHeight);
    
    [button setFrame:buttonFrame];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self registerForNotifications];
    [self initializeMapView];
    [self initializePowPowMeButton];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [self unsubscribeFromNotifications];
    
    [super viewDidDisappear:animated];
}

#pragma mark - Actions

- (IBAction)powPowMe:(id)sender
{
    NSLog(@"Button was pushed: %@", sender);
}

- (IBAction)accountManagement:(id)sender
{
    NSLog(@"BarButton was pushed: %@", sender);
}

- (IBAction)help:(id)sender
{
    NSLog(@"BarButton was pushed: %@", sender);
}

#pragma mark - MKMapViewDelegate Methods

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    static NSString *identifier = @"testID";
    MKAnnotationView *testView  = [mapView dequeueReusableAnnotationViewWithIdentifier:@"testID"];
    
    if ( ! testView)
    {
        testView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        [testView setImage:[UIImage imageNamed:@"MapBoarder"]];
        [testView setCenterOffset:CGPointMake(0.0f, -22.0f)];
    }
    
    return testView;
}

@end
