//
//  FavouritesTableViewCell.swift
//  Shop
//
//  Created by Apple on 19.12.2023.
//

import UIKit

class FavouritesTableViewCell: UITableViewCell {

    @IBOutlet weak var favouritesName: UILabel!
    @IBOutlet weak var favouritesPrice: UILabel!
    @IBOutlet weak var favouritesImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with product: Product) {
            favouritesName.text = product.name
            favouritesPrice.text = product.price
            favouritesImage.image = UIImage(named: product.imageName)
        }
    
}
