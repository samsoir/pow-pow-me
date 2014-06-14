//
//  MDFTuneMyPowPowViewController.m
//  Pow Pow Me
//
//  Created by Sam de Freyssinet on 13/06/2014.
//  Copyright (c) 2014 Maison de Freyssinet. All rights reserved.
//

#import "MDFTuneMyPowPowViewController.h"
#import "MDFSegmentedControlTableViewCell.h"

NSInteger const kMDFTuneMyPowPowViewTableControllerSections      = 4;
NSInteger const kMDFTuneMyPowPowViewTableControllerRows          = 1;
NSString *const kMDFTuneMyPowPowViewTableViewCellReuseIdentifier = @"net.reyssi.def:TuneMyPowPowCell";


@implementation MDFTuneMyPowPowViewController(Presentation)

- (void)initializeViewController
{
    [self.navigationItem setTitle:NSLocalizedStringFromTable(@"TuneMyPowPow", @"Titles", @"TuneMyPowPow")];
    [self initializeCancelButton];
    [self setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
    [self initializeSegmentedControls];
    [self initializeSearchButton];
}

- (void)initializeTableView
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:[self.view frame] style:UITableViewStyleGrouped];
    [tableView setDataSource:self];
    [tableView setDelegate:self];
    [tableView setBackgroundColor:[UIColor darkGrayColor]];
    [tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    

    [self.view addSubview:tableView];
    
    self.tableView = tableView;
}

- (void)initializeSearchButton
{
    CGRect frame = CGRectMake(17.0f, 0.0f, 286.0f, 44.0f);
    MDFLargeCTAButton *button = [MDFLargeCTAButton largeCTAButtonWithLocalizedTitle:NSLocalizedStringFromTable(@"LetsGo", @"Titles", @"LetsGo")];
    
    [button setFrame:frame];
    
    [button addTarget:self
               action:@selector(search:)
     forControlEvents:UIControlEventTouchUpInside];
    
    [[button layer] setCornerRadius:4.0f];
    
    self.ctaButton = button;
}

- (void)initializeCancelButton
{
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                                  target:self
                                                                                  action:@selector(cancel:)];
    [self.navigationItem setRightBarButtonItem:cancelButton];
}

- (void)initializeSegmentedControls
{
    self.priceSegmentedControl        = [self segmentedControlWithItems:[self segmentItemsForPrice]];
    self.travelTimeSegmentedControl   = [self segmentedControlWithItems:[self segmentItemsForTravelTime]];
    self.mountainTimeSegmentedControl = [self segmentedControlWithItems:[self segmentItemsForMountainTime]];
}

- (UIView *)viewForTableHeaderWithTitle:(NSString *)title
{
    UIView *tableViewCellHeader = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 60.0)];
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(17.0, 8.0, 303.0, 44.0)];
    [headerLabel setBackgroundColor:[UIColor clearColor]];
    [headerLabel setTextColor:[UIColor whiteColor]];
    [headerLabel setText:title];
    [headerLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:22.0f]];
    
    [tableViewCellHeader addSubview:headerLabel];
    
    return tableViewCellHeader;
}

- (UIView *)viewForTableFooterWithTitle:(NSString *)title
{
    UIView *tableViewCellFooter = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 30.0)];
    UILabel *footerLabel = [[UILabel alloc] initWithFrame:CGRectMake(17.0, 8.0, 303.0, 20.0)];
    [footerLabel setBackgroundColor:[UIColor clearColor]];
    [footerLabel setTextColor:[UIColor whiteColor]];
    [footerLabel setText:title];
    [footerLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:13.0f]];
    
    [tableViewCellFooter addSubview:footerLabel];
    
    return tableViewCellFooter;
}

- (NSString *)titleForHeaderInSection:(NSInteger)section
{
    NSString *title = nil;
    
    switch (section) {
        case MDFTuneMyPowPowSectionPrice:
            title = @"Price";
            break;
        case MDFTuneMyPowPowSectionTravelTime:
            title = @"Travel time";
            break;
        case MDFTuneMyPowPowSectionMountainTime:
            title = @"Time on the mountain";
            break;
    }
    
    return title;
}

- (NSString *)titleForFooterInSection:(NSInteger)section
{
    NSString *title = nil;
    
    switch (section) {
        case MDFTuneMyPowPowSectionPrice:
            title = @"The full price of the trip will be confirmed later";
            break;
        case MDFTuneMyPowPowSectionTravelTime:
            title = @"Travel time from your current city by road, rail or air.";
            break;
        case MDFTuneMyPowPowSectionMountainTime:
            title = @"The duration of the trip. Exact time away will vary.";
            break;
    }
    
    return title;
}

- (NSArray *)segmentItemsForSection:(NSInteger)section
{
    NSArray *segmentItems = nil;
    
    switch (section) {
        case MDFTuneMyPowPowSectionPrice:
            segmentItems = [self segmentItemsForPrice];
            break;
        case MDFTuneMyPowPowSectionTravelTime:
            segmentItems = [self segmentItemsForTravelTime];
            break;
        case MDFTuneMyPowPowSectionMountainTime:
            segmentItems = [self segmentItemsForMountainTime];
            break;
    }

    return segmentItems;
}

