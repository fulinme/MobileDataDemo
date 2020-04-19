//
//  URLSessionDataTaskMock.swift
//  MobileTests
//
//  Created by jack on 19/4/20.
//  Copyright © 2020 fl. All rights reserved.
//

import Foundation
@testable import Mobile

class URLSessionDataTaskMock: URLSessionDataTask {
    
    var calledResume = false
    
    var completionHandler: (Data?, URLResponse?, Error?) -> Void
    var url: URL

    
    init(completioHandler: @escaping (Data?, URLResponse?, Error?) -> Void, url: URL) {
        self.completionHandler = completioHandler
        self.url = url
        
    }
    
    
    override func resume() {
         
        calledResume = true
    }
    
    
}
