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
//    var filteredProducts = [DynamicFilter]()
//    var filtered: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(false, animated: false)
        UIManager.shared().showLoading(view: self.view)
        presenter?.startFetchingData()
        registerTableView()
    }
    
    @IBAction func btnFilter(_ sender: Any) {
//        filtered = true
        self.presenter?.showFilterController(navigationController: navigationController!)
        
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
        for product in listArray {
            if let product = product.resultObject.data?.products {
                self.products.append(contentsOf: product)
            }
        }
        
//        for filtered in listArray {
//            if let filteredData = filtered.resultObject.data?.mainFilter?.dynamicFilter {
//                self.filteredProducts.append(contentsOf: filteredData)
//            }
//        }
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
