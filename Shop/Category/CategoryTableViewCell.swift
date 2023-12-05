//
//  CategoryTableViewCell.swift
//  Shop
//
//  Created by Apple on 10.12.2023.
//

import UIKit

final class CategoryTableViewCell: UITableViewCell {

    @IBOutlet private weak var categNameLabel: UILabel!
    @IBOutlet private weak var categImage: UIImageView!
    
    func configure(from post: Category){
        categNameLabel.text = post.name
        categImage.image = UIImage(named: post.imageName)
    }
    
}
