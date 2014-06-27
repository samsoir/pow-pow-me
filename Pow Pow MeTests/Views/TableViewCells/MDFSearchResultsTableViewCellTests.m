//
//  MDFSearchResultsTableViewCellTests.m
//  Pow Pow Me
//
//  Created by Sam de Freyssinet on 21/06/2014.
//  Copyright (c) 2014 Maison de Freyssinet. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MDFSearchResultsTableViewCell.h"
#import "MDFAppearanceManager.h"

@interface MDFSearchResultsTableViewCellTests : XCTestCase

@end


// ✈︎ AIRPLANE Unicode: U+2708 U+FE0E, UTF-8: E2 9C 88 EF B8 8E

@implementation MDFSearchResultsTableViewCellTests

- (CGRect)frame
{
    return CGRectMake(0.0f, 0.0f, 320.0f, 150.0f);
}

- (NSShadow *)textShadow
{
    NSShadow *textShadow = [[NSShadow alloc] init];
    [textShadow setShadowColor:[UIColor blackColor]];
    [textShadow setShadowOffset:CGSizeMake(1.0f, 1.0f)];
    [textShadow setShadowBlurRadius:1.0f];

    return textShadow;
}

- (MDFSearchResultsTableViewCell *)subject
{
    return [[MDFSearchResultsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                reuseIdentifier:nil];
}

- (void)testAirlineAttributedString
{
    NSString *airLineString = @"Delta";
    NSString *airplaneUnicodeString = [NSString stringWithFormat:@"%@ ", kMDFSearchResultsAirplaneCharacter];
    
    NSShadow *textShadow = [self textShadow];
    
    NSAttributedString *airlineAttributedString = [[NSAttributedString alloc] initWithString:airLineString attributes:@{
                    NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-Medium" size:12.0f],
                    NSForegroundColorAttributeName: [MDFAppearanceManager powPowAccentColor],
                    NSShadowAttributeName: textShadow
                    }];
    
    NSAttributedString *airplaneUnicodeAttibutedString = [[NSAttributedString alloc] initWithString:airplaneUnicodeString attributes:@{
                                           NSFontAttributeName: [UIFont fontWithName:kMDFSearchResultsAirplaneCharacterFontName size:kMDFSearchResultsAirplaneCharacterFontSize],
                                           NSForegroundColorAttributeName: [MDFAppearanceManager powPowAccentColor],
                                           NSShadowAttributeName: textShadow                                              }];
    
    NSMutableAttributedString *expectedString = [[NSMutableAttributedString alloc] initWithAttributedString:airplaneUnicodeAttibutedString];
    
    [expectedString appendAttributedString:airlineAttributedString];
    
    XCTAssertEqualObjects(expectedString, [MDFSearchResultsTableViewCell attributedStringForAirline:airLineString], @"Attributed strings do not match");
    
}

- (void)testSetAirlineTitle
{
    NSString *airline = @"Virgin America";
    NSAttributedString *airlineAttributedString = [MDFSearchResultsTableViewCell attributedStringForAirline:airline];
    
    MDFSearchResultsTableViewCell *subject = [self subject];
    
    [subject setAirlineTitle:airlineAttributedString];
    
    XCTAssertEqualObjects(airlineAttributedString, [[subject airlineLabel] attributedText], @"Attributed text label does not match expected airline attributed string");
}

- (void)testSetBackgroundImage
{
    UIImage *testBackgroundImage = [UIImage imageNamed:@"Fernie-CA"];
    MDFSearchResultsTableViewCell *subject = [self subject];
    
    [subject setBackgroundImage:testBackgroundImage];
    
    XCTAssertEqualObjects(testBackgroundImage, [[subject backgroundImageView] image], @"UIImage set to background should match testBackground image");
}

- (void)testAttibutedStringForTitle
{
    NSString *titleString = @"Test Resort, CA";
    UIFont *font = [UIFont fontWithName:kMDFSearchResultsTableViewTitleFontName size:kMDFSearchResultsTableViewTitleFontSize];
    NSShadow *textShadow = [self textShadow];
    
    NSDictionary *attributes = @{
                                 NSFontAttributeName: font,
                                 NSShadowAttributeName: textShadow,
                                 NSForegroundColorAttributeName: [UIColor whiteColor],
                                 };
    
    NSAttributedString *titleAttributedString = [[NSAttributedString alloc] initWithString:titleString attributes:attributes];
    
    XCTAssertEqualObjects(titleAttributedString, [MDFSearchResultsTableViewCell attributedStringForTitle:titleString], @"Attributed strings should match");
}

- (void)testSetTitle
{
    NSString *titleString = @"Test Resort, CA";
    NSAttributedString *titleAttributedString = [MDFSearchResultsTableViewCell attributedStringForTitle:titleString];
    
    MDFSearchResultsTableViewCell *subject = [self subject];
    
    [subject setTitle:titleAttributedString];
    
    XCTAssertEqualObjects(titleAttributedString, [[subject titleLabel] attributedText], @"NSString set to title should be applied to label");
}

- (void)testAttributedStringForDurationValue
{
    NSString *durationString = @"2 days";
    NSString *valueString    = @"$1,400";
    
    NSDictionary *attributes = @{
                                 NSFontAttributeName: [UIFont fontWithName:kMDFSearchResultsTableViewTitleFontName size:kMDFSearchResultsAirplaneCharacterFontSize],
                                 NSShadowAttributeName: [self textShadow],
                                 NSForegroundColorAttributeName: [MDFAppearanceManager powPowAccentColor]
                                 };
    
    NSString *expectedString = [NSString stringWithFormat:@"%@, %@", durationString, valueString];
    NSAttributedString *expectedAttributedString = [[NSAttributedString alloc] initWithString:expectedString attributes:attributes];
    
    XCTAssertEqualObjects(expectedAttributedString, [MDFSearchResultsTableViewCell attributedStringForDuration:durationString value:valueString], @"Expected attributed string did not match returned attributed string");
}

- (void)testSetSubtitle
{
    NSString *durationString = @"2 days";
    NSString *valueString    = @"$1,400";
    
    NSAttributedString *attributedSubtitle = [MDFSearchResultsTableViewCell attributedStringForDuration:durationString value:valueString];
    
    MDFSearchResultsTableViewCell *subject = [self subject];

    [subject setSubtitle:attributedSubtitle];
    
    XCTAssertEqualObjects(attributedSubtitle, [[subject subtitleLabel] attributedText], @"Attributed text title should match set attributed text");
    
}

- (void)testNumberFormatterSingleSharedInstance
{
    NSString *currencyCode = @"USD";
    NSLocale *locale       = [NSLocale localeWithLocaleIdentifier:@"en_US"];
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setLocale:locale];
    [formatter setCurrencyCode:currencyCode];
    
    NSNumberFormatter *currencyFormatter1 = [MDFSearchResultsTableViewCell numberFormatterForCurrencyCode:currencyCode locale:locale];
    
    NSNumberFormatter *currencyFormatter2 = [MDFSearchResultsTableViewCell numberFormatterForCurrencyCode:currencyCode locale:locale];
    
    XCTAssertEqual(currencyFormatter1, currencyFormatter2, @"Only a single instance of currencyFormatter should be issued");
}

