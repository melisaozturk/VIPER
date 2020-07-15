//
//  FilterViewController.swift
//  CicekSepeti
//
//  Created by melisa öztürk on 15.07.2020.
//  Copyright © 2020 melisa öztürk. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    weak var presenter: FilterViewToPresenterProtocol?
    var filters = [DynamicFilter]()
    var id: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewSetup()
        navigationSetup()
    }
    
    private func tableViewSetup() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView()
        self.tableView.register(UINib(nibName: "FilterCell", bundle: nil), forCellReuseIdentifier: "FilterCell")
    }
    
    private func navigationSetup() {
           self.title = "Filtrele"
           self.navigationController?.navigationBar.topItem?.backBarButtonItem =  UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
           self.navigationController?.navigationBar.topItem?.backBarButtonItem?.tintColor = .black
       }
}

extension FilterViewController: FilterPresenterToViewProtocol{
    
    func showList(listArray: [RootObject]) {
        
        UIManager.shared().removeLoading(view: self.view)
        presenter?.startFetchingData() //TODO: Verileri çekerken id sine göre sadece o product'lar çekilecek
        self.tableView.reloadData()
    }
    
    func showError() {
        UIManager.shared().removeLoading(view: self.view)
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching List", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: { _  in
            exit(0)
        }))
        self.present(alert, animated: true, completion: nil)
    }
}


extension FilterViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilterCell", for: indexPath) as! FilterCell
        cell.setData()
       
//        if cell.btnCategoryOne.isSelected {
//
//        } else if cell.btnCategoryTwo.isSelected {
//
//        } else if cell.btnCategoryThree.isSelected {
//
//        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = Header()
        headerView.lblHeader.text = "HEADER TEXT HERE"
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}
