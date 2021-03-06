//
//  ListWireframe.swift
//  CicekSepeti
//
//  Created by melisa öztürk on 14.07.2020.
//  Copyright © 2020 melisa öztürk. All rights reserved.
//


import Foundation
import UIKit

class ListWireframe: PresenterToWireframeProtocol {
  
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    static func createListModule(data: Any?) -> ListViewController {
        let listVC = mainStoryboard.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
        
        let interactor: PresenterToInteractorProtocol = ListInteractor()
        let wireframe: PresenterToWireframeProtocol = ListWireframe()
        let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = ListPresenter()
        
        listVC.presenter = presenter
        presenter.wireframe = wireframe
        presenter.view = listVC
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        if let data = data {
            listVC.products = data as! [Product]
        }
        
        return listVC
    }

    func pushToFilterPage(navigationConroller navigationController: UINavigationController, data: Any?) {
        let detailModule =  FilterWireframe.createFilterModule(data: data)
        navigationController.pushViewController(detailModule,animated: true)
    }
}


