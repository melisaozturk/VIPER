//
//  Endpoints.swift
//  CicekSepeti
//
//  Created by melisa öztürk on 14.07.2020.
//  Copyright © 2020 melisa öztürk. All rights reserved.
//

import Foundation

enum Endpoints {
    case list
    case filter
}

extension Endpoints: Endpoint {
    
    var base: String {
        return "https://api.ciceksepeti.com"
        
    }

    var path: String {
        switch self {
        case .list: return "/v1/product/ch/dynamicproductlist"
        case .filter: return "/v1/product/ch/dynamicproductlist"
        }
    }
    
   //        https://api.ciceksepeti.com/v1/product/ch/dynamicproductlist?detailList=2007217&detailList=2007124&priceList=1

    var queryItem: [URLQueryItem] {
        switch self {
        case .list:
            return [URLQueryItem(name: "", value: "")]
        case .filter:
            let id = UserDefaults.standard.integer(forKey: "id")
                return [URLQueryItem(name: "id", value: String(describing: id))]
        }
    }
    
}
