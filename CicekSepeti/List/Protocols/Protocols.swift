//
//  Protocols.swift
//  CicekSepeti
//
//  Created by melisa öztürk on 14.07.2020.
//  Copyright © 2020 melisa öztürk. All rights reserved.
//

import Foundation
import UIKit

protocol ViewToPresenterProtocol: class{
    
    var view: PresenterToViewProtocol? {get set}
    var interactor: PresenterToInteractorProtocol? {get set}
    var wireframe: PresenterToWireframeProtocol? {get set}
    func startFetchingData()
    func showDetailController(navigationController:UINavigationController, data: Any?)
}

protocol PresenterToViewProtocol: class{
    func showList(listArray: [RootObject])
    func showError()
}

protocol PresenterToWireframeProtocol: class {
    static func createListModule() -> ListViewController
    func pushToDetailPage(navigationConroller:UINavigationController, data: Any?)
}

protocol PresenterToInteractorProtocol: class {
    var presenter:InteractorToPresenterProtocol? {get set}
    func getData()
}

protocol InteractorToPresenterProtocol: class {
    func listFetchedSuccess(listModelArray: [RootObject])
    func listFetchFailed()
}

