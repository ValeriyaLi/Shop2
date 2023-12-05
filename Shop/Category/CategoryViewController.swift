//
//  CategoryViewController.swift
//  Shop
//
//  Created by Apple on 10.12.2023.
//

import UIKit

final class CategoryViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    private var categoryList: [Category] = Category.makeMock()
    
  
    
    override func viewDidLoad() {
        self.navigationItem.setHidesBackButton(true, animated: true)
        super.viewDidLoad()

        setupTableView()
        
      
    }
    
    private func setupTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(.init(nibName: String(describing: CategoryTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: CategoryTableViewCell.self))
    }
}

extension CategoryViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CategoryTableViewCell.self), for: indexPath) as? CategoryTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(from: categoryList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            performSegue(withIdentifier: "ShowProductList", sender: categoryList[indexPath.row])
        }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowProductList", let productListVC = segue.destination as? ProductListViewController, let selectedCategory = sender as? Category {
            productListVC.selectedCategory = selectedCategory
        }
    }
    
    
}
