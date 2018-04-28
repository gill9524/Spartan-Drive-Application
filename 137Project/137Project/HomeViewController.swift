//
//  HomeViewController.swift
//  137Project
//
//  Created by Amrinder Gill on 3/26/18.
//  Copyright © 2018 Amrinder Gill. All rights reserved.
//

import UIKit
import Firebase
import MobileCoreServices


class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBOutlet weak var myImageView: UIImageView!
    
   //Get uid
    let userID = Auth.auth().currentUser!.uid
    var fileName = ""
    
    //Image picker action
    @IBAction func uploadClicked(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.mediaTypes = [kUTTypeImage as String, kUTTypeMovie as String]
        imagePicker.delegate = (self as! UIImagePickerControllerDelegate & UINavigationControllerDelegate)
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func downloadClicked(_ sender: UIButton) {
        //Create reference for file to be downloaded
        let storageRef = Storage.storage().reference().child("\(userID)").child("\(fileName)")
        
        //Start download
        storageRef.getData(maxSize: 5 * 1024 * 1024) { data, error in
            if error != nil {
                self.displayAlert(userMessage: "Error downloading file. Try Again.")
            }
            else {
                let image = UIImage(data: data!)
                self.myImageView.image = image!
                self.displayAlert(userMessage: "Download successful!")
            }
        }
    }

    @IBAction func handleLogout(_ sender: UIButton) {
        try! Auth.auth().signOut()
        displayAlert(userMessage: "Signing Out")
        self.performSegue(withIdentifier: "SignOutSegue", sender: nil)
    }
    
    //Start image upload to firebase
    func uploadImageToFirebaseStorage(data: NSData)
    {
        //let imageName = StoredFilesViewController()
        
        displayAlertInput()
        //Set reference path
        let storageRef = Storage.storage().reference().child("\(userID)").child("\(fileName)")
        
        let uploadMetaData = StorageMetadata()
        uploadMetaData.contentType = "image/jpeg"
        storageRef.putData(data as Data, metadata: uploadMetaData) { (metadata, error) in
            if(error != nil) {
                print("Error received \(String(describing: error?.localizedDescription))")
            } else {
                //let name = self.fileName
                //imageName.storeImageNames(imageNames: name)
                print("Upload Completed, Here is the metadata \(String(describing: metadata))")
            }
        }
        
        //Monitor progress of upload if wanted
        //        uploadTask.observe(.progress) { [weak self] (snapshot) in
        //            guard let strongSelf = self else { return }
        //            guard let progress = snapshot.progress else {return}
        //            //strongSelf.progressView.progress = Float(progress.fractionCompleted)
        //        }
    }
    
    //If uploading videos
    func uploadMovieToFirebaseStorage(url: NSURL)
    {
        displayAlertInput()
        //Set reference path
        let storageRef = Storage.storage().reference().child("\(userID)").child("\(fileName)")
        let uploadMetaData = StorageMetadata()
        uploadMetaData.contentType = "video/quicktime"
        storageRef.putFile(from: url as URL, metadata: uploadMetaData) { (metadata, error) in
            if(error != nil) {
                print("Error uploading")
            } else {
                print("Upload completed, Meta data: \(String(describing: metadata))")
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
    
    //Displays an alert message for user to input file name
    func displayAlertInput() -> Void {
        
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Uploading", message: "Enter a name for the file", preferredStyle: .alert)
            
            alert.addTextField { (textField) in
                textField.text = ""
            }
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {[weak alert] (_) in
                let textField = alert?.textFields![0]
                self.fileName = (textField?.text)!
            }))
            
            self.present(alert, animated: true, completion: nil)
        }
    }
}

//Extension for the image picker
extension HomeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let mediaType: String = info[UIImagePickerControllerMediaType] as? String else {
            dismiss(animated: true, completion: nil)
            return
        }
        
        if mediaType == (kUTTypeImage as String) {
            if let originalImage = info[UIImagePickerControllerOriginalImage] as? UIImage,
                let imageData = UIImageJPEGRepresentation(originalImage, 0.8) {
                uploadImageToFirebaseStorage(data: imageData as NSData)
            }
        } else if mediaType == (kUTTypeMovie as String) {
            if let movieURL = info[UIImagePickerControllerMediaURL] as? NSURL {
                uploadMovieToFirebaseStorage(url: movieURL)
            }
        }
        dismiss(animated: true, completion: nil)
    }
}
    



