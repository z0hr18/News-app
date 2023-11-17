//
//  LoginController.swift
//  NewsApp
//
//  Created by Zohra Guliyeva on 11/11/23.
//

import UIKit


class LoginController: UIViewController {
    @IBOutlet weak var loginImage: UIImageView!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBAction func registerButton(_ sender: Any) {
        registrPage()
    }
    @IBAction func loginButton(_ sender: Any) {
    }
    
    @IBOutlet weak var loginView: UIButton!
    
    var userList = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configLogin()
    }
}


extension LoginController {
    
    func  registrPage() {
        let controller = storyboard?.instantiateViewController(withIdentifier: "RegisterController") as! RegisterController
        controller.onLogin = { email, password in
            self.emailTextfield.text = email
            self.passwordTextfield.text = password
          
        }
        navigationController?.show(controller, sender: nil)
    }
    
    func configLogin() {
        //email
        emailTextfield.layer.cornerRadius = 20
        emailTextfield.layer.masksToBounds = true
        emailTextfield.layer.borderColor = UIColor.black.cgColor
        emailTextfield.layer.borderWidth = 1
        let paddingViewEmail = UIView(frame: CGRectMake(0, 0, 15, self.emailTextfield.frame.height))
        emailTextfield.leftView = paddingViewEmail
        emailTextfield.leftViewMode = UITextField.ViewMode.always
        //password
        passwordTextfield.layer.cornerRadius = 20
        passwordTextfield.layer.masksToBounds = true
        passwordTextfield.layer.borderColor = UIColor.black.cgColor
        passwordTextfield.layer.borderWidth = 1
        let paddingViewPass = UIView(frame: CGRectMake(0, 0, 15, self.passwordTextfield.frame.height))
        passwordTextfield.leftView = paddingViewPass
        passwordTextfield.leftViewMode = UITextField.ViewMode.always
        //button
        loginView.layer.cornerRadius = 28
        loginView.layer.masksToBounds = true
    }
    
    func logIn(){
        if let emailLogin = emailTextfield.text,
           let passwordLogin  = passwordTextfield.text,
           !emailLogin.isEmpty,
           !passwordLogin.isEmpty {
            if userList.contains(where: {$0.email == emailLogin && $0.password == passwordLogin}) {
                UserDefaults.standard.set(emailLogin, forKey: "email")
            }
        }
    }
}

