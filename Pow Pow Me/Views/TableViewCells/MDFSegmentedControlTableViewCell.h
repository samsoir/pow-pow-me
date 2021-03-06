//
//  MDFSegmentedControlTableViewCell.h
//  Pow Pow Me
//
//  Created by Sam de Freyssinet on 14/06/2014.
//  Copyright (c) 2014 Maison de Freyssinet. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MDFSegmentedControlTableViewCell <NSObject>

- (UISegmentedControl *)segmentedControl;
- (void)setSegmentedControl:(UISegmentedControl *)segmentedControl;

@end

@interface MDFSegmentedControlTableViewCell : UITableViewCell <MDFSegmentedControlTableViewCell>{
    UISegmentedControl *_segmentedControl;
}

- (UISegmentedControl *)segmentedControl;
- (void)setSegmentedControl:(UISegmentedControl *)segmentedControl;

@end
