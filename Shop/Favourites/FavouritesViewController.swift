//
//  FavouritesViewController.swift
//  Shop
//
//  Created by Apple on 17.12.2023.
//

import UIKit

class FavouritesViewController: UIViewController, UITableViewDelegate {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        NotificationCenter.default.addObserver(self, selector: #selector(updateLikedProducts), name: Notification.Name("LikedProductsUpdated"), object: nil)
        setupTableView()
    }
    
    private func setupTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(.init(nibName: String(describing: FavouritesTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: FavouritesTableViewCell.self))
    }

    
    // Selector method to handle the notification
        @objc private func updateLikedProducts() {
            // Reload the table view data when liked products are updated
            tableView.reloadData()
        }
}

extension FavouritesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return LikedProductsManager.shared.likedProducts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FavouritesTableViewCell.self), for: indexPath) as? FavouritesTableViewCell else {
            return UITableViewCell()
        }

        let likedProduct = LikedProductsManager.shared.likedProducts[indexPath.row]
        cell.configure(with: likedProduct)

        return cell
    }
}
