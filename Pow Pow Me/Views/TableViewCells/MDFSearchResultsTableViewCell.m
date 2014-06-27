//
//  MDFSearchResultsTableViewCell.m
//  Pow Pow Me
//
//  Created by Sam de Freyssinet on 21/06/2014.
//  Copyright (c) 2014 Maison de Freyssinet. All rights reserved.
//

#import "MDFSearchResultsTableViewCell.h"
#import "MDFAppearanceManager.h"

NSString * const kMDFSearchResultsAirplaneCharacter         = @"\u2708";
NSString * const kMDFSearchResultsCarrierFontName           = @"HelveticaNeue-Medium";
NSString * const kMDFSearchResultsTableViewTitleFontName    = @"HelveticaNeue-Medium";
NSString * const kMDFSearchResultsAirplaneCharacterFontName = @"ZapfDingbatsITC";
CGFloat const kMDFSearchResultsAirplaneCharacterFontSize    = 12.0f;
CGFloat const kMDFSearchResultsTableViewTitleFontSize       = 24.0f;

CGFloat const kMDFSearchResultsTableViewCellHeight          = 150.0f;
CGFloat const kMDFSearchResultsTableViewCellWidth           = 150.0f;

NSTimeInterval const kMDFDayTimeInterval                    = 86400.0;

CGPoint const kMDFSearchResultsTableViewTitleOffset         = {20.0f, 90.0f};
CGPoint const kMDFSearchResultsTableViewSubtitleOffset      = {20.0f, 130.0f};

@implementation MDFSearchResultsTableViewCell(Presentation)

+ (NSAttributedString *)airplaneUnicodeAttributedStringForFont:(UIFont *)font
{
    NSString *airlineString = [NSString stringWithFormat:@"%@ ", kMDFSearchResultsAirplaneCharacter];
    
    return [[NSAttributedString alloc] initWithString:airlineString
                                           attributes:@{
                                                        NSFontAttributeName: font,
                                                        NSForegroundColorAttributeName: [MDFAppearanceManager powPowAccentColor],
                                                        NSShadowAttributeName: [self textShadow]                                              }];
}

+ (NSAttributedString *)attributedStringForCarrier:(NSString *)carrier
{
    return [[NSAttributedString alloc] initWithString:carrier attributes:@{
                                                                           
                                                                           NSFontAttributeName: [UIFont fontWithName:kMDFSearchResultsCarrierFontName size:kMDFSearchResultsAirplaneCharacterFontSize],
                                                                           NSForegroundColorAttributeName: [MDFAppearanceManager powPowAccentColor],
                                                                           NSShadowAttributeName: [self textShadow]
                                                                           }];
}

+ (NSAttributedString *)attributedStringForTitle:(NSString *)title
{
    UIFont *font = [UIFont fontWithName:kMDFSearchResultsTableViewTitleFontName size:kMDFSearchResultsTableViewTitleFontSize];
    NSShadow *textShadow = [self textShadow];
    NSDictionary *attributes = @{
                                 NSFontAttributeName: font,
                                 NSShadowAttributeName: textShadow,
                                 NSForegroundColorAttributeName: [UIColor whiteColor],
                                 };
    
    return [[NSAttributedString alloc] initWithString:title attributes:attributes];
}

+ (NSAttributedString *)attributedStringForDuration:(NSString *)duration value:(NSString *)value
{
    NSDictionary *attributes = @{
                                 NSFontAttributeName: [UIFont fontWithName:kMDFSearchResultsTableViewTitleFontName size:kMDFSearchResultsAirplaneCharacterFontSize],
                                 NSShadowAttributeName: [self textShadow],
                                 NSForegroundColorAttributeName: [MDFAppearanceManager powPowAccentColor]
                                 };
    
    NSString *formattedString = [NSString stringWithFormat:@"%@, %@", duration, value];
    
    
    return [[NSAttributedString alloc] initWithString:formattedString attributes:attributes];;
}

+ (NSAttributedString *)attributedStringForAirline:(NSString *)airline
{
    NSMutableAttributedString *airlineAttributedString = [[NSMutableAttributedString alloc] initWithAttributedString:[MDFSearchResultsTableViewCell airplaneUnicodeAttributedStringForFont:[UIFont fontWithName:kMDFSearchResultsAirplaneCharacterFontName size:kMDFSearchResultsAirplaneCharacterFontSize]]];
    
    [airlineAttributedString appendAttributedString:[MDFSearchResultsTableViewCell attributedStringForCarrier:airline]];
    
    return airlineAttributedString;
}

