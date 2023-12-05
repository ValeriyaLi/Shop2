//
//  HomepageViewController.swift
//  Jewerly_Store
//
//  Created by Юлия Цой on 02.12.2023.
//

import UIKit

class HomepageViewController: UIViewController {
    
    @IBOutlet weak var category1ImageView: UIImageView!
    @IBOutlet weak var category2ImageView: UIImageView!
    @IBOutlet weak var category3ImageView: UIImageView!
    @IBOutlet weak var category4ImageView: UIImageView!
    
    @IBOutlet weak var viewImages: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupImageView(viewImages, categoryName: "Categories")
        


    }
    
    @IBAction func shopButtonDidTap(_ sender: UIButton) {
        if let categoryNavigationVC = storyboard?.instantiateViewController(withIdentifier: "CategoryNavigation") as? UINavigationController{
           if let categoryViewController = categoryNavigationVC.topViewController as? CategoryViewController {
               self.present(categoryNavigationVC, animated:true, completion: nil)
               }
            }
    }
    
    @IBAction func seeAllButtonDidTap(_ sender: UIButton) {
        if let categoryNavigationVC = storyboard?.instantiateViewController(withIdentifier: "CategoryNavigation") as? UINavigationController{
           if let categoryViewController = categoryNavigationVC.topViewController as? CategoryViewController {
               self.present(categoryNavigationVC, animated:true, completion: nil)
               }
            }
    }
    
    func setupImageView(_ views: UIView, categoryName: String) {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        views.addGestureRecognizer(tapGesture)
        views.isUserInteractionEnabled = true
        views.tag = 0
    }
    
    @objc func imageTapped(sender: UITapGestureRecognizer) {
        let categoryVC = storyboard?.instantiateViewController(withIdentifier: "CatViewController") as! CategoryViewController
        navigationController?.pushViewController(categoryVC, animated: true)
        
    }
    


}
