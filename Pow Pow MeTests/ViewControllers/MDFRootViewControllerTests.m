//
//  MDFRootViewControllerTests.m
//  Pow Pow Me
//
//  Created by Sam de Freyssinet on 27/04/2014.
//  Copyright (c) 2014 Maison de Freyssinet. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MDFRootViewController.h"

@interface MDFRootViewControllerTests : XCTestCase

@end

@implementation MDFRootViewControllerTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


- (void)testCreateNewRootViewControllerInstance
{
    id subject = [MDFRootViewController rootViewController];
    
    XCTAssertNotNil(subject, "rootViewController should not return a nil object");
    XCTAssertTrue([[subject class] isSubclassOfClass:[MDFRootViewController class]], @"rootViewController should be a MDFRootViewController");
}

- (void)testCreateNewRootViewControllerSingleton
{
    id subject = [MDFRootViewController rootViewController];
    id subject2 = [MDFRootViewController rootViewController];
    
    XCTAssertTrue([subject isEqual:subject2], @"%@ should be equal to %@", subject2, subject);
}



@end
