//
//  MDFPPMClient.m
//  Pow Pow Me
//
//  Created by Sam de Freyssinet on 28/04/2014.
//  Copyright (c) 2014 Maison de Freyssinet. All rights reserved.
//

#import "MDFPPMMockClient.h"

@implementation MDFPPMMockClient(Plist)

- (NSArray *)loadGlobalSearchResultsFromPlist
{
    return [NSArray arrayWithContentsOfFile:[[NSBundle bundleForClass:[self class]] pathForResource:@"DataSource" ofType:@"plist"]];
}

- (NSNumber *)globalSearchResultsAvailable
{
    return @234;
}

@end

@implementation MDFPPMMockClient


- (NSArray *)fetchGlobalSearchResultsForLatitude:(CGFloat)latitude longitude:(CGFloat)longitude
{
    return [self loadGlobalSearchResultsFromPlist];
}

- (NSNumber *)fetchGlobalSearchResultsAvailable
{
    return [self globalSearchResultsAvailable];
}

@end
