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
    return CGRectMake(0.0f, 0.0f, 320.0f, 568.0f);
}

- (CGRect)imageRect
{
    return CGRectMake(0.0f, 0.0f, 120.0f, 144.0f);
}

- (CGRect)activityIndicatorRect
{
    UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    
    return [activityIndicator frame];
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
    CGFloat xCoord                        = 0.0f;
    CGFloat yCoord                        = CGRectGetHeight(window) / 2.0;
    CGFloat height                        = 60.0f;
    CGRect expected                       = CGRectMake(xCoord, yCoord, CGRectGetWidth(window), height);
    
    CGRect actual                         = [subject rectForTitleLabelInFrame:window];
    
    XCTAssertTrue(CGRectEqualToRect(expected, actual), @"Expected frame should match actual.");
}

- (void)testRectForMessageLabelInFrame
{
    MDFSearchingInterstitialView *subject = [self subject];
    CGRect window                         = [self frame];
    CGFloat padding                       = 17.0f;
    CGFloat width                         = CGRectGetWidth(window) - (2.0f * padding);
    CGFloat xCoord                        = (CGRectGetWidth(window) / 2.0f) - (width / 2.0f);
    CGFloat yCoord                        = CGRectGetHeight(window) / 1.7;
    CGFloat height                        = 80.0f;
    CGRect expected                       = CGRectMake(xCoord, yCoord, width, height);
    
    CGRect actual                         = [subject rectForMessageLabelInFrame:window padding:padding];
    
    XCTAssertTrue(CGRectEqualToRect(expected, actual), @"Expected frame should match actual.");
}

- (void)testRectForActivityIndicatorInFrame
{
    MDFSearchingInterstitialView *subject = [self subject];
    CGRect window                         = [self frame];
    CGRect activityIndicatorRect          = [self activityIndicatorRect];
    CGFloat xCoord                        = (CGRectGetWidth(window) / 2.0f) - (CGRectGetWidth(activityIndicatorRect) / 2.0f);
    CGFloat yCoord                        = CGRectGetHeight(window) / 1.3;
    CGRect expected                       = CGRectMake(xCoord, yCoord, CGRectGetWidth(activityIndicatorRect), CGRectGetHeight(activityIndicatorRect));
    
    CGRect actual                         = [subject rectForActivityIndicatorInFrame:window];
    
    XCTAssertTrue(CGRectEqualToRect(expected, actual), @"Expected frame should match actual.");
    
}

@end
