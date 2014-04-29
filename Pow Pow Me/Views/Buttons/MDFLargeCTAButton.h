//
//  MDFLargeCTAButton.h
//  Pow Pow Me
//
//  Created by Sam de Freyssinet on 28/04/2014.
//  Copyright (c) 2014 Maison de Freyssinet. All rights reserved.
//

#import <UIKit/UIKit.h>

#ifndef __MDFLargeCTAButton__
#define __MDFLargeCTAButton__

FOUNDATION_EXPORT CGFloat const kMDFLargeCTAButtonHeight;
FOUNDATION_EXPORT CGFloat const kMDFLargeCTAButtonFontSize;

@interface MDFLargeCTAButton : UIButton

#pragma mark - Factory Methods

+ (UIColor *)colorForNormalState;
+ (UIColor *)colorForSelectedState;

+ (id)largeCTAButtonWithLocalizedTitle:(NSString *)localizedTitle;

#pragma mark - Text Attributes

+ (NSAttributedString *)boldSystemFontForString:(NSString *)string
                                           size:(CGFloat)size
                                          color:(UIColor *)colorOrNil;

@end

#endif