//
//  ListModel.swift
//  CicekSepeti
//
//  Created by melisa öztürk on 14.07.2020.
//  Copyright © 2020 melisa öztürk. All rights reserved.
//

import Foundation

struct RootObject : Decodable {
    let error : Error?
    let resultObject : ResultObject
    
    enum CodingKeys: String, CodingKey {
        case error = "error"
        case resultObject = "result"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        error = try values.decodeIfPresent(Error.self, forKey: .error)
        resultObject = try values.decodeIfPresent(ResultObject.self, forKey: .resultObject)!
    }
}

struct ResultObject : Decodable {
    let data : Datum?
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent(Datum.self, forKey: .data)
    }
    
}

struct Datum : Decodable {
    
    let backgroundColor : JSONAny?
    let banners : JSONAny?
    let branch : JSONAny?
    let categoryName : JSONAny?
    let filter : JSONAny?
    let hasOldPrice : Bool?
    let isAlternate : Bool?
    let mainFilter : MainFilter?
    let message : JSONAny?
    let productCount : Int?
    let products : [Product]?
    let storeId : JSONAny?
    let subCategoryModel : SubCategoryModel?
    let title : JSONAny?
    
    enum CodingKeys: String, CodingKey {
        case backgroundColor = "backgroundColor"
        case banners = "banners"
        case branch = "branch"
        case categoryName = "categoryName"
        case filter = "filter"
        case hasOldPrice = "hasOldPrice"
        case isAlternate = "isAlternate"
        case mainFilter = "mainFilter"
        case message = "message"
        case productCount = "productCount"
        case products = "products"
        case storeId = "storeId"
        case subCategoryModel = "subCategoryModel"
        case title = "title"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        backgroundColor = try values.decodeIfPresent(JSONAny.self, forKey: .backgroundColor)
        banners = try values.decodeIfPresent(JSONAny.self, forKey: .banners)
        branch = try values.decodeIfPresent(JSONAny.self, forKey: .branch)
        categoryName = try values.decodeIfPresent(JSONAny.self, forKey: .categoryName)
        filter = try values.decodeIfPresent(JSONAny.self, forKey: .filter)
        hasOldPrice = try values.decodeIfPresent(Bool.self, forKey: .hasOldPrice)
        isAlternate = try values.decodeIfPresent(Bool.self, forKey: .isAlternate)
        mainFilter = try values.decodeIfPresent(MainFilter.self, forKey: .mainFilter)
        message = try values.decodeIfPresent(JSONAny.self, forKey: .message)
        productCount = try values.decodeIfPresent(Int.self, forKey: .productCount)
        products = try values.decodeIfPresent([Product].self, forKey: .products)
        storeId = try values.decodeIfPresent(JSONAny.self, forKey: .storeId)
        subCategoryModel = try values.decodeIfPresent(SubCategoryModel.self, forKey: .subCategoryModel)
        title = try values.decodeIfPresent(JSONAny.self, forKey: .title)
    }
    
}

struct SubCategoryModel : Decodable {
    
    let shapeType : Int?
    let subCategoryList : [JSONAny]?
    
    enum CodingKeys: String, CodingKey {
        case shapeType = "shapeType"
        case subCategoryList = "subCategoryList"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        shapeType = try values.decodeIfPresent(Int.self, forKey: .shapeType)
        subCategoryList = try values.decodeIfPresent([JSONAny].self, forKey: .subCategoryList)
    }
    
}

struct Product : Decodable {
    
    let adsModel : JSONAny?
    let code : String?
    let deliveryBadgeText : String?
    let deliveryBadgeType : Int?
    let deliveryChargeMessage : JSONAny?
    let deliveryChargeText : String?
    let entryId : Int?
    let id : Int?
    let image : String?
    let information : String?
    let installment : Bool?
    let installmentText : String?
    let isDiscountAvailable : Bool?
    let isHaveVase : Bool?
    let isHaveVaseText : String?
    let isMarketplace : Bool?
    let isOriginal : Bool?
    let isSubscription : Bool?
    let largeImage : String?
    let link : String?
    let marketplaceBranch : JSONAny?
    let mediumImage : String?
    let mostSellestProduct : Bool?
    let name : String?
    let price : Price?
    let productDeliveryCity : ProductDeliveryCity?
    let productGroupId : Int?
    let productType : Int?
    let reviewCount : Int?
    let reviewRating : Float?
    let smallImage : String?
    let variantCode : String?
    let webLink : String?
    let xlargeImage : String?
    
