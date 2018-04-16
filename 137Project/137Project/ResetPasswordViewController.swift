//
//  ValidationCodeViewController.swift
//  137Project
//
//  Created by Zelda on 4/15/18.
//  Copyright © 2018 Amrinder Gill. All rights reserved.
//

import UIKit
import Firebase

class ResetPasswordViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    //Outlets
    @IBOutlet weak var emailTextField: UITextField!

    //Actions
    @IBAction func cancelResetTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)       //Dismiss password reset page
    }
    
    @IBAction func getCodeTapped(_ sender: UIButton) {
        guard let email = emailTextField.text else {return}
        
        //validate email field
        if(emailTextField.text?.isEmpty)! {
            displayAlert(userMessage: "Email Required")
        }
        //Send password reset to email
        Auth.auth().sendPasswordReset(withEmail: email) {error in
            if(error == nil){
                self.displayAlert(userMessage: "Password Reset Email Sent")
                
                //Transition to Password reset segue
                self.performSegue(withIdentifier: "ResetPasswordSegue", sender: nil)
            }
            else{
                self.displayAlert(userMessage: "Invalid email")
            }
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

