//
//  MDFRootViewController.m
//  Pow Pow Me
//
//  Created by Sam de Freyssinet on 27/04/2014.
//  Copyright (c) 2014 Maison de Freyssinet. All rights reserved.
//

#import "MDFRootViewController.h"
#import "MDFWelcomeViewController.h"

@implementation MDFRootViewController(MainViewMethods)

- (UINavigationController *)mainNavigationController:(UIViewController *)rootViewController
{
    return [[UINavigationController alloc] initWithRootViewController:rootViewController];
}

- (MDFWelcomeViewController *)initializeWelcomeViewController
{
    return [[MDFWelcomeViewController alloc] initWithNibName:nil bundle:nil];
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

@end
