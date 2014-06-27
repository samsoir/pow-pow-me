//
//  MDFSearchResultsViewController.h
//  Pow Pow Me
//
//  Created by Sam de Freyssinet on 19/06/2014.
//  Copyright (c) 2014 Maison de Freyssinet. All rights reserved.
//

#ifndef __MDFSearchResultsViewController__
#define __MDFSearchResultsViewController__

#import <UIKit/UIKit.h>
#import "MDFLargeCTAButton.h"

@interface MDFSearchResultsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *searchResultsTableView;
@property (nonatomic, strong) UIButton    *surpriseMeButton;
@property (nonatomic, copy)   NSArray     *searchResults;
@property (nonatomic, strong) MDFLargeCTAButton *randomSearchButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil searchResults:(NSSet *)resultsSet;

@end

#endif