+ (NSNumberFormatter *)numberFormatterForCurrencyCode:(NSString *)code locale:(NSLocale *)localeOrNil
{
    if ( ! localeOrNil)
    {
        localeOrNil = [NSLocale currentLocale];
    }
    
    NSString *codeKey = [NSString stringWithFormat:@"%@-%@", [localeOrNil localeIdentifier], code];
    
    static NSMutableDictionary *numberFormatters = nil;
    
    if ( ! numberFormatters)
    {
        @synchronized(numberFormatters)
        {
            numberFormatters = [[NSMutableDictionary alloc] initWithCapacity:5];
        }
    }
    
    NSNumberFormatter *numberFormatter = [numberFormatters objectForKey:codeKey];
    
    if ( ! numberFormatter)
    {
        numberFormatter = [[NSNumberFormatter alloc] init];
        [numberFormatter setCurrencyCode:code];
        [numberFormatter setRoundingMode:NSNumberFormatterRoundCeiling];
        [numberFormatter setMaximumFractionDigits:0];
        [numberFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
        [numberFormatter setLocale:localeOrNil];
        
        @synchronized(numberFormatters)
        {
            [numberFormatters setObject:numberFormatter forKey:codeKey];
        }
    }
    
    return numberFormatter;
}

+ (NSString *)formatCurrencyStringWithDecimalValue:(NSDecimalNumber *)decimalValue currencyCode:(NSString *)currencyCode locale:(NSLocale *)localeOrNil
{
    if ( ! localeOrNil)
    {
        localeOrNil = [NSLocale currentLocale];
    }
    
    NSNumberFormatter *formatter = [MDFSearchResultsTableViewCell numberFormatterForCurrencyCode:currencyCode locale:localeOrNil];
    
    return [formatter stringFromNumber:decimalValue];
}

+ (NSString *)timeFormatStringForStartDate:(NSDate *)startDate endDate:(NSDate *)endDate
{
    NSTimeInterval startTimeInterval = [startDate timeIntervalSince1970];
    NSTimeInterval endTimeInterval   = [endDate timeIntervalSince1970];
    
    NSTimeInterval delta = (endTimeInterval - startTimeInterval) / kMDFDayTimeInterval;
    
    NSString *daysString = @"day";
    
    if (delta < 0.5 || delta >= 1.5)
    {
        daysString = [NSString stringWithFormat:@"%@s", daysString];
    }
    
    return [NSString stringWithFormat:@"%lli %@", (long long)delta, daysString];
}


+ (CGRect)titleRectForFrame:(CGRect)frame
{
    CGPoint offset    = kMDFSearchResultsTableViewTitleOffset;
    CGRect titleFrame = CGRectMake(offset.x, offset.y, (CGRectGetWidth(frame) - offset.x), 36.0f);
    
    return titleFrame;
}

+ (CGRect)subtitleRectForFrame:(CGRect)frame
{
    CGPoint offset    = kMDFSearchResultsTableViewSubtitleOffset;

    CGFloat width = CGRectGetWidth(frame) / 2;
    CGFloat xPos  = offset.x;

    
    CGRect subtitleFrame = CGRectMake(xPos, offset.y, (width - xPos), 15.0f);

    return subtitleFrame;
}

+ (CGRect)airlineRectForFrame:(CGRect)frame
{
    CGPoint offset = kMDFSearchResultsTableViewSubtitleOffset;
    
    CGFloat width = (CGRectGetWidth(frame) / 2) - offset.x;
    CGFloat xPos  = (CGRectGetWidth(frame) - width - offset.x);
    
    CGRect expectedFrame = CGRectMake(xPos, offset.y, width, 15.0f);

    return expectedFrame;
}


- (void)initializeBackgroundImageView
{
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, kMDFSearchResultsTableViewCellWidth, kMDFSearchResultsTableViewCellHeight)];
    
    self.backgroundView = backgroundImageView;
    
    self.backgroundImageView = backgroundImageView;
}

- (void)initializeTitleLabel
{
    UILabel *titleLabel = [[UILabel alloc] init];
    [titleLabel setTextAlignment:NSTextAlignmentLeft];
    [[self contentView] addSubview:titleLabel];
    
    self.titleLabel = titleLabel;
}

- (void)initializeSubtitleLabel
{
    UILabel *subtitleLabel = [[UILabel alloc] init];
    [subtitleLabel setTextAlignment:NSTextAlignmentLeft];
    [[self contentView] addSubview:subtitleLabel];
    
    self.subtitleLabel = subtitleLabel;
}

- (void)initializeAirlineLabel
{
    UILabel *airlineLabel = [[UILabel alloc] init];
    [airlineLabel setTextAlignment:NSTextAlignmentRight];
    [[self contentView] addSubview:airlineLabel];
    
    self.airlineLabel = airlineLabel;
}

- (void)setBackgroundImage:(UIImage *)backgroundImage
{
    [self.backgroundImageView setImage:backgroundImage];
}

- (void)setTitle:(NSAttributedString *)title
{
    [self.titleLabel setAttributedText:title];
}

- (void)setSubtitle:(NSAttributedString *)subtitle
{
    [self.subtitleLabel setAttributedText:subtitle];
}

- (void)setAirlineTitle:(NSAttributedString *)airlineTitle
{
    [self.airlineLabel setAttributedText:airlineTitle];
}

#pragma mark - Private Method

+ (NSShadow *)textShadow
{
    NSShadow *textShadow = [[NSShadow alloc] init];
    [textShadow setShadowColor:[UIColor blackColor]];
    [textShadow setShadowOffset:CGSizeMake(1.0f, 1.0f)];
    [textShadow setShadowBlurRadius:1.0f];
    
    return textShadow;
}

@end

@implementation MDFSearchResultsTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self)
    {
        [self initializeBackgroundImageView];
        [self initializeTitleLabel];
        [self initializeSubtitleLabel];
        [self initializeAirlineLabel];        
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGRect bounds = [self bounds];
    
    [self.titleLabel setFrame:[MDFSearchResultsTableViewCell titleRectForFrame:bounds]];
    [self.subtitleLabel setFrame:[MDFSearchResultsTableViewCell subtitleRectForFrame:bounds]];
    [self.airlineLabel setFrame:[MDFSearchResultsTableViewCell airlineRectForFrame:bounds]];
    [self.backgroundImageView setFrame:bounds];
}

@end
