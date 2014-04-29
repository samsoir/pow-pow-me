//
//  MDFPPMClient.h
//  Pow Pow Me
//
//  Created by Sam de Freyssinet on 28/04/2014.
//  Copyright (c) 2014 Maison de Freyssinet. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MDFPPMClientProtocol <NSObject>

- (NSArray *)fetchGlobalSearchResultsForLatitude:(CGFloat)latitude longitude:(CGFloat)longitude;
- (NSNumber *)fetchGlobalSearchResultsAvailable;

@end

@interface MDFPPMMockClient : NSObject <MDFPPMClientProtocol>

- (NSArray *)fetchGlobalSearchResultsForLatitude:(CGFloat)latitude longitude:(CGFloat)longitude;
- (NSNumber *)fetchGlobalSearchResultsAvailable;

@end
