//
//  RegistrationViewController.swift
//  Shop
//
//  Created by Apple on 16.12.2023.
//

import UIKit

class RegistrationViewController: UIViewController {

    @IBOutlet weak var create: UILabel!
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var login: UIButton!
    @IBOutlet weak var alertLabel: UILabel!
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        login.addTarget(self, action: #selector(openLoginPage), for: .touchUpInside)
    }
            
    @objc func openLoginPage() {
        let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginPage") as! LoginViewController
        
        let navigationController = UINavigationController(rootViewController: loginVC)
        navigationController.modalPresentationStyle = .fullScreen
                    
        present(navigationController, animated: true, completion: nil)
    }
    
    @IBAction func createButtDidTap(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(hideAlert), userInfo: nil, repeats: false)

        if let name = nameTextField.text, !name.isEmpty,
           let phone = phoneTextField.text, !phone.isEmpty,
           let password = passwordTextField.text, !password.isEmpty {
                
            let passwordRegex = "^(?=.*[a-z]).{8,}$"
            let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
                
            if passwordPredicate.evaluate(with: password) {
                // Store the registered user in UserDefaults
                let registeredUser = User(name: name, phone: phone, password: password)
                storeUser(user: registeredUser)

                alertLabel.text = "Great!"
                
//                let userVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "UserViewController") as! UserViewController
//                userVC.user = registeredUser
//                navigationController?.pushViewController(userVC, animated: true)
                
            } else {
                alertLabel.text = "Password must include at least 8 characters and 1 digit"
            }
                
        } else {
            alertLabel.text = "Please fill in all fields."
        }
        
        let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginPage") as! LoginViewController
        
        let navigationController = UINavigationController(rootViewController: loginVC)
        navigationController.modalPresentationStyle = .fullScreen
                    
        present(navigationController, animated: true, completion: nil)
        
    }
    
    @objc private func hideAlert() {
        alertLabel.text = ""
    }
    
    private func storeUser(user: User) {
        UserDefaults.standard.set(user.name, forKey: "registeredUserName")
        UserDefaults.standard.set(user.phone, forKey: "registeredUserPhone")
        UserDefaults.standard.set(user.password, forKey: "registeredUserPassword")
    }

}
