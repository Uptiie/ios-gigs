//
//  LoginViewController.swift
//  gigsApp
//
//  Created by Uptiie on 6/19/19.
//  Copyright © 2019 Walcenberg, Inc. All rights reserved.
//

import UIKit

enum LoginType {
    case signUp
    case signIn
}

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var viewBackground: UIView!
    @IBOutlet weak var loginTypeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var signInButton: UIButton!
    
    var apiController: APIController?
    var loginType = LoginType.signUp

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewBackground.layer.cornerRadius = 14.0
        viewBackground.layer.shadowColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        viewBackground.layer.shadowOffset = .zero
        viewBackground.layer.shadowOpacity = 0.3
        
        signInButton.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        signInButton.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        signInButton.layer.cornerRadius = 14
        
        
        
    }
    @IBAction func buttonTapped(_ sender: Any) {
        
        guard let username = usernameTextField.text,
            let password = passwordTextField.text,
            username != "",
            !password.isEmpty else { return }
        
        let user = User(username: username, password: password)
        
        // perform login or sign up operation based on loginType
        
        if loginType == .signUp {
            signUp(with: user)
        } else {
            signIn(with: user)
        }
    }
    
    func signUp(with user: User) {
        apiController?.signUp(with: user, completion: { (error) in
            
            if let error = error {
                NSLog("Error occurred during sign up: \(error)")
            } else {
                let alert = UIAlertController(title: "Sign Up Successful", message: "Now please log in", preferredStyle: .alert)
                
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                
                alert.addAction(okAction)
                
                DispatchQueue.main.async {
                    self.present(alert, animated: true) {
                        self.loginType = .signIn
                        self.loginTypeSegmentedControl.selectedSegmentIndex = 1
                        self.signInButton.setTitle("Sign In", for: .normal)
                    }
                }
            }
        })
    }
    
    func signIn(with user: User) {
        apiController?.signUp(with: user, completion: { (error) in
            if let error = error {
                NSLog("Error occurred during sign in: \(error)")
            } else {
                DispatchQueue.main.async {
                    self.dismiss(animated: true, completion: nil)
                }
            }
        })
    }
    @IBAction func signInTypeChanged(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            loginType = .signUp
            signInButton.setTitle("Sign Up", for: .normal)
        } else {
            loginType = .signIn
            signInButton.setTitle("Sign In", for: .normal)
        }
    }
}
