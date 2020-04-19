//
//  WebServiceTests.swift
//  MobileTests
//
//  Created by jack on 19/4/20.
//  Copyright © 2020 fl. All rights reserved.
//

import XCTest
@testable import Mobile

class WebServiceTests: XCTestCase {

    
    var sut: WebServiceProtocol!
    var urlSessionMock: URLSessionMock!
    var url:URL!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        urlSessionMock = URLSessionMock()
        url = URL(string: "https://data.gov.sg/api/action/datastore_search?resource_id=a807b7ab-6cad-4aa6-87d0-e283a7353a0f&limit=400")!
        sut = WebService(session: urlSessionMock)
        
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        urlSessionMock = nil
        sut = nil
    }


    func test_getMobileDataUsageRequest_giveResponseStatusCode500_callsCompletion() {
        
        let response = HTTPURLResponse(url: url, statusCode: 500, httpVersion: nil, headerFields: nil)
        
        var calledCompletion = false
        var receivedData: MobileDataUsage? = nil

        
        let mockTask = sut.getMobileDataUsageRequest(successHandler: { mobileDataUsage in
            calledCompletion = true
            receivedData = mobileDataUsage
            
        }, failureHandler: {
            calledCompletion = true
            
        }) as! URLSessionDataTaskMock
    
        mockTask.completionHandler(nil, response, nil)
        
        XCTAssertTrue(calledCompletion)
        XCTAssertNil(receivedData)
        
    
    }
    
    
    
    
    
    
    
 
}
