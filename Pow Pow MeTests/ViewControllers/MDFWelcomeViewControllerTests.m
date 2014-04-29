//
//  MDFWelcomeViewControllerTests.m
//  Pow Pow Me
//
//  Created by Sam de Freyssinet on 28/04/2014.
//  Copyright (c) 2014 Maison de Freyssinet. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MDFWelcomeViewController.h"

@interface MDFWelcomeViewControllerTests : XCTestCase

@end

@implementation MDFWelcomeViewControllerTests

- (id)generateTestController
{
    return [[MDFWelcomeViewController alloc] initWithNibName:nil bundle:nil];
}

- (id)generateTestButtonWithLocalizedTitle:(NSString *)title
{
    return [MDFWelcomeViewController ctaButtonWithLocalizedTitle:title];
}

- (id)generateTestBarButtonItemWithLocalizedTitle:(NSString *)title
{
    return [MDFWelcomeViewController barButtonItemWithLocalizedTitle:title
                                                              target:nil
                                                              action:nil];
}

- (void)testCTAButtonInitialization
{
    id subject = [self generateTestButtonWithLocalizedTitle:@"PowPowMe"];
    
    NSAttributedString *title = [subject attributedTitleForState:UIControlStateNormal];
    
    XCTAssertEqual([title string], NSLocalizedStringFromTable(@"PowPowMe", @"Titles", @"Pow! Pow! Me"), @"Localized titles should be equal");
}

- (void)testPositionButton
{
    CGRect window = CGRectMake(0.0, 0.0, 320.0, 480.0);

    id subject = [self generateTestButtonWithLocalizedTitle:@"PowPowMe"];
    id controller = [self generateTestController];
    
    [controller positionButton:subject bottomOfFrame:window];
    
    CGRect subjectFrame = [subject frame];
    CGRect expectedFrame = CGRectMake(0.0, 427.0, 320.0, 53.0);
    
    XCTAssertTrue(CGRectEqualToRect(subjectFrame, expectedFrame), @"Subject frame should match expected frame");
}

- (void)testBarButtonItemWithLocalizedTitle
{
    NSString *title = NSLocalizedStringFromTable(@"Me", @"Titles", @"Me");
    UIBarButtonItem *subject = [self generateTestBarButtonItemWithLocalizedTitle:title];
    
    XCTAssertTrue([subject.title isEqualToString:title], @"Bar Button item title should match");
}

@end
