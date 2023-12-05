//
//  Protocol.swift
//  Shop
//
//  Created by Apple on 10.12.2023.
//

import Foundation

protocol CategorySelectionDelegate: AnyObject {
    func didSelectCategory(_ category: Category)
}
