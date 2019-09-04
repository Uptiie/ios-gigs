//
//  LoginViewController.swift
//  gigsApp
//
//  Created by Uptiie on 6/19/19.
//  Copyright © 2019 Walcenberg, Inc. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    var apiController: APIController?
    var loginType = LoginType.singUp

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func nameLoginTextField(_ sender: Any) {
    }
    @IBAction func passwordLoginTextField(_ sender: Any) {
    }
    @IBAction func loginButtonPressed(_ sender: Any) {
    }
    @IBAction func loginSignUpSegment(_ sender: Any) {
    }

}
