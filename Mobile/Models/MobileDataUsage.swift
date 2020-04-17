//
//  MobileDataUsage.swift
//  Mobile
//
//  Created by jack on 17/4/20.
//  Copyright © 2020 fl. All rights reserved.
//

import Foundation


// MARK: - MobileDataUsage
struct MobileDataUsage {
    let help: String
    let success: Bool
    let result: ResultObj

     enum CodingKeys: String, CodingKey {
        case help
        case success
        case ResultObj = "result"
    }

}


// MARK: - Result
struct ResultObj {
    let resourceID: String
    let fields: [Any?]
    let records: [Record]
    let links: Links
    let limit, total: Int
}

// MARK: - Links
struct Links {
    let start, next: String
}


// MARK: - Record
struct Record {
    let volumeOfMobileData, quarter: String
    let id: Int
}
