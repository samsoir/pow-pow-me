//
//  MDFAppDelegate.m
//  Pow Pow Me
//
//  Created by Sam de Freyssinet on 27/04/2014.
//  Copyright (c) 2014 Maison de Freyssinet. All rights reserved.
//

#import "MDFAppDelegate.h"
#import "MDFAppearanceManager.h"
#import "MDFRootViewController.h"

@implementation MDFAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [MDFAppearanceManager paintApplicationAppearance];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.

    [self.window setRootViewController:[self powPowRootViewController]];
    
    self.window.backgroundColor = [UIColor colorWithRed:(74/255.0) green:(74/255.0) blue:(74/255.0) alpha:1.0];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Pow Pow RootViewController

- (UIViewController *)powPowRootViewController
{
    return [MDFRootViewController rootViewController];
}

#ifdef CALABASH

- (NSString *)authenticateWithAccessToken:(NSString *)accessToken
{
    NSString *tokenReceivedString = [NSString stringWithFormat:@"Executed authenticateWithAccessToken: with \"%@\"", accessToken];
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Backdoor"
                                                        message:tokenReceivedString
                                                       delegate:nil
                                              cancelButtonTitle:@"Dismiss"
                                              otherButtonTitles:nil];
    
    [alertView show];
    
    return tokenReceivedString;
}

#endif

@end
