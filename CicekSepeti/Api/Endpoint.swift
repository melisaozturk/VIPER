//
//  Endpoint.swift
//  CicekSepeti
//
//  Created by melisa öztürk on 14.07.2020.
//  Copyright © 2020 melisa öztürk. All rights reserved.
//

import Foundation

protocol Endpoint {
    var base: String { get }
    var path: String { get }
    var queryItem: [URLQueryItem] { get }
}

extension Endpoint {
    
    var urlComponents: URLComponents {
        var components = URLComponents(string: base)!
        components.path = path
        components.queryItems = queryItem

        return components
    }
    
    var request: URLRequest {
        let url = urlComponents.url!
        return URLRequest(url: url)
    }
}
