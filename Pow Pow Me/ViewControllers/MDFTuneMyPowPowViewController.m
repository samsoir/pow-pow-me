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
    [self setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
}

- (void)initializeTableView
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:[self.view frame] style:UITableViewStyleGrouped];
    [tableView setDataSource:self];
    [tableView setDelegate:self];

    [tableView setBackgroundColor:[UIColor darkGrayColor]];

    [self.view addSubview:tableView];
    
    self.tableView = tableView;
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

- (void)viewDidLoad
{
    [self initializeTableView];
}

#pragma mark - Actions

- (IBAction)cancel:(id)sender
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UITableViewDataSource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    static NSString *reuseIdentifier = @"net.reyssi.def:TuneMyPowPowCell";
    
    cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    if ( ! cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }

    [[cell textLabel] setText:@"Test cell"];

    return cell;
}


#pragma mark - UITableViewDelegate methods


@end
