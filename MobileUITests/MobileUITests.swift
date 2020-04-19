//
//  MobileUITests.swift
//  MobileUITests
//
//  Created by jack on 17/4/20.
//  Copyright © 2020 fl. All rights reserved.
//

import XCTest

class MobileUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_imagebuttonTap() {
        
        
        let app = XCUIApplication()
        app.launch()
        
        app.tables/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"2011")/*[[".cells.containing(.staticText, identifier:\"14.638703\")",".cells.containing(.staticText, identifier:\"2011\")"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.images["icons8-graph-50"].waitForExistence(timeout: 8)
        
        app.tables/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"2011")/*[[".cells.containing(.staticText, identifier:\"14.638703\")",".cells.containing(.staticText, identifier:\"2011\")"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.images["icons8-graph-50"].tap()
        
        XCTAssertTrue(app.alerts["2011"].exists)
        
        app.alerts["2011"].buttons["OK"].tap()
        
        XCTAssertFalse(app.alerts["2011"].exists)
        
        
    }
    
    
    

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
