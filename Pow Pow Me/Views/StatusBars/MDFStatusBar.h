//
//  MDFStatusBar.h
//  Pow Pow Me
//
//  Created by Sam de Freyssinet on 17/05/2014.
//  Copyright (c) 2014 Maison de Freyssinet. All rights reserved.
//

#ifndef __MDFStatusBar__
#define __MDFStatusBar__

#import <UIKit/UIKit.h>

FOUNDATION_EXPORT CGFloat const kMDFStatusBarAnimationDuration;
FOUNDATION_EXPORT CGFloat const kMDFStatusBarBackgroundAlpha;

@interface MDFStatusBar : UIView

@property (nonatomic, weak) UILabel *statusLabel;

#pragma mark - Lifecycle Methods

- (id)initWithFrame:(CGRect)frame title:(NSString *)title;

#pragma mark - Presentation Methods

- (void)setStatusBarText:(NSString *)text;
- (NSString *)statusBarText;
- (void)showStatusBar:(BOOL)animated completion:(void (^)(void))completion;
- (void)hideStatusBar:(BOOL)animated completion:(void (^)(void))completion;

@end

#endif