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
}

extension Endpoints: Endpoint {
    
    var base: String {
        return "https://api.ciceksepeti.com"
        
    }

    var path: String {
        switch self {
        case .list: return "/v1/product/ch/dynamicproductlist"
        }
    }
    
}
