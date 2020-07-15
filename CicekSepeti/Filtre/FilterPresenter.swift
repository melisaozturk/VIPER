//
//  FilterPresenter.swift
//  CicekSepeti
//
//  Created by melisa öztürk on 15.07.2020.
//  Copyright © 2020 melisa öztürk. All rights reserved.
//


import Foundation
import UIKit

class FilterPresenter: FilterViewToPresenterProtocol {
   
    var view: FilterPresenterToViewProtocol?
    var interactor: FilterPresenterToInteractorProtocol?
    var wireframe: FilterPresenterToWireframeProtocol?
    
    func startFetchingData() {
        interactor?.getData()
    }
    
    func showListController(navigationController: UINavigationController, data: Any?) {
        wireframe?.pushToListPage(navigationController: navigationController, data: data)
       }
}

extension FilterPresenter: FilterInteractorToPresenterProtocol {
    func filterFetchedSuccess(listModelArray: [RootObject]) {
        view?.showList(listArray: listModelArray)
    }
    
    func filterFetchFailed() {
        view?.showError()
    }
    
    
}


