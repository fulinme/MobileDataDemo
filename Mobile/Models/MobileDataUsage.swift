//
//  MobileDataUsage.swift
//  Mobile
//
//  Created by jack on 17/4/20.
//  Copyright © 2020 fl. All rights reserved.
//

import Foundation

// MARK: - MobileDataUsage
struct MobileDataUsage: Codable {
    let help: String
    let success: Bool
    let result: ResultObj

    enum CodingKeys: String, CodingKey {
        case help
        case success
        case result = "result"
    }

}


// MARK: - Result
struct ResultObj: Codable {
    let resourceID: String
    let fields: [Field]
    let records: [Record]
    let links: Links
    let limit, total: Int
    
    
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
}
