//
//  MDFPPMClient.h
//  Pow Pow Me
//
//  Created by Sam de Freyssinet on 28/04/2014.
//  Copyright (c) 2014 Maison de Freyssinet. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef __MDFPPMClientProtocol__
#define __MDFPPMClientProtocol__

typedef struct MDFClient2DGeoLocation {
    CGFloat latitude;
    CGFloat longitude;
} MDFClient2DGeoLocation;

CG_EXTERN MDFClient2DGeoLocation MDFClient2DGeoLocationMake(CGFloat latitude, CGFloat longitude);

CG_EXTERN bool MDFClient2DGeoLocationEqualTo2DGeoLocation(MDFClient2DGeoLocation firstLocation, MDFClient2DGeoLocation secondLocation);

@protocol MDFPPMClientProtocol <NSObject>

- (NSArray *)fetchGlobalSearchResultsFor2DLocation:(MDFClient2DGeoLocation)location;
- (NSNumber *)fetchGlobalSearchResultsAvailable;
- (NSSet *)fetchSearchResultsFor2DLocation:(MDFClient2DGeoLocation)location options:(NSDictionary *)options;

@end

@interface MDFPPMMockClient : NSObject <MDFPPMClientProtocol>

- (NSArray *)fetchGlobalSearchResultsFor2DLocation:(MDFClient2DGeoLocation)location;
- (NSNumber *)fetchGlobalSearchResultsAvailable;
- (NSSet *)fetchSearchResultsFor2DLocation:(MDFClient2DGeoLocation)location options:(NSDictionary *)options;

@end

#endif