//
//  Header.swift
//  CicekSepeti
//
//  Created by melisa öztürk on 15.07.2020.
//  Copyright © 2020 melisa öztürk. All rights reserved.
//

import UIKit

class Header: UIView {

    @IBOutlet weak var lblHeader: UILabel!
  
    var view: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setup()
    }
    
    private func setup() {
        //Localization yap
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]

        addSubview(view)
    }
    
    private func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "Header", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
        
    }
}
