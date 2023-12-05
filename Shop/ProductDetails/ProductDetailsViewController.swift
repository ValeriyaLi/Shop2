//
//  ProductDetailsViewController.swift
//  Shop
//
//  Created by Apple on 10.12.2023.
//

import UIKit

class ProductDetailsViewController: UIViewController {

    @IBOutlet weak var likeButton: UIImageView!
    
    @IBOutlet weak var productDetailsImage: UIImageView!
    @IBOutlet weak var productDetailsName: UILabel!
    
    @IBOutlet weak var productDetailsPrice: UILabel!
        
    
    @IBOutlet weak var productDetailsDesc: UITextView!
    
    private var isLiked: Bool = false
    
    private var id: Int = 0
    
    private var productList: [Product] = Product.productList

    
    var selectedProduct: Product = .init(id: 0, name: "", price: "", imageName: "", categoryID: 1, description: "", isLiked: false) {
        didSet {
            isLiked = selectedProduct.isLiked
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView();
        likeButton.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(likeButtonDidTap))
        likeButton.addGestureRecognizer(tap)
    }
    

    private func configureView() {
        productDetailsName?.text = selectedProduct.name
        productDetailsDesc?.text = selectedProduct.description
        productDetailsPrice?.text = selectedProduct.price
        productDetailsImage?.image = UIImage(named: selectedProduct.imageName)
        
        likeButton.image = selectedProduct.isLiked ?  UIImage(systemName: "heart.fill") : UIImage(systemName: "heart")
        
        self.id = selectedProduct.id
        
        print(selectedProduct)
    }
    
     
    @objc private func likeButtonDidTap() {
        if isLiked {
           
            if let index = LikedProductsManager.shared.likedProducts.firstIndex(where: { $0.id == id }) {
                LikedProductsManager.shared.likedProducts.remove(at: index)
            }
        } else {
            
            if let index = productList.firstIndex(where: { $0.id == id }) {
                productList[index].isLiked.toggle()
                LikedProductsManager.shared.likedProducts.append(productList[index])
            }
        }

        isLiked.toggle()
        Product.productList[self.selectedProduct.id - 1].isLiked = !Product.productList[self.selectedProduct.id - 1].isLiked
        print(Product.productList[self.selectedProduct.id - 1])

        likeButton.image = isLiked ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart")

        NotificationCenter.default.post(name: Notification.Name("LikedProductsUpdated"), object: nil)
    }

}