- (void)testFormatCurrencyStringWithValueExponentLocale
{
    NSString *currencyCode = @"USD";
    NSLocale *locale       = [NSLocale localeWithLocaleIdentifier:@"en_US"];
    NSNumber *value        = @139950;
    NSNumber *mantissa     = [NSNumber numberWithInt:-2];

    NSDecimalNumber *realValue = [[NSDecimalNumber alloc] initWithMantissa:[value unsignedLongLongValue] exponent:[mantissa shortValue] isNegative:NO];
    
    NSNumberFormatter *formatter = [MDFSearchResultsTableViewCell numberFormatterForCurrencyCode:currencyCode locale:locale];
    
    NSString *expectedString = [NSString stringWithFormat:@"%@1,400", [formatter currencySymbol]];

    XCTAssertEqualObjects(expectedString, [MDFSearchResultsTableViewCell formatCurrencyStringWithDecimalValue:realValue currencyCode:currencyCode locale:locale], @"Expected currency formatted string, rounded using ceiling without fractions");
}

- (void)testTimeFormatStringForStartDateEndDate
{
    NSTimeInterval aug_1_2014_00_00 = 1406851200.0;
    NSTimeInterval aug_3_2014_00_00 = 1407024000.0;
    
    NSDate *startDate = [NSDate dateWithTimeIntervalSince1970:aug_1_2014_00_00];
    NSDate *endDate = [NSDate dateWithTimeIntervalSince1970:aug_3_2014_00_00];
 
    NSString *timeString = [MDFSearchResultsTableViewCell timeFormatStringForStartDate:startDate endDate:endDate];
    
    XCTAssertEqualObjects(@"2 days", timeString, @"Duration time string did not meet expected string");

    NSTimeInterval aug_2_2014_00_00 = 1406937600.0;
    endDate = [NSDate dateWithTimeIntervalSince1970:aug_2_2014_00_00];
    
    timeString = [MDFSearchResultsTableViewCell timeFormatStringForStartDate:startDate endDate:endDate];

    XCTAssertEqualObjects(@"1 day", timeString, @"Duration time string should be singular");
}

