//
//  ListViewController.swift
//  CicekSepeti
//
//  Created by melisa öztürk on 14.07.2020.
//  Copyright © 2020 melisa öztürk. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    weak var presenter: ViewToPresenterProtocol?
    var listArray = [RootObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.startFetchingData()
    
    }
    

}

extension ListViewController:PresenterToViewProtocol{
    
    func showList(listArray: [RootObject]) {
        
        self.listArray = listArray
    }
    
    func showError() {
        
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching List", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: { _  in
            exit(0)
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
