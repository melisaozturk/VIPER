//
//  FilterCell.swift
//  CicekSepeti
//
//  Created by melisa öztürk on 15.07.2020.
//  Copyright © 2020 melisa öztürk. All rights reserved.
//

import UIKit

class FilterCell: UITableViewCell {
    
    @IBOutlet weak var btnFilter: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.btnFilter.layer.borderWidth = 1.0
        self.btnFilter.layer.borderColor = UIColor.gray.cgColor
        self.btnFilter.backgroundColor = UIColor.white
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
