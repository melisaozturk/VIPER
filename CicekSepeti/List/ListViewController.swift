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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(false, animated: false)
        UIManager.shared().showLoading(view: self.view)
        presenter?.startFetchingData()
        registerTableView()
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
            self.products.append(contentsOf: (product.resultObject.data?.products)!)
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
        if !self.products.isEmpty {
         cell.setData(data: self.products[indexPath.row])
            cell.selectionStyle = .none
        }
        return cell
    }
    
}