    enum CodingKeys: String, CodingKey {
        case adsModel = "adsModel"
        case code = "code"
        case deliveryBadgeText = "deliveryBadgeText"
        case deliveryBadgeType = "deliveryBadgeType"
        case deliveryChargeMessage = "deliveryChargeMessage"
        case deliveryChargeText = "deliveryChargeText"
        case entryId = "entryId"
        case id = "id"
        case image = "image"
        case information = "information"
        case installment = "installment"
        case installmentText = "installmentText"
        case isDiscountAvailable = "isDiscountAvailable"
        case isHaveVase = "isHaveVase"
        case isHaveVaseText = "isHaveVaseText"
        case isMarketplace = "isMarketplace"
        case isOriginal = "isOriginal"
        case isSubscription = "isSubscription"
        case largeImage = "largeImage"
        case link = "link"
        case marketplaceBranch = "marketplaceBranch"
        case mediumImage = "mediumImage"
        case mostSellestProduct = "mostSellestProduct"
        case name = "name"
        case price = "price"
        case productDeliveryCity = "productDeliveryCity"
        case productGroupId = "productGroupId"
        case productType = "productType"
        case reviewCount = "reviewCount"
        case reviewRating = "reviewRating"
        case smallImage = "smallImage"
        case variantCode = "variantCode"
        case webLink = "webLink"
        case xlargeImage = "xlargeImage"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        adsModel = try values.decodeIfPresent(JSONAny.self, forKey: .adsModel)
        code = try values.decodeIfPresent(String.self, forKey: .code)
        deliveryBadgeText = try values.decodeIfPresent(String.self, forKey: .deliveryBadgeText)
        deliveryBadgeType = try values.decodeIfPresent(Int.self, forKey: .deliveryBadgeType)
        deliveryChargeMessage = try values.decodeIfPresent(JSONAny.self, forKey: .deliveryChargeMessage)
        deliveryChargeText = try values.decodeIfPresent(String.self, forKey: .deliveryChargeText)
        entryId = try values.decodeIfPresent(Int.self, forKey: .entryId)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        information = try values.decodeIfPresent(String.self, forKey: .information)
        installment = try values.decodeIfPresent(Bool.self, forKey: .installment)
        installmentText = try values.decodeIfPresent(String.self, forKey: .installmentText)
        isDiscountAvailable = try values.decodeIfPresent(Bool.self, forKey: .isDiscountAvailable)
        isHaveVase = try values.decodeIfPresent(Bool.self, forKey: .isHaveVase)
        isHaveVaseText = try values.decodeIfPresent(String.self, forKey: .isHaveVaseText)
        isMarketplace = try values.decodeIfPresent(Bool.self, forKey: .isMarketplace)
        isOriginal = try values.decodeIfPresent(Bool.self, forKey: .isOriginal)
        isSubscription = try values.decodeIfPresent(Bool.self, forKey: .isSubscription)
        largeImage = try values.decodeIfPresent(String.self, forKey: .largeImage)
        link = try values.decodeIfPresent(String.self, forKey: .link)
        marketplaceBranch = try values.decodeIfPresent(JSONAny.self, forKey: .marketplaceBranch)
        mediumImage = try values.decodeIfPresent(String.self, forKey: .mediumImage)
        mostSellestProduct = try values.decodeIfPresent(Bool.self, forKey: .mostSellestProduct)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        price = try values.decodeIfPresent(Price.self, forKey: .price)
        productDeliveryCity = try values.decodeIfPresent(ProductDeliveryCity.self, forKey: .productDeliveryCity)
        productGroupId = try values.decodeIfPresent(Int.self, forKey: .productGroupId)
        productType = try values.decodeIfPresent(Int.self, forKey: .productType)
        reviewCount = try values.decodeIfPresent(Int.self, forKey: .reviewCount)
        reviewRating = try values.decodeIfPresent(Float.self, forKey: .reviewRating)
        smallImage = try values.decodeIfPresent(String.self, forKey: .smallImage)
        variantCode = try values.decodeIfPresent(String.self, forKey: .variantCode)
        webLink = try values.decodeIfPresent(String.self, forKey: .webLink)
        xlargeImage = try values.decodeIfPresent(String.self, forKey: .xlargeImage)
    }
    
}

