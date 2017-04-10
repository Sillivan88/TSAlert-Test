//
//  ViewController.swift
//  Alerts [TEST]
//
//  Created by Thomas Sillmann on 06.04.17.
//  Copyright © 2017 Thomas Sillmann. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var loginAlertController: UIAlertController = {
        let loginAlertController = UIAlertController(title: "Login", message: "Enter your login information.", preferredStyle: .alert)
        loginAlertController.addTextField()
        loginAlertController.addTextField(configurationHandler: { (textField: UITextField) in
            textField.isSecureTextEntry = true
        })
        let loginAction = UIAlertAction(title: "Login", style: .default, handler: { (alertAction: UIAlertAction) in
            if let username = loginAlertController.textFields?[0].text {
                print("Username: \(username)")
            }
            if let password = loginAlertController.textFields?[1].text {
                print("Password: \(password)")
            }
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        loginAlertController.addAction(loginAction)
        loginAlertController.addAction(cancelAction);
        return loginAlertController
    }()
    
    func changeColorActions() -> [UIAlertAction] {
        let redBackgroundColorAction = UIAlertAction(title: "Red", style: .default, handler: { (alertAction: UIAlertAction) in
            self.view.backgroundColor = .red
        })
        let greenBackgroundColorAction = UIAlertAction(title: "Green", style: .default, handler: { (alertAction: UIAlertAction) in
            self.view.backgroundColor = .green
        })
        let blueBackgroundColorAction = UIAlertAction(title: "Blue", style: .default, handler: { (alertAction: UIAlertAction) in
            self.view.backgroundColor = .blue
        })
        return [redBackgroundColorAction, greenBackgroundColorAction, blueBackgroundColorAction]
    }
    
    func addActionsToAlertController(_ alertController: UIAlertController) {
        for action in changeColorActions() {
            alertController.addAction(action)
        }
    }
    
    @IBAction func showAlert(_ sender: Any) {
        let alertController = UIAlertController(title: "Alert", message: "This is an alert.", preferredStyle: .alert)
        addActionsToAlertController(alertController)
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func showActionSheet(_ sender: Any) {
        let actionSheetController = UIAlertController(title: "Action Sheet", message: "This is an action sheet.", preferredStyle: .actionSheet)
        addActionsToAlertController(actionSheetController)
        present(actionSheetController, animated: true, completion: nil)
    }
    
    @IBAction func showLoginAlertController(_ sender: Any) {
        present(loginAlertController, animated: true, completion: nil)
    }
    
}
