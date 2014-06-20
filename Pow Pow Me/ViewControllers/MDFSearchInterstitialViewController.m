//
//  MDFSearchInterstitialViewController.m
//  Pow Pow Me
//
//  Created by Sam de Freyssinet on 14/06/2014.
//  Copyright (c) 2014 Maison de Freyssinet. All rights reserved.
//

#import "MDFSearchInterstitialViewController.h"
#import "MDFSearchingInterstitialView.h"
#import "MDFPPMMockClient.h"
#import "MDFFetchSearchResultsContext.h"

@implementation MDFSearchInterstitialViewController(Notifications)

- (void)registerForNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didReceiveSearchCompletionNotification:)
                                                 name:kMDFFetchSearchResultsContextDidCompleteNotification
                                               object:nil];
}

- (void)unsubscribeToNotifications
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveSearchCompletionNotification:(NSNotification *)notification
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

@implementation MDFSearchInterstitialViewController(Presentation)

- (MDFSearchingInterstitialView *)searchViewForWindow:(CGRect)window
{
    return [[MDFSearchingInterstitialView alloc] initWithFrame:window];
}

- (void)performSearchForTrips:(NSDictionary *)options
{
    MDFPPMMockClient *client = [[MDFPPMMockClient alloc] init];
    
    MDFFetchSearchResultsContext *context = [[MDFFetchSearchResultsContext alloc] initWithClient:client
                                                                                        location:MDFClient2DGeoLocationMake(0.0, 0.0)
                                                                                         options:options];
    
    [self.operationQueue performSelector:@selector(addOperation:)
                              withObject:context
                              afterDelay:kMDFFetchSearchResultsNetworkSimulationDuration];
}

@end

@implementation MDFSearchInterstitialViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self)
    {
        self.operationQueue = [[NSOperationQueue alloc] init];
        
        [self registerForNotifications];
    }
    
    return self;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self performSearchForTrips:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view addSubview:[self searchViewForWindow:[self.view frame]]];
}

- (void)dealloc
{
    [self unsubscribeToNotifications];
}

@end
