//
//  MDFStatusBarTests.m
//  Pow Pow Me
//
//  Created by Sam de Freyssinet on 17/05/2014.
//  Copyright (c) 2014 Maison de Freyssinet. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MDFStatusBar.h"

@interface MDFStatusBarTests : XCTestCase

@end

@implementation MDFStatusBarTests

- (CGRect)frame
{
    return CGRectMake(0.0, 0.0, 320.0, 30.0);
}

- (NSString *)title
{
    return @"Test Title";
}

- (void)testInitWithFrameTitle
{
    CGRect frame    = [self frame];
    NSString *title = [self title];
    
    MDFStatusBar *subject = [[MDFStatusBar alloc] initWithFrame:frame title:title];
    
    XCTAssertEqualObjects([[subject statusLabel] text], title, @"Title label should match title");
    XCTAssertTrue(CGRectEqualToRect(frame, [subject frame]), @"Frame should be equal to injected frame");
}

- (void)testHideStatusBarNotAnimated
{
    CGRect frame    = [self frame];
    NSString *title = [self title];
    
    MDFStatusBar *subject = [[MDFStatusBar alloc] initWithFrame:frame title:title];
    [subject setHidden:NO];

    [subject hideStatusBar:NO completion:nil];
    
    XCTAssertTrue([subject alpha] == 0.0f, @"Status bar should be hidden");
}

- (void)testHideStatusBarAnimated
{
    CGRect frame    = [self frame];
    NSString *title = [self title];
    
    MDFStatusBar *subject = [[MDFStatusBar alloc] initWithFrame:frame title:title];
    [subject setHidden:NO];
    
    [subject hideStatusBar:YES completion:^{
        XCTAssertTrue([subject alpha] == 0.0f, @"Status bar should be hidden");
    }];
}

- (void)testShowStatusBarNotAnimated
{
    CGRect frame    = [self frame];
    NSString *title = [self title];
    
    MDFStatusBar *subject = [[MDFStatusBar alloc] initWithFrame:frame title:title];
    [subject setHidden:YES];
    
    [subject showStatusBar:NO completion:nil];
    
    XCTAssertFalse([subject alpha] == 0.0f, @"Status bar should not be hidden");
}

- (void)testShowStatusBarAnimated
{
    CGRect frame    = [self frame];
    NSString *title = [self title];
    
    MDFStatusBar *subject = [[MDFStatusBar alloc] initWithFrame:frame title:title];
    [subject setHidden:YES];
    
    [subject showStatusBar:NO completion:^{
        XCTAssertFalse([subject alpha] == 0.0f, @"Status bar should not be hidden");
    }];
}

- (void)testStatusBarText
{
    CGRect frame    = [self frame];
    NSString *title = [self title];
    
    MDFStatusBar *subject = [[MDFStatusBar alloc] initWithFrame:frame title:title];

    XCTAssertEqualObjects(title, [subject statusBarText], @"Status bar text should equal title");
}

- (void)testSetStatusBarText
{
    CGRect frame    = [self frame];
    NSString *title = [self title];
    
    MDFStatusBar *subject = [[MDFStatusBar alloc] initWithFrame:frame title:title];

    NSString *newTitle = @"New title for status bar";
    
    [subject setStatusBarText:newTitle];
    
    XCTAssertEqualObjects(newTitle, [subject.statusLabel text], @"Subject status label titles should be equal");
}

@end
