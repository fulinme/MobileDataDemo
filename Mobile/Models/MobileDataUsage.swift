//
//  MobileDataUsage.swift
//  Mobile
//
//  Created by jack on 17/4/20.
//  Copyright © 2020 fl. All rights reserved.
//

import Foundation

// MARK: - MobileDataUsage
struct MobileDataUsage: Codable, Equatable {

    let help: String
    let success: Bool
    let result: ResultObj

    enum CodingKeys: String, CodingKey {
        case help
        case success
        case result = "result"
    }

    
    static func == (lhs: MobileDataUsage, rhs: MobileDataUsage) -> Bool {
        return lhs.help == rhs.help && lhs.success == rhs.success  && lhs.result == rhs.result
    }
}


// MARK: - Result
struct ResultObj: Codable, Equatable {
   
    
    let resourceID: String
    let fields: [Field]
    let records: [Record]
    let links: Links
    let limit, total: Int
    
    enum CodingKeys: String, CodingKey {
           case resourceID = "resource_id"
           case fields
           case records
           case links = "_links"
           case limit
           case total
    }
    
    
    static func == (lhs: ResultObj, rhs: ResultObj) -> Bool {
        return lhs.resourceID == rhs.resourceID
    }
    
}

// MARK: - Field
struct Field: Codable {
    let type, id: String
}


// MARK: - Links
struct Links: Codable {
    let start, next: String
}


// MARK: - Record
struct Record: Codable {
    let volumeOfMobileData, quarter: String
    let id: Int
    
    enum CodingKeys: String, CodingKey {
              case volumeOfMobileData = "volume_of_mobile_data"
              case quarter
              case id = "_id"
          }
}

extension Record {
    var volumeOfMobileDataValue : Double {
        //guard let value = volumeOfMobileData else { return nil }
        return Double(volumeOfMobileData) ?? 0
    }
    
    var year: String {
        return (quarter.components(separatedBy: "-"))[0]
    }
    
}
