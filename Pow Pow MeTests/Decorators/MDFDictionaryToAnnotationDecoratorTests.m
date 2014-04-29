//
//  MDFDictionaryToAnnotationDecoratorTests.m
//  Pow Pow Me
//
//  Created by Sam de Freyssinet on 28/04/2014.
//  Copyright (c) 2014 Maison de Freyssinet. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <MapKit/MapKit.h>
#import "MDFDictionaryToAnnotationDecorator.h"

@interface MDFDictionaryToAnnotationDecoratorTests : XCTestCase

@end

@implementation MDFDictionaryToAnnotationDecoratorTests

- (NSDictionary *)fixture
{
    return @{
             @"title": @"Test location",
             @"subtitle": @"Test subtitle",
             @"coordinates": @{
                     @"latitude": @50.1130423,
                     @"longitude": @-122.9532126
                     }
             };
}

- (void)testDictionaryToAnnotationDecorator
{
    NSDictionary *fixture = [self fixture];
    
    id<MKAnnotation> subject = [MDFDictionaryToAnnotationDecorator decorateDictionary:fixture];
    
    XCTAssertNotNil(subject, @"Subject should not be nil");
    XCTAssertEqualObjects([subject title], [fixture objectForKey:@"title"], @"Title should match fixture");
    XCTAssertEqualObjects([subject subtitle], [fixture objectForKey:@"subtitle"], @"Subtitle should match fixture");
    
    CLLocationCoordinate2D coordinateExpected = CLLocationCoordinate2DMake([[fixture valueForKeyPath:@"coordinates.latitude"] floatValue], [[fixture valueForKeyPath:@"coordinates.longitude"] floatValue]);
    
    XCTAssertTrue(coordinateExpected.latitude == [subject coordinate].latitude, @"Latitudes should be equal");
    XCTAssertTrue(coordinateExpected.longitude == [subject coordinate].longitude, @"Latitudes should be equal");
}

@end
