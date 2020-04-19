//
//  MasterViewControllerTests.swift
//  MobileTests
//
//  Created by jack on 18/4/20.
//  Copyright © 2020 fl. All rights reserved.
//

import XCTest
@testable import Mobile

class MasterViewControllerTests: XCTestCase {

    var sut: MasterViewController!
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = UIStoryboard(name: "Main", bundle: nil)
        .instantiateInitialViewController() as? MasterViewController
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
