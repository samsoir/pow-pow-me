//
//  MDFSearchingInterstitialView.h
//  Pow Pow Me
//
//  Created by Sam de Freyssinet on 14/06/2014.
//  Copyright (c) 2014 Maison de Freyssinet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MDFSearchingInterstitialView : UIView

@property (nonatomic, strong) UIImageView             *searchingImage;
@property (nonatomic, strong) UILabel                 *searchingTitle;
@property (nonatomic, strong) UILabel                 *searchingMessage;
@property (nonatomic, strong) UIActivityIndicatorView *activityIndicator;

- (CGRect)rectForSearchingImageInFrame:(CGRect)frame;
- (CGRect)rectForTitleLabelInFrame:(CGRect)frame;

@end