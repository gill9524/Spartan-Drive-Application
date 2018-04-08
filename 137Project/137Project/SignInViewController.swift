//
//  SignInViewController.swift
//  137Project
//
//  Created by Amrinder Gill on 3/26/18.
//  Copyright © 2018 Amrinder Gill. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    //Outlets
    
    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    //Actions
    
    @IBAction func signInButtonTapped(_ sender: UIButton) {
        //Validate required fields
        if(emailAddressTextField.text?.isEmpty)! || (passwordTextField.text?.isEmpty)!
        {
            //Display Error fill out all textfields
            displayAlert(userMessage: "All fields are required")
            return
        }
    }
    
    @IBAction func registerButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func forgotPasswordButtonTapped(_ sender: UIButton) {
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
