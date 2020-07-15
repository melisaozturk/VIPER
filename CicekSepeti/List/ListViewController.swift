//
//  ListViewController.swift
//  CicekSepeti
//
//  Created by melisa öztürk on 14.07.2020.
//  Copyright © 2020 melisa öztürk. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    weak var presenter: ViewToPresenterProtocol?
    var products = [Product]()
    var filters = [DynamicFilter]()
    var filteredProducts = [Product]()
    var filtered:  Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationItem.hidesBackButton = true
        UIManager.shared().showLoading(view: self.view)
        presenter?.startFetchingData()
        registerTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        NotificationCenter.default.addObserver(self, selector: #selector(getNotification(_:)), name: Notification.Name("filteredProduct"), object: nil)
//        self.tableView.reloadData()
//        TODO: table scroll top
//        self.tableView.scrollsToTop = true
//        if filtered == nil {
//            presenter?.startFetchingData()
//            filtered = false
//        } else {
//              filtered = true
//        }
    }
    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        NotificationCenter.default.removeObserver(self)
//    }
    
//    @objc func getNotification(_ notification: Notification) {
//        if let dict = notification.userInfo as NSDictionary? {
//            if let data = dict["filtered"] as? Bool {
//                self.filtered = data
//            }
//        }
//    }
    
    @IBAction func btnFilter(_ sender: Any) {
        //        filtered = true
        self.presenter?.showFilterController(navigationController: navigationController!, data: self.filters)
        
        //TODO: Wireframde çağır filter sayfası açılsın.Filtre seçimi yap.  filtrenin grubuna göre request at. Bu sayfadan interactor çağır. viewwillappear'da
        //        self.tableView.reloadData() çağır
//        grup tipine göre seçim id si gönderilecek (DynamicFilter valuesObject array'i)
//        for filtered in filteredProducts {
//            if let id = filtered.productGroupId {
//             UserDefaults.standard.set(id, forKey: "Id")
//            }
//        }
    }
    
    private func registerTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "ListCell", bundle: nil), forCellReuseIdentifier: "ListCell")
    }
}

extension ListViewController:PresenterToViewProtocol{
    
    func showList(listArray: [RootObject]) {
        
        UIManager.shared().removeLoading(view: self.view)
        
        for item in listArray {
            if let product = item.resultObject.data?.products, let filters = item.resultObject.data?.mainFilter?.dynamicFilter {
                self.products.append(contentsOf: product)
                self.filters.append(contentsOf: filters)
            }
        }
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

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as! ListCell
        
//        if filtered {
//            if !self.filteredProducts.isEmpty {
//                cell.setData(data: self.products[indexPath.row])
//                cell.selectionStyle = .none
//            }
//        } else {
            if !self.products.isEmpty {
                cell.setData(data: self.products[indexPath.row])
                cell.selectionStyle = .none
            }
//        }
        return cell
    }
    
}
