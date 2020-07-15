//
//  FilterWireframe.swift
//  CicekSepeti
//
//  Created by melisa öztürk on 15.07.2020.
//  Copyright © 2020 melisa öztürk. All rights reserved.
//

import Foundation
import UIKit

class FilterWireframe: FilterPresenterToWireframeProtocol {
  
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    static func createFilterModule() -> FilterViewController {
        let filterVC = mainStoryboard.instantiateViewController(withIdentifier: "FilterViewController") as! FilterViewController
        
        let interactor: FilterPresenterToInteractorProtocol = FilterInteractor()
        let wireframe: FilterPresenterToWireframeProtocol = FilterWireframe()
        let presenter: FilterViewToPresenterProtocol & FilterInteractorToPresenterProtocol = FilterPresenter()
        
        filterVC.presenter = presenter
        presenter.wireframe = wireframe
        presenter.view = filterVC
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return filterVC
    }

}


