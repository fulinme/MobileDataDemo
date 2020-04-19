//
//  URLSessionMock.swift
//  MobileTests
//
//  Created by jack on 19/4/20.
//  Copyright © 2020 fl. All rights reserved.
//

import Foundation
@testable import Mobile

class URLSessionMock: URLSession {
    
   
    override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskMock {
        
        return URLSessionDataTaskMock(completioHandler: completionHandler, url: url)
        
    }
    
    
}
