//
//  MDFSearchInterstitialViewController.m
//  Pow Pow Me
//
//  Created by Sam de Freyssinet on 14/06/2014.
//  Copyright (c) 2014 Maison de Freyssinet. All rights reserved.
//

#import "MDFSearchInterstitialViewController.h"
#import "MDFSearchingInterstitialView.h"

@implementation MDFSearchInterstitialViewController(Presentation)

- (MDFSearchingInterstitialView *)searchViewForWindow:(CGRect)window
{
    return [[MDFSearchingInterstitialView alloc] initWithFrame:window];
}

@end

@implementation MDFSearchInterstitialViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view addSubview:[self searchViewForWindow:[self.view frame]]];
}

@end
