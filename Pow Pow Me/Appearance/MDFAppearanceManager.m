//
//  MDFAppearanceManager.m
//  Pow Pow Me
//
//  Created by Sam de Freyssinet on 27/04/2014.
//  Copyright (c) 2014 Maison de Freyssinet. All rights reserved.
//

#import "MDFAppearanceManager.h"

CGFloat const kMDFColorPowPowDarkValue   = (CGFloat) 74/255.0;
CGFloat const kMDFColorPowPowAccentValue = (CGFloat) 92/255.0;
CGFloat const kMDFColorFullAlphaValue    = (CGFloat) 1.0;
CGFloat const kMDFColorSemiAlphaValue    = (CGFloat) 0.6;

@implementation MDFAppearanceManager

#pragma mark - Paint Application Appearance

+ (void)paintApplicationAppearance
{
    [MDFAppearanceManager paintNavigationAppearance];
    [MDFAppearanceManager paintUIButtonAppearance];
}

+ (void)paintNavigationAppearance
{
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    [navigationBar setBarStyle:UIBarStyleBlack];
    [navigationBar setTintColor:[MDFAppearanceManager powPowAccentColor]];
}

+ (void)paintUIButtonAppearance
{
    UIButton *button = [UIButton appearance];
    [button setBackgroundColor:[MDFAppearanceManager powPowAccentColor]];
}

#pragma mark - Color Methods

+ (UIColor *)powPowDarkColor
{
    return [UIColor colorWithRed:kMDFColorPowPowDarkValue
                           green:kMDFColorPowPowDarkValue
                            blue:kMDFColorPowPowDarkValue
                           alpha:kMDFColorFullAlphaValue];
}

+ (UIColor *)powPowLightColor
{
    return [UIColor whiteColor];
}

+ (UIColor *)powPowAccentColor
{
    return [UIColor colorWithRed:kMDFColorFullAlphaValue
                           green:kMDFColorPowPowAccentValue
                            blue:kMDFColorPowPowAccentValue
                           alpha:kMDFColorFullAlphaValue];
}

@end
