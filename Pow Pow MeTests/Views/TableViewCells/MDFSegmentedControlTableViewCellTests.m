//
//  MDFSegmentedControlTableViewCellTests.m
//  Pow Pow Me
//
//  Created by Sam de Freyssinet on 14/06/2014.
//  Copyright (c) 2014 Maison de Freyssinet. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "MDFSegmentedControlTableViewCell.h"

@interface MDFSegmentedControlTableViewCellTests : XCTestCase

@end

@implementation MDFSegmentedControlTableViewCellTests

- (MDFSegmentedControlTableViewCell *)subject
{
    return [[MDFSegmentedControlTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
}

- (void)testSetSegmentedControl
{
    id mockSegmentedControl = [OCMockObject mockForClass:[UISegmentedControl class]];
    
    MDFSegmentedControlTableViewCell *subject = [self subject];
    
    [subject setSegmentedControl:mockSegmentedControl];
    
    XCTAssertEqualObjects(mockSegmentedControl, [subject segmentedControl], @"UISegmentedControl should be set to the subject");
}

- (void)testSetSegmentedControlReplacesOldView
{
    UISegmentedControl *testControl = [[UISegmentedControl alloc] init];
    id mockSegmentedControl = [OCMockObject partialMockForObject:testControl];
    UISegmentedControl *testControlReplacement = [[UISegmentedControl alloc] init];

    [[mockSegmentedControl expect] removeFromSuperview];
    
    MDFSegmentedControlTableViewCell *subject = [self subject];
    
    [subject setSegmentedControl:mockSegmentedControl];
    [subject setSegmentedControl:testControlReplacement];
    
    XCTAssertEqualObjects(testControlReplacement, [subject segmentedControl], @"UISegmentedControl should be set to the replacement");
    XCTAssertEqualObjects([testControlReplacement superview], [subject contentView], @"The superview of the UISegmentedControl should be the subject content view");
    
    [mockSegmentedControl verify];
}

- (void)testSetSameSegmentedControlDoesNothing
{
    UISegmentedControl *testControl = [[UISegmentedControl alloc] init];
    id mockSegmentedControl = [OCMockObject partialMockForObject:testControl];
    MDFSegmentedControlTableViewCell *subject = [self subject];

    [subject setSegmentedControl:mockSegmentedControl];
    
    [[mockSegmentedControl reject] removeFromSuperview];
    
    [subject setSegmentedControl:mockSegmentedControl];
    
    XCTAssertEqualObjects(mockSegmentedControl, [subject segmentedControl], @"UISegmentedControl should be set to the replacement");
    
    [mockSegmentedControl verify];
}

- (void)testLayoutSubviews
{
    CGRect tableViewCellFrame = CGRectMake(0.0f, 0.0f, 320.0f, 44.0f);
    CGRect expectedSegmentedControlFrame = CGRectMake(17.0f, 0.0f, 286.0f, 44.0f);
    MDFSegmentedControlTableViewCell *subject = [self subject];
    [subject setFrame:tableViewCellFrame];

    UISegmentedControl *testControl = [[UISegmentedControl alloc] init];
    id mockSegmentedControl = [OCMockObject partialMockForObject:testControl];
    
    [subject setSegmentedControl:mockSegmentedControl];

    [subject layoutSubviews];
    
    XCTAssertTrue(CGRectEqualToRect(expectedSegmentedControlFrame, [mockSegmentedControl frame]), @"Test controls frame should match expected frame");
}

- (void)testSetSegmentedControlSetNeedsLayout
{
    UISegmentedControl *testControl = [[UISegmentedControl alloc] init];
    MDFSegmentedControlTableViewCell *subject = [self subject];
    id mockSubject = [OCMockObject partialMockForObject:subject];
    
    [[mockSubject expect] setNeedsLayout];
    
    [mockSubject setSegmentedControl:testControl];
    
    [mockSubject verify];
}

@end
