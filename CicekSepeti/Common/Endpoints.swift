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
            let group = UserDefaults.standard.string(forKey: "group")
            let detailList = UserDefaults.standard.array(forKey: "detailList")  as? [Int] ?? [Int]()
            let checkList = UserDefaults.standard.array(forKey: "checkList")  as? [Int] ?? [Int]()
            let priceList = UserDefaults.standard.array(forKey: "priceList")  as? [Int] ?? [Int]()
            var queryList = [URLQueryItem]()

            if group == "detailList" && detailList.count != 0 {
                for id in detailList {
                    queryList.append(URLQueryItem(name: String(group!), value: String(id)))
                }
            } else if  group == "checkList" && checkList.count != 0 {
                for id in checkList {
                    queryList.append(URLQueryItem(name: String(group!), value: String(id)))
                }
            }  else if group == "priceList" && priceList.count != 0 {
                for id in priceList {
                    queryList.append(URLQueryItem(name: String(group!), value: String(id)))
                }
            }
            UserDefaults.standard.removeObject(forKey: "group")
            UserDefaults.standard.removeObject(forKey: "detailList")
            UserDefaults.standard.removeObject(forKey: "checkList")
            UserDefaults.standard.removeObject(forKey: "priceList")
            return queryList
        }
    }
    
}
