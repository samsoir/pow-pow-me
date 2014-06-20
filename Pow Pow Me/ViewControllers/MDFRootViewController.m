//
//  MDFRootViewController.m
//  Pow Pow Me
//
//  Created by Sam de Freyssinet on 27/04/2014.
//  Copyright (c) 2014 Maison de Freyssinet. All rights reserved.
//

#import "MDFRootViewController.h"
#import "MDFWelcomeViewController.h"
#import "MDFTuneMyPowPowViewController.h"
#import "MDFSearchResultsViewController.h"
#import "MDFFetchSearchResultsContext.h"

@interface MDFRootViewController(MainViewMethods)

- (UINavigationController *)mainNavigationController:(UIViewController *)rootViewController;
- (MDFWelcomeViewController *)initializeWelcomeViewController;
- (MDFTuneMyPowPowViewController *)initalizeTuneMyPowPowViewController;
- (MDFSearchResultsViewController *)initializeSearchResultsViewControllerWithResultSet:(NSSet *)resultSet;

@end

@interface MDFRootViewController(Presentation)

- (void)presentSearchResultsControllerWithResultSet:(NSSet *)resultSet;

@end

@implementation MDFRootViewController(Events)

- (void)registerForNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didReceiveTuneMyPowPowNotification:)
                                                 name:kMDFWelcomeViewControllerDidTouchPowPowMeNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didReceiveSearchCompletionNotification:) name:kMDFFetchSearchResultsContextDidCompleteNotification
                                               object:nil];
}

- (void)unsubscribeFromNotifications
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveTuneMyPowPowNotification:(NSNotification *)notification
{
    MDFTuneMyPowPowViewController *controller = [self initalizeTuneMyPowPowViewController];

    [self presentViewController:[self mainNavigationController:controller] animated:YES completion:nil];
}

- (void)didReceiveSearchCompletionNotification:(NSNotification *)notification
{
    NSLog(@"Received notification: %@", notification);
    
    [self presentSearchResultsControllerWithResultSet:notification.object];
}

@end

@implementation MDFRootViewController(MainViewMethods)

- (UINavigationController *)mainNavigationController:(UIViewController *)rootViewController
{
    return [[UINavigationController alloc] initWithRootViewController:rootViewController];
}

- (MDFWelcomeViewController *)initializeWelcomeViewController
{
    return [[MDFWelcomeViewController alloc] initWithNibName:nil bundle:nil];
}

- (MDFTuneMyPowPowViewController *)initalizeTuneMyPowPowViewController
{
    return [[MDFTuneMyPowPowViewController alloc] initWithNibName:nil bundle:nil];
}

- (MDFSearchResultsViewController *)initializeSearchResultsViewControllerWithResultSet:(NSSet *)resultSet;
{
    return [[MDFSearchResultsViewController alloc] initWithNibName:nil
                                                            bundle:nil
                                                     searchResults:resultSet];
}

@end

@implementation MDFRootViewController(Presentation)

- (void)presentSearchResultsControllerWithResultSet:(NSSet *)resultSet
{
    MDFSearchResultsViewController *searchResultsController = [self initializeSearchResultsViewControllerWithResultSet:resultSet];
    
    [self.navigationController pushViewController:searchResultsController animated:NO];
}
@end

@implementation MDFRootViewController

#pragma mark - Class Initialization Methods

+ (id)rootViewController
{
    static id rootViewController = nil;
    
    if ( ! rootViewController)
    {
        @synchronized(self)
        {
            rootViewController = [[MDFRootViewController alloc] initWithNibName:nil bundle:nil];
        }
    }
    
    return rootViewController;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self)
    {
        [self setNavigationController:[self mainNavigationController:[self initializeWelcomeViewController]]];
        [self.view addSubview:[self.navigationController view]];
    }
    
    return self;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self registerForNotifications];
}

- (void)dealloc
{
    [self unsubscribeFromNotifications];
}

@end
