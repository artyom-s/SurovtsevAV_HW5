//
//  secondViewController.swift
//  SurovtsevAV_HW5
//
//  Created by Артем on 06/08/2019.
//  Copyright © 2019 Артем. All rights reserved.
//

import UIKit

class secondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var newUserNameTF: UITextField!
    @IBOutlet var newPasswordTF: UITextField!
    @IBOutlet var saveButton: UIButton!
    @IBOutlet var mainView: UIView!
    @IBOutlet var mainLabel: UILabel!
    
    var newUserName: String = ""
    var newPassword: String = ""
    var textToLabel: String = ""
    var dataChanged = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainLabel.text = "Hello, \(textToLabel)! Now You can change User name and Password"
        saveButton.layer.cornerRadius = 20
        mainView.layer.cornerRadius = 20
        
        // TextFields return
        newUserNameTF.delegate = self
        newPasswordTF.delegate = self
    }
    
    // Prepare new User name and Password to main screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goBack" {
        let destinationVC = segue.destination as! ViewController
        if newUserName != "" {
            destinationVC.userName = newUserName
            }
        if newPassword != "" {
            destinationVC.password = newPassword
            }
        }
    }
    
    @IBAction func enteringNewUserName() {
    }
    @IBAction func enteringNewPassword() {
    }
    @IBAction func goToMainScreen() {
//        userNameTF.text = ""
//        passwordTF.text = ""
//         dismiss(animated: true)
//         performSegue(withIdentifier: "goToMainScreen", sender: nil)
    }
    // Save new User name and Password    
    @IBAction func saveChangesButton() {
        if newPasswordTF.text == "" || newUserNameTF.text == "" {
            showAlert(title: "Error", message: "Please, enter new User name and Password")
        } else {
            dataChanged = true
            newUserName = newUserNameTF.text!
            newPassword = newPasswordTF.text!
        showAlert(title: "👍", message: "User name and password was successfully changed")
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
            saveChangesButton() // Main action of Done button on last TF
        }
        return false
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

// Hide Keyboard
extension secondViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
