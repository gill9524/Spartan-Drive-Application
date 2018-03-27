//
//  RegistrationViewController.swift
//  137Project
//
//  Created by Amrinder Gill on 3/26/18.
//  Copyright © 2018 Amrinder Gill. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

   
    //Outlets
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var newEmailTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    //Actions
    @IBAction func cancelRegistrationTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)   //Dismiss registration page
    }
    
    @IBAction func registerButtonTapped(_ sender: UIButton) {
       
        //Validate required fields
        if(firstNameTextField.text?.isEmpty)! || (lastNameTextField.text?.isEmpty)! || (newEmailTextField.text?.isEmpty)! || (newPasswordTextField.text?.isEmpty)! || (confirmPasswordTextField.text?.isEmpty)!
        {
            //Display Error fill out all textfields
            displayAlert(userMessage: "All fields are required")
            return
        }
        
        //Validate password
        if((newPasswordTextField.text?.elementsEqual(confirmPasswordTextField.text!))! != true)
        {
            //Display Password not Matching error
            displayAlert(userMessage: "Password does not match")
            return
        }
        
        //Create Activity Indication
        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
        //Position the acitivty indicatation in the center of the page
        activityIndicator.center = view.center
        
        activityIndicator.hidesWhenStopped = false
        
        //Start activity indication
        activityIndicator.startAnimating()
        
        view.addSubview(activityIndicator)
        
        //TODO:
        //Send HTTP request here to send the information to database
        
        
        
    } //End registrationButtonTapped
    
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
