//
//  MDFSearchResultsTableViewCell.h
//  Pow Pow Me
//
//  Created by Sam de Freyssinet on 21/06/2014.
//  Copyright (c) 2014 Maison de Freyssinet. All rights reserved.
//

#ifndef __MDFSearchResultsTableViewCell__
#define __MDFSearchResultsTableViewCell__

FOUNDATION_EXPORT NSString * const kMDFSearchResultsAirplaneCharacter;
FOUNDATION_EXPORT NSString * const kMDFSearchResultsCarrierFontName;
FOUNDATION_EXPORT NSString * const kMDFSearchResultsAirplaneCharacterFontName;
FOUNDATION_EXPORT CGFloat const kMDFSearchResultsAirplaneCharacterFontSize;

FOUNDATION_EXPORT CGFloat const kMDFSearchResultsTableViewTitleFontSize;
FOUNDATION_EXPORT NSString * const kMDFSearchResultsTableViewTitleFontName;

FOUNDATION_EXPORT CGFloat const kMDFSearchResultsTableViewCellHeight;

FOUNDATION_EXPORT NSTimeInterval const kMDFDayTimeInterval;

FOUNDATION_EXPORT CGPoint const kMDFSearchResultsTableViewTitleOffset;
FOUNDATION_EXPORT CGPoint const kMDFSearchResultsTableViewSubtitleOffset;

#import <UIKit/UIKit.h>

@interface MDFSearchResultsTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subtitleLabel;
@property (nonatomic, strong) UILabel *airlineLabel;
@property (nonatomic, strong) UIImageView *backgroundImageView;

@end

@interface MDFSearchResultsTableViewCell(Presentation)

+ (NSNumberFormatter *)numberFormatterForCurrencyCode:(NSString *)code locale:(NSLocale *)localeOrNil;
+ (NSAttributedString *)attributedStringForAirline:(NSString *)airline;
+ (NSAttributedString *)attributedStringForTitle:(NSString *)title;
+ (NSAttributedString *)attributedStringForDuration:(NSString *)duration value:(NSString *)value;
+ (NSString *)formatCurrencyStringWithDecimalValue:(NSDecimalNumber *)decimalValue currencyCode:(NSString *)currencyCode locale:(NSLocale *)localeOrNil;
+ (NSString *)timeFormatStringForStartDate:(NSDate *)startDate endDate:(NSDate *)endDate;
+ (CGRect)titleRectForFrame:(CGRect)frame;
+ (CGRect)subtitleRectForFrame:(CGRect)frame;
+ (CGRect)airlineRectForFrame:(CGRect)frame;

- (void)setBackgroundImage:(UIImage *)backgroundImage;
- (void)setTitle:(NSAttributedString *)title;
- (void)setSubtitle:(NSAttributedString *)subtitle;
- (void)setAirlineTitle:(NSAttributedString *)airlineTitle;

@end

#endif