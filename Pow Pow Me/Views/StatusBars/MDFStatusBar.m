//
//  MDFStatusBar.m
//  Pow Pow Me
//
//  Created by Sam de Freyssinet on 17/05/2014.
//  Copyright (c) 2014 Maison de Freyssinet. All rights reserved.
//

#import "MDFStatusBar.h"

CGFloat const kMDFStatusBarAnimationDuration = 1.f;
CGFloat const kMDFStatusBarBackgroundAlpha   = 0.65f;

@implementation MDFStatusBar(Presentation)

- (UIColor *)statusBarBackgroundColor
{
    return [UIColor colorWithRed:0.0
                           green:0.0
                            blue:0.0
                           alpha:1.0];
}

- (void)initializeStatusBarStyle
{
    [self setBackgroundColor:[self statusBarBackgroundColor]];
    [self setAlpha:kMDFStatusBarBackgroundAlpha];
}

- (void)initializeLabelWithFrame:(CGRect)frame
{
    UILabel *textLabel = [[UILabel alloc] initWithFrame:frame];
    [textLabel setTextAlignment:NSTextAlignmentCenter];
    [textLabel setBackgroundColor:[UIColor clearColor]];
    [textLabel setTextColor:[UIColor whiteColor]];

    [self addSubview:textLabel];
    self.statusLabel = textLabel;
}

@end

@implementation MDFStatusBar

#pragma mark - Lifecycle Methods

- (id)initWithFrame:(CGRect)frame title:(NSString *)title
{
    self = [super initWithFrame:frame];

    if (self)
    {
        CGRect labelFrame = CGRectMake(0.0, 0.0, CGRectGetWidth(frame), CGRectGetHeight(frame));
        [self initializeLabelWithFrame:labelFrame];
        [self initializeStatusBarStyle];
        [self.statusLabel setText:title];
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    return [self initWithFrame:frame title:nil];
}

#pragma mark - Presentation Methods

- (void)setStatusBarText:(NSString *)text
{
    [[self statusLabel] setText:text];
}

- (NSString *)statusBarText
{
    return [[self statusLabel] text];
}

- (void)showStatusBar:(BOOL)animated completion:(void (^)(void))completion
{
    if (self.alpha == kMDFStatusBarBackgroundAlpha)
    {
        return;
    }
    
    NSTimeInterval interval = 0.0f;

    if (animated)
    {
        interval = kMDFStatusBarAnimationDuration;
    }
    
    [UIView animateWithDuration:interval
                     animations:^{
                         [self setAlpha:kMDFStatusBarBackgroundAlpha];
    }
                     completion:^(BOOL finished) {
                         [self setHidden:NO];
                         
                         if (completion)
                         {
                             completion();
                         }
    }];
    
}

- (void)hideStatusBar:(BOOL)animated completion:(void (^)(void))completion
{
    if (self.alpha == 0)
    {
        return;
    }
    
    NSTimeInterval interval = 0.0f;

    if (animated)
    {
        interval = kMDFStatusBarAnimationDuration;
    }
    
    [UIView animateWithDuration:interval
                     animations:^{
                         [self setAlpha:0.0f];
    }
                     completion:^(BOOL finished) {
        [self setHidden:YES];

        if (completion)
        {
            completion();
        }
    }];
}

@end
