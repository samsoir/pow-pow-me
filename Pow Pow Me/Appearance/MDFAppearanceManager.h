//
//  MDFAppearanceManager.h
//  Pow Pow Me
//
//  Created by Sam de Freyssinet on 27/04/2014.
//  Copyright (c) 2014 Maison de Freyssinet. All rights reserved.
//

#import <Foundation/Foundation.h>

FOUNDATION_EXPORT CGFloat const kMDFColorPowPowDarkValue;
FOUNDATION_EXPORT CGFloat const kMDFColorPowPowAccentValue;
FOUNDATION_EXPORT CGFloat const kMDFColorFullAlphaValue;
FOUNDATION_EXPORT CGFloat const kMDFColorSemiAlphaValue;

@interface MDFAppearanceManager : NSObject

#pragma mark - Paint Application Appearance

+ (void)paintApplicationAppearance;
+ (void)paintNavigationAppearance;
+ (void)paintUIButtonAppearance;

#pragma mark - Color Methods

+ (UIColor *)powPowDarkColor;
+ (UIColor *)powPowLightColor;
+ (UIColor *)powPowAccentColor;

@end
