//
//  ProductListViewController.swift
//  Shop
//
//  Created by Apple on 10.12.2023.
//

import UIKit

class ProductListViewController: UIViewController {
    

    @IBOutlet weak var tableView: UITableView!
    
    private var productList: [Product] = Product.productList
    
    var selectedCategory: Category? {
        didSet {
            if let selectedCategory = selectedCategory {
                productList = self.productList.filter{ $0.categoryID == selectedCategory.id }
            }
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        productList = Product.productList.filter{ $0.categoryID == self.selectedCategory?.id }
        tableView.reloadData()
        print("reloaded")
   }
    
    private func setupTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(.init(nibName: String(describing: ProductListTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: ProductListTableViewCell.self))
    }


}

extension ProductListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProductListTableViewCell.self), for: indexPath) as? ProductListTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(from: productList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            performSegue(withIdentifier: "ShowProductDetails", sender: productList[indexPath.row])
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowProductDetails", let productDetailsVC = segue.destination as? ProductDetailsViewController, let selectedProduct = sender as? Product {
            productDetailsVC.selectedProduct = selectedProduct
        }
    }
}
