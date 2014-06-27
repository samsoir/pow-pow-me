//
//  MDFFetchSearchResultsContext.h
//  Pow Pow Me
//
//  Created by Sam de Freyssinet on 20/06/2014.
//  Copyright (c) 2014 Maison de Freyssinet. All rights reserved.
//

#ifndef __MDFFetchSearchResultsContext__
#define __MDFFetchSearchResultsContext__

FOUNDATION_EXPORT NSString * const kMDFFetchSearchResultsContextDidCompleteNotification;
FOUNDATION_EXPORT NSTimeInterval const kMDFFetchSearchResultsNetworkSimulationDuration;

#import "MDFClientOperation.h"

@interface MDFFetchSearchResultsContext : MDFClientOperation

@property (assign, nonatomic) MDFClient2DGeoLocation   location;
@property (copy, nonatomic)   NSDictionary            *searchOptions;

- (id)initWithClient:(id<MDFPPMClientProtocol>)client location:(MDFClient2DGeoLocation)location options:(NSDictionary *)optionsOrNil;

@end

#endif