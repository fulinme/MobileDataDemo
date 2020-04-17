//
//  MasterViewController.swift
//  Mobile
//
//  Created by jack on 17/4/20.
//  Copyright © 2020 fl. All rights reserved.
//

import UIKit

protocol MasterViewProtocol: AnyObject  {
    
    
}



class MasterViewController:  UIViewController {

    
    fileprivate lazy var presenter : MasterViewPresenterProtocol = {
        return MasterViewPresenter(view: self)
    }()
    
    
    var data = [MasterViewModel]()


    
    
    
}



extension MasterViewController: MasterViewProtocol {
    
    
    
    
}
