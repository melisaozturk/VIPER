//
//  UIManager.swift
//  CicekSepeti
//
//  Created by melisa öztürk on 14.07.2020.
//  Copyright © 2020 melisa öztürk. All rights reserved.
//

import Foundation
import UIKit

protocol UIManagerDelegate {
    func showLoading(view: UIView)
    func removeLoading(view:UIView)
}

class UIManager: UIManagerDelegate {
    
    let loading = LoadingView()
    private static var sharedInstance: UIManager?
    
    public class func shared() -> UIManager {
        if sharedInstance == nil {
            sharedInstance = UIManager()
        }
        return sharedInstance!
    }
    
    
    func showLoading(view: UIView) {
        view.addSubview(self.loading)
        view.isUserInteractionEnabled = false
        loading.translatesAutoresizingMaskIntoConstraints = false
        loading.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        loading.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        loading.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        loading.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
    
    func removeLoading(view:UIView){
        view.isUserInteractionEnabled = true
        loading.removeFromSuperview()
    }
}
