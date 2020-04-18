//
//  MasterViewController.swift
//  Mobile
//
//  Created by jack on 17/4/20.
//  Copyright © 2020 fl. All rights reserved.
//

import UIKit

protocol MasterViewProtocol: AnyObject  {
    
    func receivedData(data: [MasterViewModel])
    
}


class MasterViewController:  UIViewController {

    
    fileprivate lazy var presenter : MasterViewPresenterProtocol = {
        return MasterViewPresenter(view: self)
    }()
    
    
    var data:[MasterViewModel] = []

    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        
        presenter.loadData()
        
    }
    
    
    private func setUI() {
        tableView.register(MasterTableViewCell.nib(), forCellReuseIdentifier: MasterTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        
        
    }

    

}



extension MasterViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MasterTableViewCell.identifier , for: indexPath) as! MasterTableViewCell
         
        let viewModel = data[indexPath.row]
        cell.setData(data: viewModel)
        
        return cell
    }
    
    
}


extension MasterViewController: UITableViewDelegate {
    

    
}



extension MasterViewController: MasterViewProtocol {
    func receivedData(data: [MasterViewModel]) {
        print("*******")
        print(data)
        
        self.data = data
        tableView.reloadData()
    }
    
    
    

}
