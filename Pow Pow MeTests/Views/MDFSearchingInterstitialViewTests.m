//
//  MDFSearchingInterstitialViewTests.m
//  Pow Pow Me
//
//  Created by Sam de Freyssinet on 14/06/2014.
//  Copyright (c) 2014 Maison de Freyssinet. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MDFSearchingInterstitialView.h"

@interface MDFSearchingInterstitialViewTests : XCTestCase

@end

@implementation MDFSearchingInterstitialViewTests

- (CGRect)frame
{
    return CGRectMake(0.0, 0.0, 320.0f, 568.0f);
}

- (CGRect)imageRect
{
    return CGRectMake(0.0, 0.0, 120.0f, 144.0f);
}

- (MDFSearchingInterstitialView *)subject
{
    return [[MDFSearchingInterstitialView alloc] initWithFrame:[self frame]];
}

- (void)testRectForSearchingImageInFrame
{
    MDFSearchingInterstitialView *subject = [self subject];
    CGRect window                         = [self frame];
    CGRect imageRect                      = [self imageRect];
    CGFloat xCoord                        = (CGRectGetWidth(window) / 2.0f) - (CGRectGetWidth(imageRect) / 2.0f);
    CGFloat yCoord                        = CGRectGetHeight(window) / 5.0;
    CGRect expected                       = CGRectMake(xCoord, yCoord, CGRectGetWidth(imageRect), CGRectGetHeight(imageRect));

    CGRect actual                         = [subject rectForSearchingImageInFrame:window];
    
    XCTAssertTrue(CGRectEqualToRect(expected, actual), @"Expected frame should match actual.");
}

- (void)testRectForTitleLabelInFrame
{
    MDFSearchingInterstitialView *subject = [self subject];
    CGRect window                         = [self frame];
    CGRect titleRect                      = CGRectZero;
    CGFloat xCoord                        = 0.0f;
    CGFloat yCoord                        = CGRectGetHeight(window) / 2.0;
    CGFloat height                        = 60.0f;
    CGRect expected                       = CGRectMake(xCoord, yCoord, CGRectGetWidth(window), height);
    
    CGRect actual                         = [subject rectForTitleLabelInFrame:window];
    
    XCTAssertTrue(CGRectEqualToRect(expected, actual), @"Expected frame should match actual.");
}

@end
