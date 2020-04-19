//
//  MobileTests.swift
//  MobileTests
//
//  Created by jack on 17/4/20.
//  Copyright © 2020 fl. All rights reserved.
//

import XCTest
@testable import Mobile

class MobileTests: XCTestCase {

   var sut: URLSession!

       
       override func setUpWithError() throws {
           // Put setup code here. This method is called before the invocation of each test method in the class.
          sut = URLSession(configuration: .default)
       }

       override func tearDownWithError() throws {
           // Put teardown code here. This method is called after the invocation of each test method in the class.
           sut = nil
       }

       func testValidCallToMobiledataGetsHTTPStatusCode200() throws {
           // This is an example of a functional test case.
           // Use XCTAssert and related functions to verify your tests produce the correct results.
           
           //give
           let url = URL(string: WebServiceUrls.URL_data_gov_sg_mobiledata)!
           let promise = expectation(description: "Status code: 200")
           var statusCode: Int?
           var responseError: Error?
           
           // when
           let dataTask = sut.dataTask(with: url) { data, response, error in
               
               statusCode = (response as? HTTPURLResponse)?.statusCode
               responseError = error
               promise.fulfill()
           }
       
           dataTask.resume()
           wait(for: [promise], timeout: 5)
           
           //then
           XCTAssertNil(responseError)
           XCTAssertEqual(statusCode, 200)
       }
       
       
       
       

       func testPerformanceExample() throws {
           // This is an example of a performance test case.
           self.measure {
               // Put the code you want to measure the time of here.
           }
       }

}
