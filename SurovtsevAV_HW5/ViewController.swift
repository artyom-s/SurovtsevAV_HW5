//
//  ViewController.swift
//  SurovtsevAV_HW5
//
//  Created by Артем on 06/08/2019.
//  Copyright © 2019 Артем. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var userNameTF: UITextField!
    var userName = ""
    var enteredUserName = "1"
    
    @IBOutlet var passwordTF: UITextField!
    var password: String! = ""
    var enteredPassword = "1"
    
    @IBOutlet var logInButton: UIButton!

    @IBAction func userNameEntered() {
    }
    @IBAction func passwordEntered() {
    }

    
    // Log in button
    @IBAction func logInthroughButton() {
        enteredUserName = userNameTF.text!
        enteredPassword = passwordTF.text!
        
        if enteredUserName == userName && enteredPassword == password {
            performSegue(withIdentifier: "goToSecondScreen", sender: nil)
            
        } else {
            showAlert(title: "Error", message: "Wrong User name or Password? Please, use hint buttons below")
        }
    }
    
    // Hint buttons
    @IBAction func hintUserNameButton() {
        showAlert (title: "Hint 😛", message: "User name is: «\(userName)»")
    }
    @IBAction func hintPasswordButton() {
        showAlert (title: "Hint 😛", message: "Password is: «\(password!)»")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logInButton.layer.cornerRadius = 20
        
        // New User name and Password
        self.userName = enteredUserName
        self.password = enteredPassword
    }
}

// Alert control
extension ViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
        }
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

