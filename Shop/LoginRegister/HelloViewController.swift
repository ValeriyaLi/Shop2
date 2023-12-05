//
//  HelloViewController.swift
//  Shop
//
//  Created by Apple on 16.12.2023.
//

import UIKit

class HelloViewController: UIViewController {

    @IBOutlet weak var signup: UIButton!
    @IBOutlet weak var login: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //уьлат4уат4
    
    func setupUI() {
        signup.addTarget(self, action: #selector(openRegistrationPage), for: .touchUpInside)
        login.addTarget(self, action: #selector(openLoginPage), for: .touchUpInside)
    }
            
    @objc func openRegistrationPage() {
        let registrationVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RegistrationPage") as! RegistrationViewController

        let navigationController = UINavigationController(rootViewController: registrationVC)
        navigationController.modalPresentationStyle = .fullScreen

        present(navigationController, animated: true, completion: nil)
    }
    
    @objc func openLoginPage(){
        let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginPage") as! LoginViewController
        
        let navigationController = UINavigationController(rootViewController: loginVC)
        navigationController.modalPresentationStyle = .fullScreen
                    
        present(navigationController, animated: true, completion: nil)
    }

    
}
