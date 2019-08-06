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
    var userName: String! = "1"
    var enteredUserName = ""
    
    @IBOutlet var passwordTF: UITextField!
    var password: String! = "1"
    var enteredPassword = ""
    
    @IBAction func userNameEntered() {
    }
    @IBAction func passwordEntered() {
    }
    
    // Log in button
    
    @IBAction func logInButtin() {
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
        showAlert (title: "Hint 😛", message: "User name is: «\(userName!)»")
    }
    @IBAction func hintPasswordButton() {
        showAlert (title: "Hint 😛", message: "Password is: «\(password!)»")
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

//override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//    let controller = segue.destinationViewController as! SecondVC //приводим `destinationViewController` к нужному нам `SecondVC`
//    controller.s = "Woohoo" //s - строковая переменная, которой присваивем "Woohoo"
//}