struct ProductDeliveryCity : Decodable {
    
    let deliveryCityImage : String?
    let isSendToSingleCity : Bool?
    
    enum CodingKeys: String, CodingKey {
        case deliveryCityImage = "deliveryCityImage"
        case isSendToSingleCity = "isSendToSingleCity"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        deliveryCityImage = try values.decodeIfPresent(String.self, forKey: .deliveryCityImage)
        isSendToSingleCity = try values.decodeIfPresent(Bool.self, forKey: .isSendToSingleCity)
    }
    
}

struct Price : Decodable {
    
    let currency : String?
    let currencyCode : String?
    let current : Float?
    let discountPercentage : JSONAny?
    let old : Int?
    let oldTotal : Int?
    let showCurrencyCode : Bool?
    let showDecimalPart : Bool?
    let showFirstPrice : Bool?
    let subscriptionDiscountPercentage : JSONAny?
    let subscriptionPrice : Float?
    let tax : JSONAny?
    let total : Float?
    
    enum CodingKeys: String, CodingKey {
        case currency = "currency"
        case currencyCode = "currencyCode"
        case current = "current"
        case discountPercentage = "discountPercentage"
        case old = "old"
        case oldTotal = "oldTotal"
        case showCurrencyCode = "showCurrencyCode"
        case showDecimalPart = "showDecimalPart"
        case showFirstPrice = "showFirstPrice"
        case subscriptionDiscountPercentage = "subscriptionDiscountPercentage"
        case subscriptionPrice = "subscriptionPrice"
        case tax = "tax"
        case total = "total"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        currency = try values.decodeIfPresent(String.self, forKey: .currency)
        currencyCode = try values.decodeIfPresent(String.self, forKey: .currencyCode)
        current = try values.decodeIfPresent(Float.self, forKey: .current)
        discountPercentage = try values.decodeIfPresent(JSONAny.self, forKey: .discountPercentage)
        old = try values.decodeIfPresent(Int.self, forKey: .old)
        oldTotal = try values.decodeIfPresent(Int.self, forKey: .oldTotal)
        showCurrencyCode = try values.decodeIfPresent(Bool.self, forKey: .showCurrencyCode)
        showDecimalPart = try values.decodeIfPresent(Bool.self, forKey: .showDecimalPart)
        showFirstPrice = try values.decodeIfPresent(Bool.self, forKey: .showFirstPrice)
        subscriptionDiscountPercentage = try values.decodeIfPresent(JSONAny.self, forKey: .subscriptionDiscountPercentage)
        subscriptionPrice = try values.decodeIfPresent(Float.self, forKey: .subscriptionPrice)
        tax = try values.decodeIfPresent(JSONAny.self, forKey: .tax)
        total = try values.decodeIfPresent(Float.self, forKey: .total)
    }
    
}

struct MainFilter : Decodable {
    
    let dynamicFilter : [DynamicFilter]?
    let sort : [Sort]?
    
    enum CodingKeys: String, CodingKey {
        case dynamicFilter = "dynamicFilter"
        case sort = "sort"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        dynamicFilter = try values.decodeIfPresent([DynamicFilter].self, forKey: .dynamicFilter)
        sort = try values.decodeIfPresent([Sort].self, forKey: .sort)
    }
    
}

struct Sort : Decodable {
    
    let count : Int?
    let detailValueId : Int?
    let filterQueryString : JSONAny?
    let group : Int?
    let icon : JSONAny?
    let id : Int?
    let link : String?
    let name : String?
    let selected : Bool?
    
