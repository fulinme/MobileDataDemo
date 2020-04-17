//
//  MasterTableViewCell.swift
//  Mobile
//
//  Created by jack on 17/4/20.
//  Copyright © 2020 fl. All rights reserved.
//

import UIKit

class MasterTableViewCell: UITableViewCell {

    static let identifier = "MasterTableViewCell"
    
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var dataLabel: UILabel!
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
    
    
}
