//
//  MDFFetchGlobalSearchResultsContext.m
//  Pow Pow Me
//
//  Created by Sam de Freyssinet on 28/04/2014.
//  Copyright (c) 2014 Maison de Freyssinet. All rights reserved.
//

#import "MDFFetchGlobalSearchResultsContext.h"

NSString * const kMDFFetchGlobalSearchResultsContextCompleted = @"net.reyssi.def:PowPowMe.kMDFFetchGlobalSearchResultsContextCompleted";
NSString * const kMDFFetchGlobalSearchResultsContextStarted = @"net.reyssi.def:PowPowMe.kMDFFetchGlobalSearchResultsContextStarted";

@implementation MDFFetchGlobalSearchResultsContext(Notifications)

- (void)notifyOfContextStart
{
    [[NSNotificationCenter defaultCenter] postNotificationName:kMDFFetchGlobalSearchResultsContextStarted object:nil];
}

- (void)notifyOfContextCompletion:(NSArray *)data
{
    [[NSNotificationCenter defaultCenter] postNotificationName:kMDFFetchGlobalSearchResultsContextCompleted object:data];
}

@end

@implementation MDFFetchGlobalSearchResultsContext

- (id)initWithClient:(id<MDFPPMClientProtocol>)client decorator:(Class<MDFDictionaryToAnnotationDecoratorProtocol>)decorator
{
    self = [super initWithClient:client];
    
    if (self)
    {
        [self setDecorator:decorator];
    }
    
    return self;
}

- (void)main
{
    [self performSelectorOnMainThread:@selector(notifyOfContextStart)
                           withObject:nil
                        waitUntilDone:NO];
    
    [self notifyOfContextStart];
    
    MDFClient2DGeoLocation location = MDFClient2DGeoLocationMake(0.0f, 0.0f);
    
    NSArray *results = [self.client fetchGlobalSearchResultsFor2DLocation:location];
    NSMutableArray *decoratedResults = [NSMutableArray arrayWithCapacity:[results count]];
    
    [results enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [decoratedResults insertObject:[self.decorator decorateDictionary:obj] atIndex:idx];
    }];
 
    [self performSelectorOnMainThread:@selector(notifyOfContextCompletion:)
                           withObject:decoratedResults
                        waitUntilDone:YES];
}

@end
