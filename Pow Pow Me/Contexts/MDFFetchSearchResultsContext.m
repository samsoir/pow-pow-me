//
//  MDFFetchSearchResultsContext.m
//  Pow Pow Me
//
//  Created by Sam de Freyssinet on 20/06/2014.
//  Copyright (c) 2014 Maison de Freyssinet. All rights reserved.
//

#import "MDFFetchSearchResultsContext.h"

NSString * const kMDFFetchSearchResultsContextDidCompleteNotification = @"net.resyssi.def:kMDFFetchSearchResultsContextDidCompleteNotification";
NSTimeInterval const kMDFFetchSearchResultsNetworkSimulationDuration = 1.0f;

@implementation MDFFetchSearchResultsContext(Notification)

- (void)postCompleteNotificationWithResults:(NSSet *)results
{
    NSNotification *notification = [NSNotification notificationWithName:kMDFFetchSearchResultsContextDidCompleteNotification object:results];
    
    [[NSNotificationCenter defaultCenter] postNotification:notification];
}

@end

@implementation MDFFetchSearchResultsContext(Client)

- (NSSet *)fetchSearchResultsForLocation:(MDFClient2DGeoLocation)location options:(NSDictionary *)options
{
    return [self.client fetchSearchResultsFor2DLocation:location options:options];
}

@end

@implementation MDFFetchSearchResultsContext

- (id)initWithClient:(id<MDFPPMClientProtocol>)client location:(MDFClient2DGeoLocation)location options:(NSDictionary *)optionsOrNil
{
    self = [super initWithClient:client];
    
    if (self)
    {
        self.location       = location;
        self.searchOptions  = optionsOrNil;
    }
    
    return self;
}

- (void)main
{
    [self postCompleteNotificationWithResults:[self.client fetchSearchResultsFor2DLocation:self.location options:self.searchOptions]];
}

@end
