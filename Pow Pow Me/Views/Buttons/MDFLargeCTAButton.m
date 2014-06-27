//
//  MDFLargeCTAButton.m
//  Pow Pow Me
//
//  Created by Sam de Freyssinet on 28/04/2014.
//  Copyright (c) 2014 Maison de Freyssinet. All rights reserved.
//

#import "MDFLargeCTAButton.h"

CGFloat const kMDFLargeCTAButtonHeight   = 53.0f;
CGFloat const kMDFLargeCTAButtonFontSize = 23.0f;

@implementation MDFLargeCTAButton

#pragma mark - Factory Methods

+ (UIColor *)colorForNormalState
{
    return [UIColor colorWithRed:1.0f
                           green:1.0f
                            blue:1.0f
                           alpha:1.0f];
}

+ (UIColor *)colorForSelectedState
{
    return [UIColor colorWithRed:(74/255.0)
                           green:(74/255.0)
                            blue:(74/255.0)
                           alpha:1.0f];
}


+ (id)largeCTAButtonWithLocalizedTitle:(NSString *)localizedTitle
{
    MDFLargeCTAButton *button = [MDFLargeCTAButton buttonWithType:UIButtonTypeCustom];
    [button setAttributedTitle:[MDFLargeCTAButton boldSystemFontForString:NSLocalizedStringFromTable(localizedTitle, @"Titles", localizedTitle)
                                                                     size:kMDFLargeCTAButtonFontSize color:[MDFLargeCTAButton colorForNormalState]] forState:UIControlStateNormal];
    
    [button setAttributedTitle:[MDFLargeCTAButton boldSystemFontForString:NSLocalizedStringFromTable(localizedTitle, @"Titles", localizedTitle)
                                                                     size:kMDFLargeCTAButtonFontSize color:[MDFLargeCTAButton colorForSelectedState]] forState:UIControlStateHighlighted];
    
    return button;
}

#pragma mark - Text Attributes

+ (NSAttributedString *)boldSystemFontForString:(NSString *)string size:(CGFloat)size color:(UIColor *)colorOrNil
{
    if ( ! colorOrNil)
    {
        colorOrNil = [MDFLargeCTAButton colorForNormalState];
    }
    
    NSDictionary *attributes = @{
                                 NSFontAttributeName: [UIFont boldSystemFontOfSize:size],
                                 NSForegroundColorAttributeName: colorOrNil
                                 };

    return [[NSAttributedString alloc] initWithString:string attributes:attributes];
}

@end
