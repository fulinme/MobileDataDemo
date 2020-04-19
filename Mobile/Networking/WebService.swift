//
//  WebService.swift
//  Mobile
//
//  Created by jack on 17/4/20.
//  Copyright © 2020 fl. All rights reserved.
//

import Foundation


struct WebServiceUrls {
    static let URL_data_gov_sg_mobiledata = "https://data.gov.sg/api/action/datastore_search?resource_id=a807b7ab-6cad-4aa6-87d0-e283a7353a0f&limit=400"
 
}


protocol WebServiceProtocol {
    func getMobileDataUsageRequest(successHandler: @escaping (_ mobileDataUsage: MobileDataUsage) -> Void, failureHandler: @escaping () -> Void) -> URLSessionDataTask
    
}



class WebService: WebServiceProtocol {
   
    
    
    let session: URLSession
    
    static let shared = WebService(session: .shared)
    
    //Mark: dependency injection for testing
    init(session: URLSession) {
        self.session = session
    }
    
    func getMobileDataUsageRequest(successHandler: @escaping (_ mobileDataUsage: MobileDataUsage) -> Void, failureHandler: @escaping () -> Void) -> URLSessionDataTask
    {
         
             let url = URL(string: WebServiceUrls.URL_data_gov_sg_mobiledata)!
             
        
             let task = session.dataTask(with: url) {
                    (data, response, error) -> Void in
           
                 if let jsonData = data {
                     let decoder = JSONDecoder()
                        do {
                            let data = try decoder.decode(MobileDataUsage.self, from: jsonData)
                     
                            successHandler(data)
                            
                        }
                        catch {
                            failureHandler()
                        }
                 }
                 else {
                    failureHandler()
                 }
             }
        
             task.resume()
        
            return task
     }
    
    
    
    
    
    
}
 
