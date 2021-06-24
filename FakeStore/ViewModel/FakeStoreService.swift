//
//  Service.swift
//  MVVMDemo
//
//  Created by kanin tansirisittikul on 21/6/2564 BE.
//

import Foundation
import Alamofire

class FakeStoreService{
    let baseUrl: URL?
    
    init(){
        self.baseUrl = URL(string: "https://fakestoreapi.com/products/")
    }
    
    typealias ServiceResponse = ([Product]?) -> Void
    
    /// retrieve all the products from the fake store
    func getAllProducts(completion: @escaping(ServiceResponse)){
        var products = [Product]()
        if let fakeStoreUrl = baseUrl{
            AF.request(fakeStoreUrl).responseJSON { (response) in
                guard let productDictArr = response.value as? [[String: Any]] else{
                    print("no data retrieve")
                    completion(nil)
                    return
                }
                for productDict in productDictArr{
                    let product = Product(productDictionary: productDict)
                    products.append(product)
                }
                completion(products)
            }
        }
    }
    
    /// get products from specific category
    func getProducts(_ category: String, completion: @escaping(ServiceResponse)){
        var products = [Product]()
        if let fakeStoreUrl = URL(string: "\(baseUrl!)category/\(category)"){
            AF.request(fakeStoreUrl).responseJSON { (response) in
                guard let productDictArr = response.value as? [[String: Any]] else{
                    print("cannot retrieve data")
                    completion(nil)
                    return
                }
                for productDict in productDictArr{
                    let product = Product(productDictionary: productDict)
                    products.append(product)
                }
                completion(products)

            }
        }
    }
    
}
