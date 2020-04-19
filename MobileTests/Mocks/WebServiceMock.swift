//
//  WebServiceMock.swift
//  MobileTests
//
//  Created by jack on 19/4/20.
//  Copyright © 2020 fl. All rights reserved.
//

import Foundation
@testable import Mobile


class WebServiceMock: WebService {

    var localJsonName = ""
    
    override func getMobileDataUsageRequest(successHandler: @escaping (MobileDataUsage) -> Void, failureHandler: @escaping () -> Void) -> URLSessionDataTask {

        if let data = try? Data.fromJSON(fileName: localJsonName) {

            let decoder = JSONDecoder()
            if let mobileDataUsage = try? decoder.decode(MobileDataUsage.self, from: data) {
                successHandler(mobileDataUsage)
            }
            else {
                failureHandler()
            }
        }
        else {
             failureHandler()
        }
        
        return URLSessionDataTask()
        
    }
    
    
    
    
    
}
