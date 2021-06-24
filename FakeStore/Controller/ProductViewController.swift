//
//  HomeViewController.swift
//  MVVMDemo
//
//  Created by kanin tansirisittikul on 21/6/2564 BE.
//

import Foundation

import UIKit

class ProductViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var fakeStoreService: FakeStoreService!
    var products = [Product]()
    var category: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView(frame: .zero)
        fakeStoreService = FakeStoreService()
        fakeStoreService.getProducts(category) { (response) in
            if let products = response{
                self.products = products
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }else{return}
        }
    }
}

extension ProductViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(products.isEmpty){return 1}
        else{return products.count}
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.selectionStyle = .none;
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.lineBreakMode = .byWordWrapping
        if(products.isEmpty){
            cell.textLabel?.text = "There is no product in the shop"
        }else{cell.textLabel?.text = products[indexPath.row].title}
        return cell
    }
}

extension ProductViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "SingleProductViewController") as? SingleProductViewController{
            vc.product = products[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

