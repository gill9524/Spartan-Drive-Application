//
//  PasswordResetViewController.swift
//  137Project
//
//  Created by Amrinder Gill on 3/26/18.
//  Copyright © 2018 Amrinder Gill. All rights reserved.
//

import UIKit

class PasswordResetViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

 
    //Outlets
    
    @IBOutlet weak var resetEmailTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var confirmNewPasswordTextField: UITextField!
    
    
    
    //Actions
    
    @IBAction func cancelResetTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)       //Dismiss password reset page
    }
    
    @IBAction func resetPasswordTapped(_ sender: UIButton) {
        //Validate required fields
        if(resetEmailTextField.text?.isEmpty)! || (newPasswordTextField.text?.isEmpty)! || (confirmNewPasswordTextField.text?.isEmpty)!
        {
            //Display Error fill out all textfields
            displayAlert(userMessage: "All fields are required")
            return
        }
    }
    
    
    
    
   
    
    
    //Displays an alert message
    func displayAlert(userMessage:String) -> Void {
        DispatchQueue.main.async {
            let alertControl = UIAlertController(title:"Alert", message: userMessage, preferredStyle: .alert)
            
            let OKAction = UIAlertAction(title: "OK", style: .default)
            { (action:UIAlertAction!) in
                DispatchQueue.main.async {
                    //self.dismiss(animated: true, completion: nil)
                    
                }
                
            }
            alertControl.addAction(OKAction)
            self.present(alertControl, animated: true, completion: nil)
        }
    }

}
