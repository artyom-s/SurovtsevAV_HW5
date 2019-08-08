//
//  ViewController.swift
//  SurovtsevAV_HW5
//
//  Created by Артем on 06/08/2019.
//  Copyright © 2019 Артем. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    @IBOutlet var logInButton: UIButton!
    @IBOutlet var mainView: UIView!
    
    var userName = "login"
    var password = "password"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logInButton.layer.cornerRadius = 20
        mainView.layer.cornerRadius = 20
    }

    // Return New user name from second VC
    @IBAction func unwindSegue(segue: UIStoryboardSegue){
        let secondVC = segue.source as! secondViewController
        userNameTF.text = ""
        passwordTF.text = ""
        if secondVC.dataChanged == true {
        userName = secondVC.newUserName
        password = secondVC.newPassword
        }
    }

    // Log in button
    @IBAction func logInthroughButton() {
        if userNameTF.text == userName && passwordTF.text == password {
            performSegue(withIdentifier: "goToSecondScreen", sender: nil)
        } else {
            showAlert(title: "Error", message: "Wrong User name or Password! Please, use hint buttons below")
            passwordTF.text = ""
        }
    }
    
    // Hint buttons
    @IBAction func hintUserNameButton() {
        showAlert (title: "Hint 😛", message: "User name is: «\(userName)»")
    }
    @IBAction func hintPasswordButton() {
        showAlert (title: "Hint 😛", message: "Password is: «\(password)»")
    }

    // User Name to secondVC
    override func  prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSecondScreen" {
            let secondVC = segue.destination as! secondViewController
            secondVC.textToLabel = userName
        }
    }
    
    // TextFields return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let textFieldTag = textField.tag + 1 as Int
        let nextField: UIResponder? = textField.superview?.viewWithTag(textFieldTag)
        if let field: UIResponder = nextField{
            field.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
            logInthroughButton() // Main action of Done button on last TF
        }
        return false
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

// Hide Keyboard
extension ViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
