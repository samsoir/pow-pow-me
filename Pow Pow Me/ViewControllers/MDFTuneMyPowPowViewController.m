//
//  MDFTuneMyPowPowViewController.m
//  Pow Pow Me
//
//  Created by Sam de Freyssinet on 13/06/2014.
//  Copyright (c) 2014 Maison de Freyssinet. All rights reserved.
//

#import "MDFTuneMyPowPowViewController.h"

@implementation MDFTuneMyPowPowViewController(Presentation)

- (void)initializeViewController
{
    [self.navigationItem setTitle:NSLocalizedStringFromTable(@"TuneMyPowPow", @"Titles", @"TuneMyPowPow")];
    [self initializeCancelButton];
}

- (void)initializeCancelButton
{
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                                  target:self
                                                                                  action:@selector(cancel:)];
    [self.navigationItem setRightBarButtonItem:cancelButton];
}

@end

@implementation MDFTuneMyPowPowViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self)
    {
        [self initializeViewController];
    }
    
    return self;
}

#pragma mark - Actions

- (IBAction)cancel:(id)sender
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

@end