- (void)configureSegmentedCell:(id<MDFSegmentedControlTableViewCell>)cell atIndexPath:(NSIndexPath *)indexPath
{
    NSInteger section = indexPath.section;
    
    switch (section) {
        case MDFTuneMyPowPowSectionPrice:
            [cell setSegmentedControl:self.priceSegmentedControl];
            break;
        case MDFTuneMyPowPowSectionTravelTime:
            [cell setSegmentedControl:self.travelTimeSegmentedControl];
            break;
        case MDFTuneMyPowPowSectionMountainTime:
            [cell setSegmentedControl:self.mountainTimeSegmentedControl];
            break;
    }
}

- (id<MDFSegmentedControlTableViewCell>)cellForSegmentedControl
{
    return [[MDFSegmentedControlTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
}

- (UITableViewCell *)cellForCallToAction
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    [cell addSubview:self.ctaButton];
    
    return cell;
}

- (UISegmentedControl *)segmentedControlWithItems:(NSArray *)items
{
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:items];
    return segmentedControl;
}

- (NSArray *)segmentItemsForPrice
{
    NSString *lowPrice = NSLocalizedStringFromTable(@"lowPrice", @"Titles", @"$");
    NSString *averagePrice = NSLocalizedStringFromTable(@"averagePrice", @"Titles", @"$$");
    NSString *highPrice = NSLocalizedStringFromTable(@"highPrice", @"Titles", @"$$$");
    
    [lowPrice setAccessibilityLabel:NSLocalizedStringFromTable(@"lowPriceRange", @"Titles", @"low price range")];
    [averagePrice setAccessibilityLabel:NSLocalizedStringFromTable(@"averagePriceRange", @"Titles", @"average price range")];
    [highPrice setAccessibilityLabel:NSLocalizedStringFromTable(@"highPriceRange", @"Titles", @"high price range")];
    
    return @[lowPrice, averagePrice, highPrice];
}

- (NSArray *)segmentItemsForTravelTime
{
    NSString *oneToTwoHours = NSLocalizedStringFromTable(@"1-2hours", @"Titles", @"1-2hours");
    NSString *threeToFiveHours = NSLocalizedStringFromTable(@"3-5hours", @"Titles", @"3-5hours");
    NSString *fivePlusHours = NSLocalizedStringFromTable(@"5+hours", @"Titles", @"5+hours");
    
    [oneToTwoHours setAccessibilityLabel:NSLocalizedStringFromTable(@"one to two hours travel time", @"Titles", "1-2 hours travels")];
    [threeToFiveHours setAccessibilityLabel:NSLocalizedStringFromTable(@"three to five hours travel time", @"Titles", "3-5 hours travels")];
    [fivePlusHours setAccessibilityLabel:NSLocalizedStringFromTable(@"five or more hours travel time", @"Titles", @"5+ hours")];
    
    return @[oneToTwoHours, threeToFiveHours, fivePlusHours];
}

- (NSArray *)segmentItemsForMountainTime
{
    NSString *weekend = NSLocalizedStringFromTable(@"weekend", @"Titles", @"weekend");
    NSString *longWeekend = NSLocalizedStringFromTable(@"long weekend", @"Titles", @"long weekend");
    NSString *week = NSLocalizedStringFromTable(@"week", @"Titles", @"week");

    [weekend setAccessibilityLabel:NSLocalizedStringFromTable(@"weekendOnMountain", @"Titles", @"weekend on the mountain")];
    [longWeekend setAccessibilityLabel:NSLocalizedStringFromTable(@"longWeekendOnMountain", @"Titles", @"long weekend on the mountain")];
    [week setAccessibilityLabel:NSLocalizedStringFromTable(@"weekOnMountain", @"Titles", @"week or more on the mountain")];
    
    return @[weekend, longWeekend, week];
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

- (void)viewDidLoad
{
    [self initializeTableView];
}

- (void)dealloc
{
    [self.ctaButton removeTarget:self
                          action:@selector(search:)
                forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - Actions

- (IBAction)cancel:(id)sender
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)search:(id)sender
{
    NSLog(@"Search button pushed: %@", sender);
}

#pragma mark - UITableViewDataSource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return kMDFTuneMyPowPowViewTableControllerRows;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return kMDFTuneMyPowPowViewTableControllerSections;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [self titleForHeaderInSection:section];
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return [self titleForFooterInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id cell = nil;
    NSInteger section     = indexPath.section;
    
    if (section < MDFTuneMyPowPowSectionCTA)
    {
        cell = [self cellForSegmentedControl];
        [self configureSegmentedCell:cell atIndexPath:indexPath];
    }
    else
    {
        cell = [self cellForCallToAction];
    }
    
    return (UITableViewCell *)cell;
}


#pragma mark - UITableViewDelegate methods

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [cell setBackgroundColor:[UIColor clearColor]];
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 34.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    CGFloat height = 20.0f;
    
    if (section < MDFTuneMyPowPowSectionCTA)
    {
        height = 60.f;
    }
    
    return height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    CGFloat height = 10.0f;
    
    if (section < MDFTuneMyPowPowSectionCTA)
    {
        height = 30.f;
    }
    
    return height;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [self viewForTableHeaderWithTitle:[self tableView:tableView titleForHeaderInSection:section]];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [self viewForTableFooterWithTitle:[self tableView:tableView titleForFooterInSection:section]];
}

@end
