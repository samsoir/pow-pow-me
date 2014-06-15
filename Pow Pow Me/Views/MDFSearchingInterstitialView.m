//
//  MDFSearchingInterstitialView.m
//  Pow Pow Me
//
//  Created by Sam de Freyssinet on 14/06/2014.
//  Copyright (c) 2014 Maison de Freyssinet. All rights reserved.
//

#import "MDFSearchingInterstitialView.h"

@implementation MDFSearchingInterstitialView(Presentation)

- (void)initializeSubViews
{
    self.searchingImage = [self searchingImageView];
    self.searchingTitle = [self searchingTitleLabel];
    self.searchingMessage = [self searchingMessageLabel];
    self.activityIndicator = [self searchingActivityIndicator];
    
    [self addSubview:self.searchingImage];
    [self addSubview:self.searchingTitle];
    [self addSubview:self.searchingMessage];
    [self addSubview:self.activityIndicator];
    
    [self.activityIndicator startAnimating];
}

- (UIActivityIndicatorView *)searchingActivityIndicator
{
    return [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
}

- (UIImageView *)searchingImageView
{
    return [[UIImageView alloc] initWithImage:[self shreddingPowPowImage]];
}

- (UIImage *)shreddingPowPowImage
{
    return [UIImage imageNamed:@"ShreddingPowPow"];
}

- (UILabel *)searchingTitleLabel
{
    NSString *searchTitle = NSLocalizedStringFromTable(@"searchingTitle", @"Titles", @"searchingTitle");
    
    UILabel *titleLabel = [[UILabel alloc] init];
    [titleLabel setText:searchTitle];
    
    UIFont *titleLabelFont = [UIFont fontWithName:@"HelveticaNeue-Thin" size:30.0f];
    [titleLabel setFont:titleLabelFont];
    [titleLabel setNumberOfLines:1];
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
    [titleLabel setTextColor:[UIColor whiteColor]];
    [titleLabel adjustsFontSizeToFitWidth];
    
    return titleLabel;
}

- (UILabel *)searchingMessageLabel
{
    NSString *searchMessage = NSLocalizedStringFromTable(@"searchingMessage", @"Titles", @"searchingMessage");
    UILabel *messageLabel = [[UILabel alloc] init];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    [style setLineHeightMultiple:1.25f];
    [style setAlignment:NSTextAlignmentCenter];
    UIFont *messageLabelFont = [UIFont fontWithName:@"HelveticaNeue-Light" size:13.0f];

    
    NSAttributedString *searchMessageAttributedString = [[NSAttributedString alloc] initWithString:searchMessage attributes:@{NSParagraphStyleAttributeName: style, NSFontAttributeName: messageLabelFont, NSForegroundColorAttributeName: [UIColor whiteColor]}];
    
    [messageLabel setAttributedText:searchMessageAttributedString];
    [messageLabel setNumberOfLines:3];
    
    return messageLabel;
}

@end

@implementation MDFSearchingInterstitialView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        [self initializeSubViews];
        [self setBackgroundColor:[UIColor darkGrayColor]];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGRect frame = [self frame];
    
    [self.searchingImage setFrame:[self rectForSearchingImageInFrame:frame]];
    [self.searchingTitle setFrame:[self rectForTitleLabelInFrame:frame]];
    [self.searchingMessage setFrame:[self rectForMessageLabelInFrame:frame padding:17.0f]];
    [self.activityIndicator setFrame:[self rectForActivityIndicatorInFrame:frame]];
}

#pragma mark - Presentation

- (CGRect)rectForSearchingImageInFrame:(CGRect)frame
{
    CGRect imageRect                      = [self.searchingImage frame];
    CGFloat xCoord                        = (CGRectGetWidth(frame) / 2.0f) - (CGRectGetWidth(imageRect) / 2.0f);
    CGFloat yCoord                        = CGRectGetHeight(frame) / 5.0;

    return CGRectMake(xCoord, yCoord, CGRectGetWidth(imageRect), CGRectGetHeight(imageRect));
}

- (CGRect)rectForTitleLabelInFrame:(CGRect)frame
{
    CGFloat xCoord                        = 0.0f;
    CGFloat height                        = 60.0f;
    CGFloat yCoord                        = CGRectGetHeight(frame) / 2.0;
    
    return CGRectMake(xCoord, yCoord, CGRectGetWidth(frame), height);
}

- (CGRect)rectForMessageLabelInFrame:(CGRect)frame padding:(CGFloat)padding
{
    CGFloat width  = CGRectGetWidth(frame) - (2.0f * padding);
    CGFloat xCoord = (CGRectGetWidth(frame) / 2.0f) - (width / 2.0f);
    CGFloat yCoord = CGRectGetHeight(frame) / 1.7;
    CGFloat height = 80.0f;
    
    return CGRectMake(xCoord, yCoord, width, height);
}

- (CGRect)rectForActivityIndicatorInFrame:(CGRect)frame
{
    CGRect activityIndicatorRect = [self.activityIndicator frame];
    CGFloat xCoord               = (CGRectGetWidth(frame) / 2.0f) - (CGRectGetWidth(activityIndicatorRect) / 2.0f);
    CGFloat yCoord               = CGRectGetHeight(frame) / 1.3;
    
    return CGRectMake(xCoord, yCoord, CGRectGetWidth(activityIndicatorRect), CGRectGetHeight(activityIndicatorRect));
}

@end