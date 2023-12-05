//
//  LoginViewController.swift
//  Shop
//
//  Created by Apple on 16.12.2023.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var signup: UIButton!
    @IBOutlet weak var alertLabel: UILabel!
    @IBOutlet weak var login: UIButton!
    
    var timer = Timer()
    
    var isLog = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        signup.addTarget(self, action: #selector(openRegistrationPage), for: .touchUpInside)
        login.addTarget(self, action: #selector (openHomePage), for: .touchUpInside)
    }
            
    @objc func openRegistrationPage() {
        let regVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RegistrationPage") as! RegistrationViewController
        
        let navigationController = UINavigationController(rootViewController: regVC)
        navigationController.modalPresentationStyle = .fullScreen
                    
        present(navigationController, animated: true, completion: nil)
    }
    
    @IBAction func loginButtDidTap(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(hideAlert), userInfo: nil, repeats: false)
        
        if let storedUserPhone = UserDefaults.standard.string(forKey: "registeredUserPhone"),
           let storedUserPassword = UserDefaults.standard.string(forKey: "registeredUserPassword"),
           
           let enteredPhone = phoneTextField.text,
           let enteredPassword = passwordTextField.text,enteredPhone == storedUserPhone && enteredPassword == storedUserPassword {
                
            alertLabel.text = "Success!"
            isLog = true
        }
        else {
            alertLabel.text = "Invalid credentials."
            isLog = false
        }
        
        
        ///
    }
    
    @objc private func hideAlert() {
        alertLabel.text = ""
    }
    
    @objc private func openHomePage(){
        if isLog {
            if let tabBarController = storyboard?.instantiateViewController(withIdentifier: "TabBarController") as? UITabBarController {
                navigationController?.pushViewController(tabBarController, animated: true)

            }
        }
        else {
            alertLabel.text = "Enter credentials to login."
        }
    }
//    @objc private func openHomePage() {
//        if isLog {
//            if let tabBarController = storyboard?.instantiateViewController(withIdentifier: "TabBarController") as? UITabBarController {
//                navigationController?.setViewControllers([tabBarController], animated: true)
//            }
//        } else {
//            alertLabel.text = "Enter credentials to login."
//        }
//    }

}
