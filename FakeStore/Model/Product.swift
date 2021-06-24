//
//  Product.swift
//  MVVMDemo
//
//  Created by kanin tansirisittikul on 21/6/2564 BE.
//

import Foundation

struct ProductKeys{
    static let title = "title"
    static let price = "price"
    static let description = "description"
    static let category = "category"
    static let image = "image"
}

struct CategoryKeys{
    static let men_cloth = "men's%20clothing"
    static let women_cloth = "women's%20clothing"
    static let electronics = "electronics"
    static let jewelery = "jewelery"
}

class Product{
    let title : String?
    let price: Double?
    let description: String?
    let category: String?
    let image: String?
    init(productDictionary: [String: Any]){
        title = productDictionary[ProductKeys.title] as? String
        price = productDictionary[ProductKeys.price] as? Double
        description = productDictionary[ProductKeys.description] as? String
        category = productDictionary[ProductKeys.category] as? String
        image = productDictionary[ProductKeys.image] as? String
    }
}
