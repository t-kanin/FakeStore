//
//  HomeViewController.swift
//  FakeStore
//
//  Created by kanin tansirisittikul on 21/6/2564 BE.
//

import Foundation
import UIKit

class HomeViewController: UIViewController{
    @IBOutlet weak var categoryTable: UITableView!
    
    let category = ["Men's Clothing", "Women's Clothing", "Jewelry","Electronics"]
    let image_name = ["men", "women","jewelry","electronics"]
    
    override func viewDidLoad() {
        categoryTable.dataSource = self
        categoryTable.delegate = self
        //categoryTable.isHidden = true
    }
}

extension HomeViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return category.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeViewCell", for: indexPath) as! HomeCell
        cell.selectionStyle = .none;
        cell.titleLabel.text = category[indexPath.row]
        cell.imageViewCell.image = UIImage(named:image_name[indexPath.row])
        return cell
    }
}

extension HomeViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "ProductViewController") as? ProductViewController{
            if(indexPath.row == 0){vc.category = CategoryKeys.men_cloth}
            else if(indexPath.row == 1){vc.category = CategoryKeys.women_cloth}
            else if(indexPath.row == 2){vc.category = CategoryKeys.jewelery}
            else{vc.category = CategoryKeys.electronics}
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
