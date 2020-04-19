//
//  MasterViewControllerMock.swift
//  MobileTests
//
//  Created by jack on 19/4/20.
//  Copyright © 2020 fl. All rights reserved.
//

@testable import Mobile
import Foundation
import XCTest

class MasterViewControllerMock: MasterViewProtocol {
    
    var expectation: XCTestExpectation!
 
    
    func receivedData(data: [MasterViewModel]) {
        expectation.fulfill()
    }
    
    
    
    func receivedDataFailed() {
        expectation.fulfill()
    }
    
    
    
    
}
