//
//  MasterViewViewModel.swift
//  Mobile
//
//  Created by jack on 17/4/20.
//  Copyright © 2020 fl. All rights reserved.
//

import Foundation


struct MasterViewModel {
    
    let year: String
    var hasQuarterDecrease: Bool = false
    
    var yearVolumeOfMobileDataValue: Double
    
    var record: [MasterRecordViewModel]
    
    
    mutating func setHasQuarterDecrease(newValue: Bool) {
        hasQuarterDecrease = newValue
    }
    
    mutating func setYearVolumeOfMobileData(newValue: Double) {
        yearVolumeOfMobileDataValue = newValue
    }
    
    mutating func addRecord(newRecord: MasterRecordViewModel) {
        record.append(newRecord)
    }
    
}



struct MasterRecordViewModel {
    
    let quarter, year: String
    let quarterVolumeOfMobileDataValue: Double
    
}
