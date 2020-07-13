//
//  ListPresenter.swift
//  CicekSepeti
//
//  Created by melisa öztürk on 14.07.2020.
//  Copyright © 2020 melisa öztürk. All rights reserved.
//

import Foundation
import UIKit

class ListPresenter: ViewToPresenterProtocol {
   
    var view: PresenterToViewProtocol?
    var interactor: PresenterToInteractorProtocol?
    var wireframe: PresenterToWireframeProtocol?
    
    func startFetchingData() {
        interactor?.getData()
    }
    
    func showDetailController(navigationController: UINavigationController, data: Any?) {
        wireframe?.pushToDetailPage(navigationConroller:navigationController, data: data)
    }
}

extension ListPresenter: InteractorToPresenterProtocol {
    func listFetchedSuccess(listModelArray: [RootObject]) {
        view?.showList(listArray: listModelArray)
    }
    
    func listFetchFailed() {
        view?.showError()
    }
    
    
}

