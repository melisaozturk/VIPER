//
//  FilterCell.swift
//  CicekSepeti
//
//  Created by melisa öztürk on 15.07.2020.
//  Copyright © 2020 melisa öztürk. All rights reserved.
//

import UIKit

class FilterCell: UITableViewCell {
    
    @IBOutlet weak var btnCategoryOne: UIButton!
    @IBOutlet weak var btnCategoryTwo: UIButton!
    @IBOutlet weak var btnCategoryThree: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData() {
        self.btnCategoryOne.setTitle("Çiçek", for: .normal)
        self.btnCategoryTwo.setTitle("Yenilebilir Çiçek", for: .normal)
        self.btnCategoryThree.setTitle("Hediye", for: .normal)
        
        self.btnCategoryOne.layer.borderWidth = 1.0
        self.btnCategoryOne.layer.borderColor = UIColor.gray.cgColor
        
        self.btnCategoryTwo.layer.borderWidth = 1.0
        self.btnCategoryTwo.layer.borderColor = UIColor.gray.cgColor
        
        self.btnCategoryThree.layer.borderWidth = 1.0
        self.btnCategoryThree.layer.borderColor = UIColor.gray.cgColor
    }
}
