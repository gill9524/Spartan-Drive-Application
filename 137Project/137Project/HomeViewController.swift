//
//  HomeViewController.swift
//  137Project
//
//  Created by Amrinder Gill on 3/26/18.
//  Copyright © 2018 Amrinder Gill. All rights reserved.
//

import UIKit


class HomeViewController: UIViewController {

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //****************NOT************USING***********CLOUDKIT****************************//
    
    
//    let database = CKContainer.default().privateCloudDatabase
//
//    var counter: Int = 0
//
//    var notes = [CKRecord]()
//
//    @IBAction func addToDatabase(_ sender: UIBarButtonItem) {
//        counter += 1
//        let record = CKRecord(recordType: "Note")
//
//        record.setValue(String(counter), forKeyPath: "content")
//
//        database.save(record) { (record, error) in
//            guard error == nil else { return print("Error")}
//            print("saved successfully")
//
//        }
//    }
//
//    @IBAction func queryDatabase(_ sender: UIBarButtonItem) {
//
//        let query = CKQuery(recordType: "Note", predicate: NSPredicate(value: true))
//        database.perform(query, inZoneWith: nil) { (records, error) in
//            guard error == nil else { return }
//            self.notes = records!
//            for record in self.notes{
//                print(record.value(forKey: "content"))
//            }
//        }
//    }
//
//    @IBAction func removeFromDatabase(_ sender: UIBarButtonItem) {
//        let lastNote = self.notes.last
//        guard lastNote != nil else { return }
//        database.delete(withRecordID: (lastNote?.recordID)!) { (_, error) in
//            guard error == nil else { return }
//            let lastIndex = self.notes.count - 1
//            self.notes.remove(at: lastIndex)
//            print("deleted successfully.")
//        }
//    }
    
    

  

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
