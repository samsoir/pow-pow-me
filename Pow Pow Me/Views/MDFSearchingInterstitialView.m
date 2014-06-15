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
    self.activityIndicator = [self searchingActivityIndicator];
    
    [self addSubview:self.searchingImage];
    [self addSubview:self.searchingTitle];
    [self addSubview:self.activityIndicator];
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

@end