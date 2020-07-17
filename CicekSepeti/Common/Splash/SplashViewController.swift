//
//  SplashViewController.swift
//  CicekSepeti
//
//  Created by melisa öztürk on 14.07.2020.
//  Copyright © 2020 melisa öztürk. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        perform(#selector(showView), with: nil, afterDelay: 2)
    }
    
    @objc func showView(){
        let list = ListWireframe.createListModule(data: nil)
        
        if let navigation = navigationController {
            navigation.viewControllers = [list]
        } else {
            let navigationC = UINavigationController()
            navigationC.viewControllers = [list]
        }
    }

}
