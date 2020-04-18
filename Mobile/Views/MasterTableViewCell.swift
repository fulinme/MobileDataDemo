//
//  MasterTableViewCell.swift
//  Mobile
//
//  Created by jack on 17/4/20.
//  Copyright © 2020 fl. All rights reserved.
//

import UIKit

class MasterTableViewCell: UITableViewCell {

    var data: MasterViewModel? = nil
    
    static let identifier = "MasterTableViewCell"
    
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var yearDataLabel: UILabel!
    @IBOutlet weak var chartImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    static func nib() -> UINib {
           return UINib(nibName: identifier, bundle: nil)
    }
    
    
    func setData(data: MasterViewModel) {
        
        yearLabel.text = data.year
        yearDataLabel.text = String(format: "%.6f" ,data.yearVolumeOfMobileDataValue)
        
        data.hasQuarterDecrease ? (chartImageView.isHidden = false) : (chartImageView.isHidden = true)
        
    }
     
    
    
}
