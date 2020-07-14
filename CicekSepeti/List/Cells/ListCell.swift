//
//  ListCell.swift
//  CicekSepeti
//
//  Created by melisa öztürk on 14.07.2020.
//  Copyright © 2020 melisa öztürk. All rights reserved.
//

import UIKit
import Kingfisher

class ListCell: UITableViewCell {

    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(data: Product) {
        if let name = data.name, let price = data.price!.total, let image = data.image {
            let url = URL(string: image)
            self.imgProduct.kf.setImage(with: url)
            
            self.lblName.text = name
            self.lblPrice.text = String(describing: price)
        }
    }
}
