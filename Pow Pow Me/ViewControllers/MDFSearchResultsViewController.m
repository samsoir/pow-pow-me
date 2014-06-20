//
//  MDFSearchResultsViewController.m
//  Pow Pow Me
//
//  Created by Sam de Freyssinet on 19/06/2014.
//  Copyright (c) 2014 Maison de Freyssinet. All rights reserved.
//

#import "MDFSearchResultsViewController.h"

@implementation MDFSearchResultsViewController(Presentation)

- (void)initializeViewController
{
}

- (void)initializeNavigationItems
{
    [self.navigationItem setTitle:NSLocalizedStringFromTable(@"Pow! Pow! Me", @"Titles", @"Pow! Pow! Me")];
    [self.navigationItem setLeftItemsSupplementBackButton:NO];
}

- (void)initializeTableView
{
    
}

@end

@implementation MDFSearchResultsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil searchResults:(NSSet *)resultsSet
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self)
    {
        [self setSearchResults:resultsSet];

        [self initializeViewController];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initializeNavigationItems];
}

#pragma mark - UITableViewDataSource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger numberOfRows = 0;
    
    if (self.searchResults)
    {
        numberOfRows = [self.searchResults count];
    }
    
    return numberOfRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}


#pragma mark - UITableViewDelegate methods

@end
