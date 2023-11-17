//
//  RegisterController.swift
//  NewsApp
//
//  Created by Zohra Guliyeva on 11/11/23.
//

import UIKit

class RegisterController: UIViewController {

    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBAction func registerButton(_ sender: Any) {
    }
    @IBOutlet weak var registerView: UIButton!
    
    var onLogin: ((String?, String?) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configRegister()
    }
    
   
}

extension RegisterController {
    func configRegister() {
        //name
        nameTextfield.layer.cornerRadius = 20
        nameTextfield.layer.masksToBounds = true
        nameTextfield.layer.borderColor = UIColor.black.cgColor
        nameTextfield.layer.borderWidth = 1
        let paddingViewName = UIView(frame: CGRectMake(0, 0, 15, self.nameTextfield.frame.height))
        nameTextfield.leftView = paddingViewName
        nameTextfield.leftViewMode = UITextField.ViewMode.always
        //email
        emailTextField.layer.cornerRadius = 20
        emailTextField.layer.masksToBounds = true
        emailTextField.layer.borderColor = UIColor.black.cgColor
        emailTextField.layer.borderWidth = 1
        let paddingViewEmail = UIView(frame: CGRectMake(0, 0, 15, self.emailTextField.frame.height))
        emailTextField.leftView = paddingViewEmail
        emailTextField.leftViewMode = UITextField.ViewMode.always
        //password
        passwordTextField.layer.cornerRadius = 20
        passwordTextField.layer.masksToBounds = true
        passwordTextField.layer.borderColor = UIColor.black.cgColor
        passwordTextField.layer.borderWidth = 1
        let paddingViewPass = UIView(frame: CGRectMake(0, 0, 15, self.passwordTextField.frame.height))
        passwordTextField.leftView = paddingViewPass
        passwordTextField.leftViewMode = UITextField.ViewMode.always
        //button
        registerView.layer.cornerRadius = 28
        registerView.layer.masksToBounds = true
    }
}
