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
    @IBOutlet weak var btnFilter: UIBarButtonItem!
    
    weak var presenter: FilterViewToPresenterProtocol?
    var filters = [DynamicFilter]()
    var filteredProduct = [Product]()
    
    var checkList = [Int]()
    var detailList = [Int]()
    var priceList = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewSetup()
        navigationSetup()
        btnFilter.isEnabled = false
    }
    
    @IBAction func btnApply(_ sender: Any) {
        self.navigationController?.navigationBar.isUserInteractionEnabled = false
        UIManager.shared().showLoading(view: self.view)
         presenter?.startFetchingData()
    }
    
    private func tableViewSetup() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView()
        self.tableView.separatorStyle = .none
        self.tableView.isUserInteractionEnabled = true
        self.tableView.allowsMultipleSelection = true
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
        self.navigationController?.navigationBar.isUserInteractionEnabled = true
        for filters in listArray {
            //            Uygulanan filtre
            if let filtered = filters.resultObject.data?.products {
                self.filteredProduct = filtered
            }
        }
        self.presenter?.showListController(navigationController: navigationController!, data: self.filteredProduct)
    }
    
    func showError() {
        UIManager.shared().removeLoading(view: self.view)
        self.navigationController?.navigationBar.isUserInteractionEnabled = true
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching List", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: { _  in
            exit(0)
        }))
        self.present(alert, animated: true, completion: nil)
    }
}


extension FilterViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.filters.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        default:
            let values = self.filters[section].valuesObject!
            return values.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilterCell", for: indexPath) as! FilterCell
        cell.selectionStyle = .gray
        if !self.filters.isEmpty {
            let values = self.filters[indexPath.section].valuesObject!
                if let name = values[indexPath.row].name {
                    cell.btnFilter.setTitle(name, for: .normal)
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = Header()
        if !self.filters.isEmpty {
            if let name = self.filters[section].name {
                headerView.lblHeader.text = name
            }
        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        btnFilter.isEnabled = true
        if let group = self.filters[indexPath.section].valuesObject![indexPath.row].group, let id = self.filters[indexPath.section].valuesObject![indexPath.row].id {
            if group == 1 {
                UserDefaults.standard.set("detailList", forKey: "group")
                detailList.append(id)
                UserDefaults.standard.set(detailList, forKey: "detailList")
            } else if group == 2 {
                UserDefaults.standard.set("checkList", forKey: "group")
                checkList.append(id)
                UserDefaults.standard.set(checkList, forKey: "checkList")
            } else if group == 3 {
                UserDefaults.standard.set("priceList", forKey: "group")
                priceList.append(id)
                UserDefaults.standard.set(priceList, forKey: "priceList")
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        btnFilter.isEnabled = false

        UserDefaults.standard.removeObject(forKey: "group")
        UserDefaults.standard.removeObject(forKey: "detailList")
        UserDefaults.standard.removeObject(forKey: "checkList")
        UserDefaults.standard.removeObject(forKey: "priceList")
    }
}
