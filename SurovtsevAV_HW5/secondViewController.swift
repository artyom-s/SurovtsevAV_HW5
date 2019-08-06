//
//  secondViewController.swift
//  SurovtsevAV_HW5
//
//  Created by Артем on 06/08/2019.
//  Copyright © 2019 Артем. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {

    @IBOutlet var newUserNameTF: UITextField!
    @IBOutlet var newPasswordTF: UITextField!
    
    var newUserName: String? = ""
    var newPassword: String? = ""
    
    @IBAction func enteringNewUserName() {
    }
    @IBAction func enteringNewPassword() {
    }
    
    
    @IBAction func saveChangesButton() {
        if newPasswordTF.text == "" || newUserNameTF.text == "" {
            showAlert(title: "Error", message: "Please, enter new User name and Password")
        }
        newUserName = newPasswordTF.text
        newPassword = newPasswordTF.text
        showAlert(title: "", message: "User name and password was successfully changed")
        }
    }

// Alert control

extension secondViewController {
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
