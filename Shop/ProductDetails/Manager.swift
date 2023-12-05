//
//  Manager.swift
//  Shop
//
//  Created by Apple on 19.12.2023.
//

import Foundation

class LikedProductsManager {
    static let shared = LikedProductsManager()
    var likedProducts: [Product] = []

    private init() {}
}
