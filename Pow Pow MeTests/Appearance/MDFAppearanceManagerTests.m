//
//  MDFAppearanceManagerTests.m
//  Pow Pow Me
//
//  Created by Sam de Freyssinet on 27/04/2014.
//  Copyright (c) 2014 Maison de Freyssinet. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MDFAppearanceManager.h"

@interface MDFAppearanceManagerTests : XCTestCase

@end

@implementation MDFAppearanceManagerTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testPowPowDarkColor
{
    UIColor *powPowDarkColor = [UIColor colorWithRed:(74/255.0)
                                               green:(74/255.0)
                                                blue:(74/255.0)
                                               alpha:1.0];
    
    UIColor *subject = [MDFAppearanceManager powPowDarkColor];
    
    XCTAssertTrue([powPowDarkColor isEqual:subject], @"PowPowColor: %@ should be equal to subject: %@", powPowDarkColor, subject);
}

- (void)testPowPowLightColor
{
    UIColor *powPowLightColor = [UIColor whiteColor];
    
    UIColor *subject = [MDFAppearanceManager powPowLightColor];
    
    XCTAssertTrue([powPowLightColor isEqual:subject], @"PowPowColor: %@ should be equal to subject: %@", powPowLightColor, subject);
}

- (void)testPowPowAccentColor
{
    UIColor *powPowAccentColor = [UIColor colorWithRed:1.0
                                                 green:(92/255.0)
                                                  blue:(92/255.0)
                                                 alpha:1.0];
    
    UIColor *subject = [MDFAppearanceManager powPowAccentColor];
    
    XCTAssertTrue([powPowAccentColor isEqual:subject], @"PowPowColor: %@ should be equal to subject: %@", powPowAccentColor, subject);
}

- (void)testNavigationBarAppearance
{
    [MDFAppearanceManager paintNavigationAppearance];
    UINavigationBar *subject = [UINavigationBar appearance];
    
    XCTAssertEqual([subject barStyle], UIBarStyleBlack, @"Navigation bar should be UIBarStyleBlack");
}

@end
