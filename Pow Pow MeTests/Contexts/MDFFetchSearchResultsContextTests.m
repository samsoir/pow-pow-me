//
//  MDFFetchSearchResultsContext.m
//  Pow Pow Me
//
//  Created by Sam de Freyssinet on 20/06/2014.
//  Copyright (c) 2014 Maison de Freyssinet. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "MDFFetchSearchResultsContext.h"
#import "MDFPPMMockClient.h"

static dispatch_semaphore_t semaphore = NULL;

@interface MDFFetchSearchResultsContextTests : XCTestCase

@end

@implementation MDFFetchSearchResultsContextTests

- (void)didReceiveCompletionNotification:(NSNotification *)notification
{
    if (semaphore)
    {
        dispatch_semaphore_signal(semaphore);
    }
}

- (MDFFetchSearchResultsContext *)subject
{
    return [self subjectWithClient:[self mockClient]
                          location:[self location]
                           options:[self options]];
}

- (MDFFetchSearchResultsContext *)subjectWithClient:(id)client location:(MDFClient2DGeoLocation)location options:(NSDictionary *)options
{
    return [[MDFFetchSearchResultsContext alloc] initWithClient:client
                                                       location:location
                                                        options:options];
}

- (MDFClient2DGeoLocation)location
{
    return MDFClient2DGeoLocationMake(0.0f, 0.0f);
}

- (NSDictionary *)options
{
    return @{@"foo": @"bar"};
}

- (NSSet *)mockResults
{
    return [NSSet setWithArray:@[
                                 @{},
                                 @{},
                                 @{}
                                ]];
}

- (id)mockClient
{
    id mockClient = [OCMockObject mockForProtocol:@protocol(MDFPPMClientProtocol)];
    return mockClient;
}

- (void)testIntialization
{
    MDFClient2DGeoLocation location = [self location];
    NSDictionary *options           = [self options];
    id mockClient                   = [self mockClient];
    
    MDFFetchSearchResultsContext *subject = [[MDFFetchSearchResultsContext alloc] initWithClient:mockClient
                                                                                        location:location
                                                                                        options:options];
    
    XCTAssertNotNil(subject, @"Initialization should return valid object");
    XCTAssertTrue(MDFClient2DGeoLocationEqualTo2DGeoLocation(subject.location, location), @"Locations should be equal");
    XCTAssertEqualObjects(options, subject.searchOptions, @"Options should be equal");
}


- (void)testMain
{
    MDFFetchSearchResultsContext *subject = [self subject];
    id observerMock = [OCMockObject observerMock];
    id mockClient = [self mockClient];
    
    [[[mockClient stub] andReturn:[self mockResults]] fetchSearchResultsFor2DLocation:[self location]
                                                               options:[self options]];
    
    [subject setClient:mockClient];
    
    [[observerMock expect] notificationWithName:kMDFFetchSearchResultsContextDidCompleteNotification
                                         object:[OCMArg any]];
    
    [[NSNotificationCenter defaultCenter] addMockObserver:observerMock
                                                     name:kMDFFetchSearchResultsContextDidCompleteNotification
                                                   object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didReceiveCompletionNotification:)
                                                 name:kMDFFetchSearchResultsContextDidCompleteNotification
                                               object:nil];
    
    semaphore = dispatch_semaphore_create(0);
    
    [subject main];
    
    dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * 5));

    [observerMock verify];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
