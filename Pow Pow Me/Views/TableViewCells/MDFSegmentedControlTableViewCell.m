//
//  MDFSegmentedControlTableViewCell.m
//  Pow Pow Me
//
//  Created by Sam de Freyssinet on 14/06/2014.
//  Copyright (c) 2014 Maison de Freyssinet. All rights reserved.
//

#import "MDFSegmentedControlTableViewCell.h"

@implementation MDFSegmentedControlTableViewCell(Layout)

- (CGRect)segmentControlRectForFrame:(CGRect)frame
{
    static CGFloat padding = 17.0f;
    CGFloat width = CGRectGetWidth(frame) - (padding * 2);
    
    return CGRectMake(padding, 0.0f, width, CGRectGetHeight(frame));
}

@end

@implementation MDFSegmentedControlTableViewCell

- (UISegmentedControl *)segmentedControl
{
    return _segmentedControl;
}

- (void)setSegmentedControl:(UISegmentedControl *)segmentedControl
{
    if (segmentedControl != _segmentedControl)
    {
        [[self segmentedControl] removeFromSuperview];
        _segmentedControl = segmentedControl;
        [[self contentView] addSubview:segmentedControl];
        [self setNeedsLayout];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [[self segmentedControl] setFrame:[self segmentControlRectForFrame:[self frame]]];
}

@end
