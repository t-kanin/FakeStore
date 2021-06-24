//
//  SingleProductViewController.swift
//  FakeStore
//
//  Created by kanin tansirisittikul on 21/6/2564 BE.
//

import UIKit
import SDWebImage

class SingleProductViewController: UIViewController{
    var product: Product?
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        titleLabel.text = product?.title
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byWordWrapping
        
        descriptionLabel.text = product?.description
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakMode = .byWordWrapping
        
        
        image.sd_setImage(with: URL(string: (product?.image)!), placeholderImage: UIImage(systemName: "photo"), options: .continueInBackground, completed: nil)
    }
}
