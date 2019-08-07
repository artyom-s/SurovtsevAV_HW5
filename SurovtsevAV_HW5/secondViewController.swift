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
    @IBOutlet var saveButton: UIButton!
    @IBOutlet var mainView: UIView!
    
    var newUserName: String = ""
    var newPassword: String = ""
    
    @IBAction func enteringNewUserName() {
    }
    @IBAction func enteringNewPassword() {
    }
    
    @IBAction func goToMainScreen() {
         performSegue(withIdentifier: "goToMainScreen", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ViewController
        if newUserName != "" {
            destinationVC.enteredUserName = newUserName
        }
        if newPassword != "" {
        destinationVC.enteredPassword = newPassword
        }
    }
    
    // Save new User name and Password    
    @IBAction func saveChangesButton() {
        if newPasswordTF.text == "" || newUserNameTF.text == "" {
            showAlert(title: "Error", message: "Please, enter new User name and Password")
        } else {
            newUserName = newUserNameTF.text!
            newPassword = newPasswordTF.text!
        showAlert(title: "👍", message: "User name and password was successfully changed")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.layer.cornerRadius = 20
        mainView.layer.cornerRadius = 20
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
