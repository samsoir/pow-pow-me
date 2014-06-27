//
//  MDFSearchResultsViewController.m
//  Pow Pow Me
//
//  Created by Sam de Freyssinet on 19/06/2014.
//  Copyright (c) 2014 Maison de Freyssinet. All rights reserved.
//

#import "MDFSearchResultsViewController.h"
#import "MDFSearchResultsTableViewCell.h"

@implementation MDFSearchResultsViewController(Events)

- (void)didSelectRandomSearchButton:(id)sender
{
    NSLog(@"Did select: %@", sender);
}

@end

@implementation MDFSearchResultsViewController(Presentation)

+ (MDFSearchResultsTableViewCell *)searchResultCellForReuseIdentifier:(NSString *)reuseIdentifier
{
    MDFSearchResultsTableViewCell *cell = [[MDFSearchResultsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    
    return cell;
}

+ (CGRect)rectForRandomSearchButtonInFrame:(CGRect)frame
{
    CGFloat height = 53.0f;
    
    return CGRectMake(CGRectGetMinX(frame), (CGRectGetHeight(frame) - height), CGRectGetWidth(frame), height);
}

- (void)configureCell:(MDFSearchResultsTableViewCell *)cell withDict:(NSDictionary *)dict
{
    UIImage *image = [UIImage imageNamed:[dict valueForKeyPath:@"image"]];
    [cell setBackgroundImage:image];
    
    NSAttributedString *title = [MDFSearchResultsTableViewCell attributedStringForTitle:[dict valueForKey:@"title"]];
    [cell setTitle:title];
    
    NSString *durationString     = [MDFSearchResultsTableViewCell timeFormatStringForStartDate:[dict valueForKeyPath:@"duration.startDate"] endDate:[dict valueForKeyPath:@"duration.endDate"]];
    NSDecimalNumber *decimal     = [NSDecimalNumber decimalNumberWithMantissa:[[dict valueForKeyPath:@"price.value"] unsignedLongLongValue] exponent:[[dict valueForKeyPath:@"price.exponent"] shortValue] isNegative:NO];
    
    NSString *valueString        = [MDFSearchResultsTableViewCell formatCurrencyStringWithDecimalValue:decimal
                                                                                          currencyCode:[dict valueForKeyPath:@"price.currency"]
                                                                                                locale:[NSLocale currentLocale]];

    NSAttributedString *subtitle = [MDFSearchResultsTableViewCell attributedStringForDuration:durationString value:valueString];
    [cell setSubtitle:subtitle];
    
    NSAttributedString *airline = [MDFSearchResultsTableViewCell attributedStringForAirline:[dict valueForKeyPath:@"transport.outbound.carrier"]];
    [cell setAirlineTitle:airline];
}

- (void)initializeViewController
{
    [self initializeTableView];
    [self initializeRandomSelectionButton];
}

- (void)initializeNavigationItems
{
    [self.navigationItem setTitle:NSLocalizedStringFromTable(@"Pow! Pow! Me", @"Titles", @"Pow! Pow! Me")];
}

- (void)initializeTableView
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:[self.view frame] style:UITableViewStylePlain];
    
    [tableView setDelegate:self];
    [tableView setDataSource:self];
    [tableView setBackgroundColor:[UIColor darkGrayColor]];
    [tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    [self.view addSubview:tableView];
    
    self.searchResultsTableView = tableView;
}

- (void)initializeRandomSelectionButton
{
    MDFLargeCTAButton *button = [MDFLargeCTAButton largeCTAButtonWithLocalizedTitle:NSLocalizedStringFromTable(@"SurpriseMe", @"Titles", @"SurpriseMe")];
    
    [button addTarget:self
               action:@selector(didSelectRandomSearchButton:)
     forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
    self.randomSearchButton = button;
}

@end

@implementation MDFSearchResultsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil searchResults:(NSSet *)resultsSet
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self)
    {
        [self setSearchResults:[resultsSet allObjects]];

        [self initializeViewController];
    }
    
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self initializeNavigationItems];
    
    [self.randomSearchButton setFrame:[MDFSearchResultsViewController rectForRandomSearchButtonInFrame:[self.view frame]]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
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
    static NSString *reuseIdentifier = @"net.reyssi.def:SearchCellReuseIdentifier";

    MDFSearchResultsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    if ( ! cell)
    {
        cell = [MDFSearchResultsViewController searchResultCellForReuseIdentifier:reuseIdentifier];
    }
    
    [self configureCell:cell withDict:[self.searchResults objectAtIndex:indexPath.row]];
    
    return cell;
}


#pragma mark - UITableViewDelegate methods

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kMDFSearchResultsTableViewCellHeight;
}

@end
