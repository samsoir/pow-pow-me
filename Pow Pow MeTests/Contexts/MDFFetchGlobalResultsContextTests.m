//
//  MDFFetchGlobalResultsContextTests.m
//  Pow Pow Me
//
//  Created by Sam de Freyssinet on 28/04/2014.
//  Copyright (c) 2014 Maison de Freyssinet. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MDFFetchGlobalSearchResultsContext.h"
#import "MDFDictionaryToAnnotationDecorator.h"
#import "MDFPPMMockClient.h"
#import <OCMock/OCMock.h>

@interface MDFFetchGlobalResultsContextTests : XCTestCase

@end

@implementation MDFFetchGlobalResultsContextTests

- (NSArray *)fixture
{
    return @[
            @{
                @"title": @"Test location",
                @"subtitle": @"Test subtitle",
                @"coordinates": @{
                        @"latitude": @50.1130423,
                        @"longitude": @-122.9532126
                        }
                }];
}

- (id<MDFPPMClientProtocol>)clientMock
{
    return [OCMockObject mockForProtocol:@protocol(MDFPPMClientProtocol)];
}

- (id<MDFDictionaryToAnnotationDecoratorProtocol>)decoratorMock
{
    return [OCMockObject mockForProtocol:@protocol(MDFDictionaryToAnnotationDecoratorProtocol)];
}

- (id)observerMock
{
    return [OCMockObject observerMock];
}

- (void)testContextInitialization
{
    id mockDecorator = [self decoratorMock];
    id mockClient    = [self clientMock];
    
    MDFFetchGlobalSearchResultsContext *subject = [[MDFFetchGlobalSearchResultsContext alloc] initWithClient:mockClient decorator:[mockDecorator class]];
    
    XCTAssertEqual([subject client], mockClient, @"Client should be assigned to context");
}

- (void)testMain
{
    id mockClient = [self clientMock];
    
    Class<MDFDictionaryToAnnotationDecoratorProtocol> decoratorClass = [MDFDictionaryToAnnotationDecorator class];

    [[[mockClient stub] andReturn:[self fixture]] fetchGlobalSearchResultsForLatitude:(CGFloat)0.0 longitude:(CGFloat)0.0];
    
    MDFFetchGlobalSearchResultsContext *subject = [[MDFFetchGlobalSearchResultsContext alloc] initWithClient:mockClient decorator:decoratorClass];

    [subject main];
    
// TODO This test needs more work
}

@end
