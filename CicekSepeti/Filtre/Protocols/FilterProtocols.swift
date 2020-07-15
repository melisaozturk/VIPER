//
//  FilterProtocols.swift
//  CicekSepeti
//
//  Created by melisa öztürk on 15.07.2020.
//  Copyright © 2020 melisa öztürk. All rights reserved.
//

import Foundation
import UIKit

protocol FilterViewToPresenterProtocol: class{
    
    var view: FilterPresenterToViewProtocol? {get set}
    var interactor: FilterPresenterToInteractorProtocol? {get set}
    var wireframe: FilterPresenterToWireframeProtocol? {get set}
    func startFetchingData()
    func showListController(navigationController:UINavigationController, data: Any?)

}

protocol FilterPresenterToViewProtocol: class{
    func showList(listArray: [RootObject])
    func showError()
}

protocol FilterPresenterToWireframeProtocol: class {
    static func createFilterModule(data: Any?) -> FilterViewController
    func pushToListPage(navigationController:UINavigationController, data: Any?)
}

protocol FilterPresenterToInteractorProtocol: class {
    var presenter:FilterInteractorToPresenterProtocol? {get set}
    func getData()
}

protocol FilterInteractorToPresenterProtocol: class {
    func filterFetchedSuccess(listModelArray: [RootObject])
    func filterFetchFailed()
}

