//
//  Result.swift
//  CicekSepeti
//
//  Created by melisa öztürk on 14.07.2020.
//  Copyright © 2020 melisa öztürk. All rights reserved.
//

import Foundation

enum Result<T, U> where U: Swift.Error  {
    case success(T)
    case failure(U)
}
