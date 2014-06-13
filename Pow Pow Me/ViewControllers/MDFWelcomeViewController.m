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

NSString *const kMDFWelcomeViewControllerDidTouchPowPowMeNotification = @"net.reyssi.def:kMDFWelcomeViewControllerDidTouchPowPowMeNotification";

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
        [self showStatusBarWithNumberOfResults:[results count]];
    }
}

- (void)sendButtonTouchUpNotification:(NSString *)name sender:(id)sender
{
    NSNotification *notification = [NSNotification notificationWithName:name object:sender];
    [[NSNotificationCenter defaultCenter] postNotification:notification];
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

- (void)initializeStatusBar
{
    CGRect navigationBarFrame = [self.navigationController.navigationBar frame];

    CGRect statusBarFrame   = CGRectMake(0.0,
                                         CGRectGetHeight(navigationBarFrame)+20,
                                         CGRectGetWidth(navigationBarFrame),
                                         44.0f);
    
    MDFStatusBar *statusBar = [[MDFStatusBar alloc] initWithFrame:statusBarFrame title:nil];
    
    [self.view insertSubview:statusBar aboveSubview:self.mapView];
    [statusBar setStatusBarText:NSLocalizedStringFromTable(@"Loading adventures", @"Titles", @"Loading adventures")];
    self.statusBar = statusBar;
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

- (void)positionView:(UIView *)lowerView belowView:(UIView *)upperView padding:(CGFloat)padding
{
    CGRect upperViewFrame = [upperView frame];
    CGRect lowerViewFrame = [lowerView frame];
    
    CGRect newLowerViewFrame = CGRectMake(CGRectGetMinX(lowerViewFrame),
                                          CGRectGetHeight(upperViewFrame)+padding,
                                          CGRectGetWidth(lowerViewFrame),
                                          CGRectGetHeight(lowerViewFrame));
    
    [lowerView setFrame:newLowerViewFrame];
}

- (void)viewDidLoad
{
    [self initializeMapView];
    [self initializeStatusBar];
    [self initializePowPowMeButton];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self registerForNotifications];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [self unsubscribeFromNotifications];
    
    [super viewDidDisappear:animated];
}

- (void)showStatusBarWithNumberOfResults:(NSUInteger)numberOfResults
{
    NSString *resultsTitle = [NSString stringWithFormat:NSLocalizedStringFromTable(@"possibe powder adventures", @"Titles", "possibe powder adventures"), numberOfResults];
    
    [self.statusBar setStatusBarText:resultsTitle];
    [self.statusBar showStatusBar:YES completion:^{
        
        NSLog(@"Status bar: %@", self.statusBar);
        
    }];
}

#pragma mark - Actions

- (IBAction)powPowMe:(id)sender
{
    [self sendButtonTouchUpNotification:kMDFWelcomeViewControllerDidTouchPowPowMeNotification sender:sender];
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
