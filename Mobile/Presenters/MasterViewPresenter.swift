//
//  MasterViewPresenter.swift
//  Mobile
//
//  Created by jack on 17/4/20.
//  Copyright © 2020 fl. All rights reserved.
//

import Foundation


protocol MasterViewPresenterProtocol {
    
    func loadData()
    
}


class MasterViewPresenter {
    
    weak var view: MasterViewProtocol?
    
    required init(view: MasterViewProtocol) {
        self.view = view
    }
    
    //Mark: assumption records Ascending order by year
    func convert(from data: MobileDataUsage) -> [MasterViewModel] {
        
        var result:[MasterViewModel] = []
        
        data.result.records.filter{ $0.year >= "2008" && $0.year <= "2018" }.forEach{
            record in
            
                let yearQuarterArray = record.quarter.components(separatedBy: "-")
                
                if let last = result.last, last.year == yearQuarterArray[0] {
                    
                    result[result.count-1].setYearVolumeOfMobileData(newValue: record.volumeOfMobileDataValue + last.yearVolumeOfMobileDataValue)
                    
                    if let lastRecord = last.record.last, record.volumeOfMobileDataValue < lastRecord.quarterVolumeOfMobileDataValue {
                        result[result.count-1].setHasQuarterDecrease(newValue: true)
                    }
                    
                    
                    result[result.count-1].addRecord(newRecord: MasterRecordViewModel(quarter: yearQuarterArray[1], year: yearQuarterArray[0], quarterVolumeOfMobileDataValue: record.volumeOfMobileDataValue))
                    
                }
                else {
                    result.append(MasterViewModel(year: yearQuarterArray[0],
                                                  yearVolumeOfMobileDataValue: record.volumeOfMobileDataValue , record: [MasterRecordViewModel(quarter: yearQuarterArray[1], year: yearQuarterArray[0], quarterVolumeOfMobileDataValue: record.volumeOfMobileDataValue)]))
                }
        }
        
        return result
    }
    
    
}


extension MasterViewPresenter : MasterViewPresenterProtocol {
    
    func loadData() {
        
        WebService.getMobileDataUsageRequest(successHandler: { [unowned self] mobileDataUsage in
            
            let viewData:[MasterViewModel] = self.convert(from: mobileDataUsage)
            
            DispatchQueue.main.async{
                self.view?.receivedData(data: viewData)
            }
            
                
        }, failureHandler: {
            
        })
        
    }
    
    
    
}

