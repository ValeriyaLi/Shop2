//
//  product.swift
//  Shop
//
//  Created by Apple on 10.12.2023.
//

import Foundation

struct Product {
    let id: Int
    let name: String
    let price: String
    let imageName: String
    let categoryID: Int 
    let description: String
    var isLiked: Bool
    
    static var productList: [Product] = [
        .init(id: 1, name: "Ring 'Mickey and Minnie Mouse'", price: "54000 kzt", imageName: "r1", categoryID: 1, description: "ASDFGH"),
        .init(id: 2, name: "Ring 'Luxurious radiance'", price: "48000 kzt", imageName: "r2", categoryID: 1, description: "ASDFGH"),
        .init(id: 3, name: "'Red Infinity Circle' Ring", price: "30000 kzt", imageName: "r3", categoryID: 1, description: "ASDFGH"),
        .init(id: 4, name: "Ring 'Sparkling pear-shaped halo'", price: "67000 kzt", imageName: "r4", categoryID: 1, description: "ASDFGH"),
        .init(id: 5, name: "Ring 'Blue Herbarium'", price: "48000kzt", imageName: "r5", categoryID: 1, description: "ASDFGH"),
        .init(id: 6, name: "Ring 'Asymmetrical Herbarium'", price: "55000 kzt", imageName: "r6", categoryID: 1, description: "ASDFGH"),
        .init(id: 7, name: "Earrings 'Blue Herbarium'", price: "34000 kzt", imageName: "e1", categoryID: 2, description: "Sparkling blue “Blue Herbarium” stud earrings. Featuring artificial flower-shaped crystals, these 925 sterling silver stud earrings celebrate the beauty of nature. Alternating blue pear- and marquise-shaped stones surround clear center stones, and the different shapes evoke the natural symmetry found in nature. Gift these Pandora earrings to a nature lover or wear them yourself with other jewelry for a sparkling look."),
        
        .init(id: 8, name: "Earrings 'Sparkling pear-shaped halo'", price: "34900 kzt", imageName: "e2", categoryID: 2, description: "Shine brighter than ever when you wear sparkling stud earrings. These 925 sterling silver stud earrings feature a dramatic pear-shaped stone subtly raised above a delicate pavé halo. A V-shaped setting and two prongs hold the center stone in place. A reimagined classic with plenty of sparkle and dimension, these stud earrings look stunning no matter how you put them together. For someone who loves glamor in your life, this pair would be the perfect gift."),
        .init(id: 9, name: "Pavé chain bracelet", price: "108000 kzt", imageName: "b1", categoryID: 3, description: "Enhance your look with the Pandora Timeless Pavé Chain Bracelet. This 925 sterling silver bracelet features sparkling chain links. The outside of each semicircle is set with three round stones, and the inside of the chain is polished for shine and comfort. The bracelet is secured with a flat square clasp with an engraved Pandora logo. Combining the linear geometry of our iconic chains with sparkling pavé, this sterling silver chain bracelet will always be on trend."),
        
        .init(id: 10, name: "Pendant 'Believe in dreams'", price: "36000 kzt", imageName: "p1", categoryID: 4, description: "Take a trip to the moon with the “Believe in Your Dreams” Charm-Pendant. Crafted from pink lab opal in the shape of a moon, set in a 925 sterling silver pendant, this charm inspires endless dreams. The key, made from an alloy plated with 14K gold, hangs from the tip of the moon, creating a beautiful contrast. Engraved with 'Believe in yourself' - Believe in yourself on the back, wear this charm alone or with your other favorite pieces every day."),
        
        .init(id: 11, name: "Necklace 'Blue sparkling herbarium'", price: "89000 kzt", imageName: "c1", categoryID: 5, description: "Bring the beauty of nature into your look with the Blue Sparkling Herbarium Pendant Necklace. This 925 sterling silver pendant necklace is set with fine blue pear and marquise stones that surround a round center stone. This geometric design was inspired by the shape of petals and leaves. Inspired by the variety of natural shapes, this necklace will add an elegant and unique touch to your everyday look."),
        
        .init(id: 12, name: "Hairpin 'Spikelet'", price: "3000 kzt", imageName: "h1", categoryID: 6, description: "A wonderful piece of jewelry that emphasizes elegance and femininity combined with natural elements and strength.")
    ]

    init(id: Int, name: String, price: String, imageName: String, categoryID: Int, description: String, isLiked: Bool = false) {
        self.id = id
        self.name = name
        self.price = price
        self.imageName = imageName
        self.categoryID = categoryID
        self.description = description
        self.isLiked = isLiked
    }
}


///
extension Product: Equatable {
    static func == (lhs: Product, rhs: Product) -> Bool {
        return lhs.id == rhs.id && lhs.isLiked == rhs.isLiked
    }
}


