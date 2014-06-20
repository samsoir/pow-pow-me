//
//  MDFPPMClient.m
//  Pow Pow Me
//
//  Created by Sam de Freyssinet on 28/04/2014.
//  Copyright (c) 2014 Maison de Freyssinet. All rights reserved.
//

#import "MDFPPMMockClient.h"

MDFClient2DGeoLocation MDFClient2DGeoLocationMake(CGFloat latitude, CGFloat longitude)
{
    MDFClient2DGeoLocation clientLocation = {latitude, longitude};
    
    return clientLocation;
}

bool MDFClient2DGeoLocationEqualTo2DGeoLocation(MDFClient2DGeoLocation firstLocation, MDFClient2DGeoLocation secondLocation)
{
    return (bool) ((firstLocation.latitude == secondLocation.latitude) && (firstLocation.longitude == secondLocation.longitude));
}

@implementation MDFPPMMockClient(Plist)

- (NSArray *)loadGlobalSearchResultsFromPlist
{
    return [NSArray arrayWithContentsOfFile:[[NSBundle bundleForClass:[self class]] pathForResource:@"DataSource" ofType:@"plist"]];
}

- (NSNumber *)globalSearchResultsAvailable
{
    return [NSNumber numberWithInteger:[[self loadGlobalSearchResultsFromPlist] count]];
}

@end

@implementation MDFPPMMockClient


- (NSArray *)fetchGlobalSearchResultsFor2DLocation:(MDFClient2DGeoLocation)location
{
    return [self loadGlobalSearchResultsFromPlist];
}

- (NSNumber *)fetchGlobalSearchResultsAvailable
{
    return [self globalSearchResultsAvailable];
}

- (NSSet *)fetchSearchResultsFor2DLocation:(MDFClient2DGeoLocation)location options:(NSDictionary *)options
{
    NSSet *resultsSet = [NSSet setWithArray:[[self loadGlobalSearchResultsFromPlist] subarrayWithRange:NSMakeRange(0, 3)]];
    
    return resultsSet;
}

@end
