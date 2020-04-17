//
//  MasterViewPresenter.swift
//  Mobile
//
//  Created by jack on 17/4/20.
//  Copyright © 2020 fl. All rights reserved.
//

import Foundation


protocol MasterViewPresenterProtocol {
    
}


class MasterViewPresenter {
    
    weak var view: MasterViewProtocol?
    
    required init(view: MasterViewProtocol) {
        self.view = view
    }
    
    
    
}


extension MasterViewPresenter : MasterViewPresenterProtocol {
    
    
    
    
}

