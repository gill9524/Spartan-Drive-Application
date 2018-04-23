//
//  SignInViewController.swift
//  137Project
//
//  Created by Amrinder Gill on 3/26/18.
//  Copyright © 2018 Amrinder Gill. All rights reserved.
//

import UIKit
import Firebase

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
        
        guard let email = emailAddressTextField.text else {return}
        guard let password = passwordTextField.text else {return}
        
        //Validate required fields
        if(emailAddressTextField.text?.isEmpty)! || (passwordTextField.text?.isEmpty)!
        {
            //Display Error fill out all textfields
            displayAlert(userMessage: "All fields are required")
            return
        }
        
        //Authorize user email and password
        Auth.auth().signIn(withEmail: email, password: password) { user, error  in
            if(error == nil && user != nil) {
                self.performSegue(withIdentifier: "SignInSegue", sender: nil)
                
            }
            else {
                self.displayAlert(userMessage: "Invalid username or password")
            }
        }
    }
    
    @IBAction func registerButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "NewAccountSegue", sender: nil)
    }
    
    @IBAction func forgotPasswordButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "ForgotPasswordSegue", sender: nil)
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
