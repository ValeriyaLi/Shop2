//
//  category.swift
//  Shop
//
//  Created by Apple on 10.12.2023.
//

import Foundation

struct Category {
    let id: Int  // Add this property
    let name: String
    let imageName: String

    init(id: Int, name: String, imageName: String, products: [Product] = []) {
           self.id = id
           self.name = name
           self.imageName = imageName
       }
}

extension Category {
    static func makeMock() -> [Category] {
        return [
            .init(id: 1, name: "Rings", imageName: "rings"),
            .init(id: 2, name: "Earrings", imageName: "earrings"),
            .init(id: 3, name: "Bracelets", imageName: "bracelets"),
            .init(id: 4, name: "Pendunts", imageName: "pendunts"),
            .init(id: 5, name: "Chains", imageName: "chains"),
            .init(id: 6, name: "Hairpins", imageName: "hairpins")
        ]
    }
}
