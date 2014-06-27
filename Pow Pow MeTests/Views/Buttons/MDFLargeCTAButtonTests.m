//
//  MDFLargeCTAButtonTests.m
//  Pow Pow Me
//
//  Created by Sam de Freyssinet on 28/04/2014.
//  Copyright (c) 2014 Maison de Freyssinet. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MDFLargeCTAButton.h"
#import "MDFAppearanceManager.h"

@interface MDFLargeCTAButtonTests : XCTestCase

@end

@implementation MDFLargeCTAButtonTests

- (void)testLargeCTAButtonWithLocalizedTitleFactory
{
    MDFLargeCTAButton *subject = [MDFLargeCTAButton largeCTAButtonWithLocalizedTitle:@"PowPowMe"];
    
    NSAttributedString *title = [subject attributedTitleForState:UIControlStateNormal];
    
    XCTAssertEqual([title string], NSLocalizedStringFromTable(@"PowPowMe", @"Titles", @"PowPowMe"), @"Localized title should match Titles strings table");
}

- (void)testBoldSystemFontForStringSize
{
    NSString *testString   = @"Test String";
    CGFloat size           = 14.0;
    UIColor *color         = [MDFAppearanceManager powPowLightColor];
    
    NSDictionary *normalAttributes = @{
                                 NSFontAttributeName: [UIFont boldSystemFontOfSize:size],
                                 NSForegroundColorAttributeName: color
                                 };

    NSAttributedString *normalAttrString = [MDFLargeCTAButton boldSystemFontForString:testString
                                                                           size:size
                                                                          color:color];
    NSAttributedString *normalExpected = [[NSAttributedString alloc] initWithString:testString attributes:normalAttributes];
    
    XCTAssertTrue([normalAttrString isEqualToAttributedString:normalExpected], @"Attributed string should be equal to expected string");
}

@end
