//
//  ProductListTableViewCell.swift
//  Shop
//
//  Created by Apple on 10.12.2023.
//

import UIKit

class ProductListTableViewCell: UITableViewCell {

    @IBOutlet weak var productListName: UILabel!
    
    @IBOutlet weak var productListImage: UIImageView!
    
    
    @IBOutlet weak var productListPrice: UILabel!
    
    
    func configure(from post: Product){
        productListName.text = post.name
        productListPrice.text = post.price
        productListImage.image = UIImage(named: post.imageName)
    }
}