- (void)testTitleRectForFrame
{
    CGRect frame   = [self frame];
    CGPoint offset = kMDFSearchResultsTableViewTitleOffset;
    
    CGRect expectedFrame = CGRectMake(offset.x, offset.y, (frame.size.width - offset.x), 36.0f);
    
    XCTAssertTrue(CGRectEqualToRect(expectedFrame, [MDFSearchResultsTableViewCell titleRectForFrame:frame]), @"Expected frame: {%f %f}, {%f %f}", CGRectGetMinX(expectedFrame), CGRectGetMinY(expectedFrame), CGRectGetWidth(expectedFrame), CGRectGetHeight(expectedFrame));
}

- (void)testSubtitleRectForFrame
{
    CGRect frame   = [self frame];
    CGPoint offset = kMDFSearchResultsTableViewSubtitleOffset;
    
    CGFloat width = CGRectGetWidth(frame) / 2;
    CGFloat xPos  = offset.x;
    
    CGRect expectedFrame = CGRectMake(xPos, offset.y, width - xPos, 15.0f);
    
    XCTAssertTrue(CGRectEqualToRect(expectedFrame, [MDFSearchResultsTableViewCell subtitleRectForFrame:frame]), @"Expected frame: {%f %f}, {%f %f}", CGRectGetMinX(expectedFrame), CGRectGetMinY(expectedFrame), CGRectGetWidth(expectedFrame), CGRectGetHeight(expectedFrame));
}

- (void)testAirlineRectForFrame
{
    CGRect frame   = [self frame];
    CGPoint offset = kMDFSearchResultsTableViewSubtitleOffset;
    
    CGFloat width = ((CGFloat)CGRectGetWidth(frame) / 2.0f) - offset.x;
    CGFloat xPos  = ((CGFloat)CGRectGetWidth(frame) - width - offset.x);
    
    CGRect expectedFrame = CGRectMake(xPos, offset.y, width, 15.0f);
    
    XCTAssertTrue(CGRectEqualToRect(expectedFrame, [MDFSearchResultsTableViewCell airlineRectForFrame:frame]), @"Expected frame: {%f %f}, {%f %f}", CGRectGetMinX(expectedFrame), CGRectGetMinY(expectedFrame), CGRectGetWidth(expectedFrame), CGRectGetHeight(expectedFrame));
}

@end