    enum CodingKeys: String, CodingKey {
        case count = "count"
        case detailValueId = "detailValueId"
        case filterQueryString = "filterQueryString"
        case group = "group"
        case icon = "icon"
        case id = "id"
        case link = "link"
        case name = "name"
        case selected = "selected"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        count = try values.decodeIfPresent(Int.self, forKey: .count)
        detailValueId = try values.decodeIfPresent(Int.self, forKey: .detailValueId)
        filterQueryString = try values.decodeIfPresent(JSONAny.self, forKey: .filterQueryString)
        group = try values.decodeIfPresent(Int.self, forKey: .group)
        icon = try values.decodeIfPresent(JSONAny.self, forKey: .icon)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        link = try values.decodeIfPresent(String.self, forKey: .link)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        selected = try values.decodeIfPresent(Bool.self, forKey: .selected)
    }
    
}

struct DynamicFilter : Decodable {
    
    let clearLink : JSONAny?
    let detailId : Int?
    let filterBehaviour : Int?
    let filterType : Int?
    let id : Int?
    let isMainCategory : Bool?
    let isReload : Bool?
    let isRemovableDetail : Bool?
    let name : String?
    let sequence : Int?
    let urlTag : JSONAny?
    let valuesObject : [Value]?
    
    enum CodingKeys: String, CodingKey {
        case clearLink = "clearLink"
        case detailId = "detailId"
        case filterBehaviour = "filterBehaviour"
        case filterType = "filterType"
        case id = "id"
        case isMainCategory = "isMainCategory"
        case isReload = "isReload"
        case isRemovableDetail = "isRemovableDetail"
        case name = "name"
        case sequence = "sequence"
        case urlTag = "urlTag"
        case valuesObject = "values"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        clearLink = try values.decodeIfPresent(JSONAny.self, forKey: .clearLink)
        detailId = try values.decodeIfPresent(Int.self, forKey: .detailId)
        filterBehaviour = try values.decodeIfPresent(Int.self, forKey: .filterBehaviour)
        filterType = try values.decodeIfPresent(Int.self, forKey: .filterType)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        isMainCategory = try values.decodeIfPresent(Bool.self, forKey: .isMainCategory)
        isReload = try values.decodeIfPresent(Bool.self, forKey: .isReload)
        isRemovableDetail = try values.decodeIfPresent(Bool.self, forKey: .isRemovableDetail)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        sequence = try values.decodeIfPresent(Int.self, forKey: .sequence)
        urlTag = try values.decodeIfPresent(JSONAny.self, forKey: .urlTag)
        valuesObject = try values.decodeIfPresent([Value].self, forKey: .valuesObject)
    }
    
}

struct Value : Decodable {
    
    let count : Int?
    let detailValueId : Int?
    let filterQueryString : JSONAny?
    let group : Int?
    let icon : JSONAny?
    let id : Int?
    let link : String?
    let name : String?
    let selected : Bool?
    
    enum CodingKeys: String, CodingKey {
        case count = "count"
        case detailValueId = "detailValueId"
        case filterQueryString = "filterQueryString"
        case group = "group"
        case icon = "icon"
        case id = "id"
        case link = "link"
        case name = "name"
        case selected = "selected"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        count = try values.decodeIfPresent(Int.self, forKey: .count)
        detailValueId = try values.decodeIfPresent(Int.self, forKey: .detailValueId)
        filterQueryString = try values.decodeIfPresent(JSONAny.self, forKey: .filterQueryString)
        group = try values.decodeIfPresent(Int.self, forKey: .group)
        icon = try values.decodeIfPresent(JSONAny.self, forKey: .icon)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        link = try values.decodeIfPresent(String.self, forKey: .link)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        selected = try values.decodeIfPresent(Bool.self, forKey: .selected)
    }
    
}

struct Error : Decodable {
    
    let message : JSONAny?
    let returnUrl : JSONAny?
    let title : JSONAny?
    let type : Int?
    
    enum CodingKeys: String, CodingKey {
        case message = "message"
        case returnUrl = "returnUrl"
        case title = "title"
        case type = "type"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        message = try values.decodeIfPresent(JSONAny.self, forKey: .message)
        returnUrl = try values.decodeIfPresent(JSONAny.self, forKey: .returnUrl)
        title = try values.decodeIfPresent(JSONAny.self, forKey: .title)
        type = try values.decodeIfPresent(Int.self, forKey: .type)
    }
    
}


// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}


class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
