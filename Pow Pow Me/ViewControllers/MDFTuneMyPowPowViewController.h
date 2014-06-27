//
//  MDFTuneMyPowPowViewController.h
//  Pow Pow Me
//
//  Created by Sam de Freyssinet on 13/06/2014.
//  Copyright (c) 2014 Maison de Freyssinet. All rights reserved.
//

#ifndef __MDFTuneMyPowPowViewController__
#define __MDFTuneMyPowPowViewController__

#import <UIKit/UIKit.h>
#import "MDFLargeCTAButton.h"

FOUNDATION_EXPORT NSInteger const kMDFTuneMyPowPowViewTableControllerSections;
FOUNDATION_EXPORT NSInteger const kMDFTuneMyPowPowViewTableControllerRows;
FOUNDATION_EXPORT NSString *const kMDFTuneMyPowPowViewTableViewCellReuseIdentifier;

typedef NS_ENUM(NSInteger, MDFTuneMyPowPowSection) {
    MDFTuneMyPowPowSectionPrice        = 0,
    MDFTuneMyPowPowSectionTravelTime   = 1,
    MDFTuneMyPowPowSectionMountainTime = 2,
    MDFTuneMyPowPowSectionCTA          = 3
};

@interface MDFTuneMyPowPowViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak)   UITableView        *tableView;
@property (nonatomic, strong) UISegmentedControl *priceSegmentedControl;
@property (nonatomic, strong) UISegmentedControl *travelTimeSegmentedControl;
@property (nonatomic, strong) UISegmentedControl *mountainTimeSegmentedControl;
@property (nonatomic, strong) MDFLargeCTAButton  *ctaButton;

#pragma mark - Actions

- (IBAction)cancel:(id)sender;
- (IBAction)search:(id)sender;

@end

#endif