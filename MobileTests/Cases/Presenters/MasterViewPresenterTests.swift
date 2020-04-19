//
//  MasterViewPresenterTests.swift
//  MobileTests
//
//  Created by jack on 19/4/20.
//  Copyright © 2020 fl. All rights reserved.
//
@testable import Mobile
import XCTest

class MasterViewPresenterTests: XCTestCase {

    
    var sut: MasterViewPresenter!
    
    var masterViewControllerMock: MasterViewControllerMock!
    var webserviceMock: WebServiceMock!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        webserviceMock = WebServiceMock(session: .shared)
        masterViewControllerMock = MasterViewControllerMock()
            
        sut = MasterViewPresenter(view: masterViewControllerMock)
        sut.webService = webserviceMock
    
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        masterViewControllerMock = nil
        webserviceMock = nil
        sut = nil
    }

    
    func test_presenter_loadData_withValidData_handlerSuccess() throws {
        
        let expectation = self.expectation(description: "receivedData invoked")
        masterViewControllerMock.expectation = expectation
        
        webserviceMock.localJsonName = "datastore_search"
        
        sut.loadData()
        
        wait(for: [expectation], timeout: 2)
        
        
    }
    
    
    func test_presenter_loadData_withInValidData_handlerSuccess() throws {
           
           let expectation = self.expectation(description: "receivedDataFailed invoked")
           masterViewControllerMock.expectation = expectation
           
           webserviceMock.localJsonName = "datastore_search_invalid"
           
           sut.loadData()
           
           wait(for: [expectation], timeout: 2)
           
           
       }

     
    
    

}
