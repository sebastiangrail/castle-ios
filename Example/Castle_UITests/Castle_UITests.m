//
//  AutmaticScreenViewEvents.m
//  Castle_UITests
//
//  Created by Alexander Simson on 2020-01-10.
//  Copyright © 2020 Alexander Simson. All rights reserved.
//

@import XCTest;

#import <Castle/Castle.h>

@interface Castle_UITests : XCTestCase

@end

@implementation Castle_UITests

- (void)setUp {
    self.continueAfterFailure = YES;
    [[[XCUIApplication alloc] init] launch];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testAutomaticScreenTracking {
    XCUIApplication *app = [[XCUIApplication alloc] init];

    [app.buttons[@"reset"] tap];
    XCTAssertTrue(app.staticTexts[@"Queue size: 1"].exists);

    // Tap screen track button
    [app.buttons[@"trackScreen"] tap];
    XCTAssertTrue(app.staticTexts[@"Queue size: 1"].exists);
    
    [app.buttons[@"push"] tap];
    XCTAssertTrue(app.staticTexts[@"Queue size: 2"].exists);
    
    [app.buttons[@"push"] tap];
    XCTAssertTrue(app.staticTexts[@"Queue size: 3"].exists);
    
    [app.buttons[@"push"] tap];
    XCTAssertTrue(app.staticTexts[@"Queue size: 4"].exists);
    
    [app.buttons[@"push"] tap];
    XCTAssertTrue(app.staticTexts[@"Queue size: 5"].exists);
    
    [app.navigationBars[@"View Controller 4"].buttons[@"View Controller 3"] tap];
    XCTAssertTrue(app.staticTexts[@"Queue size: 6"].exists);
    
    [app.navigationBars[@"View Controller 3"].buttons[@"View Controller 2"] tap];
    XCTAssertTrue(app.staticTexts[@"Queue size: 7"].exists);
    
    [app.navigationBars[@"View Controller 2"].buttons[@"View Controller 1"] tap];
    XCTAssertTrue(app.staticTexts[@"Queue size: 8"].exists);
    
    [app.navigationBars[@"View Controller 1"].buttons[@"Example"] tap];
    XCTAssertTrue(app.staticTexts[@"Queue size: 9"].exists);
    
    [app/*@START_MENU_TOKEN@*/.buttons[@"pushEmbedded"]/*[[".buttons[@\"Push Embedded View Controller\"]",".buttons[@\"pushEmbedded\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/ tap];

    [app.tabBars.buttons[@"Item 2"] tap];
    
    [app.navigationBars[@"UITabBar"].buttons[@"Example"] tap];
    XCTAssertTrue(app.staticTexts[@"Queue size: 12"].exists);
}

@end
