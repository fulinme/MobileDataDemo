//
//  MasterTableViewCell.swift
//  Mobile
//
//  Created by jack on 17/4/20.
//  Copyright © 2020 fl. All rights reserved.
//

import UIKit

class MasterTableViewCell: UITableViewCell {

    var imageViewTapHandler:(() -> ())?
    
    var data: MasterViewModel? = nil
    
    static let identifier = "MasterTableViewCell"
    
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var yearDataLabel: UILabel!
    @IBOutlet weak var chartImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    static func nib() -> UINib {
           return UINib(nibName: identifier, bundle: nil)
    }
    
    
    @objc func imageViewTap() {
        imageViewTapHandler?()
    }
    
    private func configImageViewClick() {
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(imageViewTap))
        
        chartImageView.addGestureRecognizer(tap)
    }
    
    
    func setData(data: MasterViewModel) {
        self.data = data
        
        yearLabel.text = data.year
        yearDataLabel.text = String(format: "%.6f" ,data.yearVolumeOfMobileDataValue)
        
        if data.hasQuarterDecrease {
            chartImageView.isHidden = false
            configImageViewClick()
        }
        else {
            chartImageView.isHidden = true
        }
        
    }
     
    
    
}
